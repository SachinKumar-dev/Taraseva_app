import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/AuthLogic/OTPScreen.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/LogOptions.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/SignUpPage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../Provider/LogicForTappedContainer.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreen();
}

class _InputScreen extends State<InputScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  String? _verificationId;

  //otp retrieving code
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool _isVerifying = false;

  void verifyNumber() async {
    try {
      setState(() {
        _isVerifying = true; // Start showing the circular progress indicator.
      });

      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("You are logged in.");
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Mobile verification failed"),
              backgroundColor: Colors.red,
            ),
          );
          setState(() {
            _isVerifying = false; // Stop showing the progress indicator.
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          print('OTP code sent. Verification ID: $verificationId');
          _verificationId = verificationId;
          setState(() {
            _isVerifying = false; // Stop showing the progress indicator.
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPScreen(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print(
              'OTP code auto retrieval timeout. Verification ID: $verificationId');
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error"),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        _isVerifying = false; // Stop showing the progress indicator.
      });
    }
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
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 10),
                    child: Container(
                      alignment: const Alignment(-0.9, 0.5),
                      child: GestureDetector(
                        onTap: () {
                          context.go('/signup');
                        },
                        child: Image.asset(
                          "assets/logos/img_8.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  "Please enter your mobile number",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "You'll receive a 6 digit code\n            to verify next.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 40,
                ),
                Stack(children: [
                  Positioned(
                    top: 15,
                    left: 35,
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/logos/img_9.png"),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.93,
                      child: TextField(
                        controller: phoneNumberController,
                        cursorColor: const Color(0xff0E6B56),
                        decoration: const InputDecoration(
                            hintText: "Mobile Number",
                            prefix: SizedBox(
                              width: 100, // Adjust the width as needed
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('+91  -  ',
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color(0xff0E6B56),
                              width: 2,
                            ))),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
                  child: GestureDetector(
                      onTap: verifyNumber,
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.93,
                        decoration: const BoxDecoration(
                          color: Color(0xff0E6B56),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              verifyNumber(); // Call the verifyNumber function here
                            },
                            child:
                                _isVerifying // Display circular progress indicator when verifying
                                    ? const CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      )
                                    : const Text(
                                        "VERIFY AND CONTINUE",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
