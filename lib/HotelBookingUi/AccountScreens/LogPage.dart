import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/CreateAccount.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/PanditInfo.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/UserInfo.dart';
import 'package:gitson/Provider/LogicForTappedContainer.dart';
import 'package:gitson/Services/Onboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LogPage extends StatefulWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  State<LogPage> createState() => LogPageState();
}

class LogPageState extends State<LogPage> {
  bool isChecked = false;
  final email = TextEditingController();
  final password = TextEditingController();

  //container focus
  late Color color;

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
          child: ChangeNotifierProvider<LogicContainer>(
            create: (context) => LogicContainer(),
            child: Consumer<LogicContainer>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 30.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100.w),
                      child: Text(
                        "Choose Account Type",
                        style: GoogleFonts.signikaNegative(
                            fontSize: 25.sp, color: Colors.green),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: GestureDetector(
                            onTap: () => provider.handleTap(0),
                            child: Container(
                              height: 180,
                              width: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: provider.tappedContainerIndex == 0
                                      ? Colors.green
                                      : Colors.green.shade100,
                                  width: 2,
                                ),
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
                                          fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ), // End of User Container
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: GestureDetector(
                            onTap: () => provider.handleTap(1),
                            child: Container(
                              height: 180,
                              width: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: provider.tappedContainerIndex == 1
                                      ? Colors.green
                                      : Colors.green.shade100,
                                  width: 2,
                                ),
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
                                          fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ), // End of Pandit Container
                      ],
                    ), // End of Row
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 72.0, top: 8, bottom: 8),
                      child: Text(
                        "Fill all the details to get started.",
                        style: GoogleFonts.roboto(fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 1.h),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: TextField(
                          controller: email,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                              Icons.email_rounded,
                              color: Colors.black54,
                            ),
                            hintText: ("Email"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 1.h),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            suffixIcon: Image.asset(
                              'assets/images/img_3.png',
                              scale: 20,
                              color: Colors.black54,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black54,
                            ),
                            hintText: ("Password"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: Colors.green,
                          value: isChecked,
                          onChanged: (bool? newValue) {
                            // This function will be called whenever the checkbox is toggled
                            setState(() {
                              isChecked =
                                  newValue ?? true; // Update the value of _isChecked
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        Text(
                          "Remember me",
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: GestureDetector(
                        onTap: () async {
                          if (provider.tappedContainerIndex == -1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select account type before signing in.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            // Don't proceed with login if no container is selected
                            return;
                          } else {
                            var sharedPref = await SharedPreferences.getInstance();
                            sharedPref.setBool(OnboardState.KEYLOGIN, true);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.green,
                                  ),
                                );
                              },
                            );

                            try {
                              await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );
                              if (provider.tappedContainerIndex == 0) {
                                Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) => const UserInformation()),
                                      (route) => false,
                                );
                              }
                              else {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => const PanditInfo()),
                                      (route) => false,
                                );
                              }
                            } on FirebaseAuthException catch (e) {
                              Navigator.of(context).pop(); // Close the progress dialog
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Invalid credentials. Please try again.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Center(
                      child: Text(
                        'Forgot the password?',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CreateAccount()));
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ); // End of Column
              },
            ),
          ),
        ),
      ),
    );
  }
}
