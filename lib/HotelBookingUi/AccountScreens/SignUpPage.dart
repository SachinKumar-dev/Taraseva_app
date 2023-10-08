import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/Provider/LogicForTappedContainer.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  bool isChecked = false;
  final email = TextEditingController();
  final conformPassword = TextEditingController();
  final password = TextEditingController();

  bool _obscureText = true;
  bool _obscureTextTwo = true;

  // Function to toggle password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  // Function to toggle password visibility
  void _togglePasswordVisibilityTwo() {
    setState(() {
      _obscureTextTwo = !_obscureTextTwo;
    });
  }

  //container focus
  late Color color;
  //signup
  void signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor:Color(0xff0E6B56),
          content: Text('SignedUp Successfully'),
          duration: Duration(seconds: 2),
        ),
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Clear all stored data in SharedPreferences
      await prefs.clear();
      Future.delayed(const Duration(seconds: 2), () {
        context.go('/login');
      });
    }  catch (e) {
      String errorMessage = 'Signup failed.';
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email') {
          errorMessage = 'Please enter a valid email to proceed.';
        }
      }
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          errorMessage = 'Email already exists. Please use a different email.';
        }
      }
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          errorMessage = 'Weak Password';
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(errorMessage),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
  @override
  void dispose() {
    // Dispose of the focus nodes to prevent memory leaks
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Consumer<LogicContainer>(
              builder: (context, provider, child) {
                return Stack(children: [
                  Image.asset(
                    "assets/images/img_29.png",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.w),
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.roboto(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                provider.handleTap(0);
                              },
                              child: Card(
                                elevation:
                                    provider.tappedContainerIndex == 0 ? 2 : 0,
                                shadowColor: Colors.green,
                                borderOnForeground: true,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: provider.tappedContainerIndex == 0
                                      ? 205
                                      : 180,
                                  width: provider.tappedContainerIndex == 0
                                      ? 170
                                      : 160,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xff0E6B56),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/logos/user.png",
                                          scale: 5,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          "User",
                                          style: GoogleFonts.roboto(
                                              fontSize: 20.sp,
                                              color: const Color(0xff0E6B56)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ), // End of User Container
                            GestureDetector(
                              onTap: () {
                                provider.handleTap(1);
                              },
                              child: Card(
                                elevation:
                                    provider.tappedContainerIndex == 1 ? 2 : 0,
                                shadowColor: Colors.green,
                                borderOnForeground: true,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: provider.tappedContainerIndex == 1
                                      ? 205
                                      : 180,
                                  width: provider.tappedContainerIndex == 1
                                      ? 170
                                      : 160,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xff0E6B56),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/logos/img_15.png",
                                          scale: 5,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          "Pandit",
                                          style: GoogleFonts.roboto(
                                              fontSize: 20.sp,
                                              color: const Color(0xff0E6B56)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ), // End of Pandit Container
                          ],
                        ),
                      ),
                      // End of Row
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0.w, vertical: 1.h),
                        child: SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: TextField(
                            controller: email,
                            cursorColor: const Color(0xff0E6B56),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.email_rounded,
                                color: Color(0xff0E6B56),
                              ),
                              hintText: ("Email"),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xff0E6B56),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0.w, vertical: 1.h),
                        child: SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: TextField(
                            obscureText: _obscureText,
                            controller: password,
                            cursorColor: const Color(0xff0E6B56),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _togglePasswordVisibility();
                                },
                                icon: Icon(
                                  _obscureText ? Icons.visibility_off : Icons.visibility,color: Colors.black,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xff0E6B56),
                              ),
                              hintText: ("Password"),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xff0E6B56),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0.w, vertical: 1.h),
                        child: SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: TextField(
                            controller: conformPassword,
                            obscureText: _obscureTextTwo,
                            cursorColor: const Color(0xff0E6B56),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _togglePasswordVisibilityTwo();
                                },
                                icon: Icon(
                                  _obscureTextTwo ? Icons.visibility_off : Icons.visibility,color: Colors.black,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xff0E6B56),
                              ),
                              hintText: ("Confirm Password"),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xff0E6B56),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: GestureDetector(
                          onTap:() {
                              if (provider.tappedContainerIndex == -1) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please select account type before signing up.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                // Don't proceed with login if no container is selected
                                return;
                              }
                              else if (password.text.trim()!=conformPassword.text.trim()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Password Missmatched.'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            else {
                                signUp(); // Call the signUp function here
                              }
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: const Color(0xff0E6B56),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Center(
                        child: Text(
                          "Or continue with",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: const Alignment(0, 0),
                        child: FloatingActionButton(
                          onPressed: () {
                            if (provider.tappedContainerIndex == -1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please select account type before signing up.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              // Don't proceed with login if no container is selected
                              return;
                            }
                            else {
                              context.go('/inputOtp');
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90),
                          ),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/logos/img_29.png",
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style:
                                TextStyle(fontSize: 18.sp, color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                               GoRouter.of(context).go('/login');
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: const Color(0xff0E6B56),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]); // End of Column
              },
            ),
          ),
        ),
    );
  }
}
