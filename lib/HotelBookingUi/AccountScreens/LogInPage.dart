import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/SignUpPage.dart';
import 'package:gitson/UserAppUi/SigninPage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Provider/LogicForTappedContainer.dart';
import '../../Services/Onboard.dart';
import 'PanditInfo.dart';
import 'UserInfo.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var isChecked = false;
  final email = TextEditingController();
  final password = TextEditingController();

  bool _obscureText = true;

  // Function to toggle password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          context.go('/signup');
          return Future.value(false);
        },
        child: SingleChildScrollView(
          child: Consumer<LogicContainer>(builder: (context, provider, child) {
            return Stack(
              children: [
                Image.asset(
                  "assets/images/login.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 50.h,
                  left: 20.w,
                  child: IconButton(
                      onPressed: () {
                        context.go('/signup');
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 40,
                        color: Colors.white,
                      )),
                ),
                Positioned(
                  top: 200.h,
                  left: 20.w,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 1.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Card(
                      elevation: 2,
                      color: Colors.white.withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 55.h),
                            child: Text(
                              "Sign in",
                              style: GoogleFonts.roboto(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 18.w, top: 35.h),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextField(
                                controller: email,
                                cursorColor: const Color(0xff0E6B56),
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color: Color(0xff0E6B56),
                                          width: 2,
                                        ))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 18.w, top: 30.h),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextField(
                                obscureText: _obscureText,
                                controller: password,
                                cursorColor: const Color(0xff0E6B56),
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        _togglePasswordVisibility();
                                      },
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color: Color(0xff0E6B56),
                                          width: 2,
                                        ))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 195.0.w, top: 20.h),
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.roboto(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 18.w, top: 30.h),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 56.h,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xff0E6B56)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ))),
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const Center(
                                          child: CircularProgressIndicator(
                                            color: Color(0xff0E6B56),
                                          ),
                                        );
                                      },
                                    );
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                        email: email.text,
                                        password: password.text,
                                      );
                                      var sharedPref =
                                      await SharedPreferences.getInstance();
                                      sharedPref.setBool(
                                          OnboardState.KEYLOGIN, true);
                                      if (provider.tappedContainerIndex == 0) {
                                        context.go('/userInfo');
                                      } else {
                                        context.go('/panditInfo');
                                      }
                                    } on FirebaseAuthException catch (e) {
                                      Navigator.of(context)
                                          .pop(); // Close the progress dialog
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Invalid credentials. Please try again.'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.roboto(fontSize: 17),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 800.h,
                  left: 90.w,
                  child: Row(
                    children: [
                      Text(
                        "Don't have account?",
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 18.0.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/signup');
                        },
                        child: Text(
                          "SignUp",
                          style: GoogleFonts.roboto(
                              color: const Color(0xff0E6B56),
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
