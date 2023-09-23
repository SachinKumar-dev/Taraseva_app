import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/AuthLogic/InputOTP.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/CreateAccount.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/LogPage.dart';
import 'package:google_fonts/google_fonts.dart';

class LogGmailPage extends StatefulWidget {
  const LogGmailPage({super.key});

  @override
  State<LogGmailPage> createState() => _LogGmailPageState();
}

class _LogGmailPageState extends State<LogGmailPage> {
  void show() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: const Text('Exit App?'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'No',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text(
                  'Yes',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 40,
          ),
          IconButton(
              onPressed: show,
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 30,
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Center(
              child: Text(
            "Let's you in",
            style:
                GoogleFonts.roboto(fontSize: 50, fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InputScreen()));
              },
              child: Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 83.0),
                        child: Image.asset(
                          "assets/logos/img_7.png",
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text("Continue with Otp")
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0.w),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Image.asset(
                      "assets/images/img.png",
                      height: 30,
                    ),
                  ),
                  const Text("Continue with Google")
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0.w),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Image.asset(
                      "assets/images/img_2.png",
                      height: 30,
                    ),
                  ),
                  const Text("Continue with Apple")
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
              const Text(
                "or",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    height: 20,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LogPage()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30.r)),
                child: Center(
                    child: Text(
                  "Sign in with password",
                  style: TextStyle(fontSize: 15.sp, color: Colors.white),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccount()));
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}
