import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/AuthLogic/InputOTP.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/LogPage.dart';
import 'package:gitson/HotelBookingUi/BookingScreens/SearchHotels.dart';
import 'package:gitson/Services/ServicesOpt.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;

  const OTPScreen({required this.verificationId, Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreen();
}

class _OTPScreen extends State<OTPScreen> {
  final TextEditingController otpNumber1 = TextEditingController();
  final TextEditingController otpNumber2 = TextEditingController();
  final TextEditingController otpNumber3 = TextEditingController();
  final TextEditingController otpNumber4 = TextEditingController();
  final TextEditingController otpNumber5 = TextEditingController();
  final TextEditingController otpNumber6 = TextEditingController();

  //verification
  Future<void> signInWithOTP(String smsCode, String verificationId) async {
    // Show circular progress indicator while validating OTP
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        );
      },
    );

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;
      Navigator.pop(context); // Close the progress indicator dialog
      if (user != null) {
        // OTP verification successful
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ServicesOpt(),
          ),
        );
      } else {
        // OTP verification failed
        // Show an error message
      }
    } catch (e) {
      Navigator.pop(context); // Close the progress indicator dialog
      print('Failed to sign in with OTP: $e');
      // Handle sign-in failure, display an error message, or try again
    }
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 10),
                  child: Container(
                    alignment: const Alignment(-0.9, 0.5),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const InputScreen()));
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 80,
              ),
              Text(
                "Verify Phone",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Code is sent to your number.",
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: 40.h,
              ),
              Form(
                  child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: otpNumber1,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green.shade200,
                              border: const OutlineInputBorder()),
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: otpNumber2,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green.shade200,
                              border: const OutlineInputBorder()),
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: otpNumber3,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green.shade200,
                              border: const OutlineInputBorder()),
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: otpNumber4,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green.shade200,
                              border: const OutlineInputBorder()),
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: otpNumber5,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green.shade200,
                              border: const OutlineInputBorder()),
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 68,
                          width: 64,
                          child: TextFormField(
                            controller: otpNumber6,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.green.shade200,
                                border: const OutlineInputBorder()),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              SizedBox(
                height: 20.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff6a6c7b),
                    ),
                  ),
                  Text(
                    "Request Again",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff061d28),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Center(
                    child: GestureDetector(
                  onTap: () async {
                    String smsCode = otpNumber1.text.trim() +
                        otpNumber2.text.trim() +
                        otpNumber3.text.trim() +
                        otpNumber4.text.trim() +
                        otpNumber5.text.trim() +
                        otpNumber6.text.trim();
                    String verificationId = widget.verificationId;
                    await signInWithOTP(smsCode, verificationId);
                  },
                  child: const Text(
                    "VERIFY AND CONTINUE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
