import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Provider/LogicForTappedContainer.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => OnboardState();
}

class OnboardState extends State<Onboard> {
  //check ifLoggedIn state
  Future<void> check(LogicContainer provider)async{
    var sharedPref = await SharedPreferences.getInstance();
    bool? isLoggedIn = sharedPref.getBool(OnboardState.KEYLOGIN);
    var value=provider.tappedContainerIndex;
    print('isLoggedIn: $isLoggedIn');
    print('value: $value');
    if(isLoggedIn==true && value==0){
      context.go('/userMainScreen');
    }
    else if(isLoggedIn==true && value==1){
      context.go('/panditchat');
    }
    else{
      context.go('/signup');
    }
  }
  //shared pref
  static var KEYLOGIN = "login";
  double opacity1 = 0.0;
  double opacity2 = 0.0;

  @override
  void initState() {
    whereToGo();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacity1 = 1.0;
      });
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        opacity2 = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<LogicContainer>(builder: (context, provider, child) {
          return Stack(children: [
            Image.asset(
              "assets/logos/Temple.jpg",
              fit: BoxFit.fitHeight,
              height: double.infinity,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.83,
              left: 80.w,
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: opacity1,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "  Welcome",
                      style: GoogleFonts.signikaNegative(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  AnimatedOpacity(
                    opacity: opacity2,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "  Worshipper",
                      style: GoogleFonts.signikaNegative(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]);
        }));
  }
  void whereToGo() async {
    Timer(const Duration(seconds: 3), () {
      LogicContainer myLogicContainer=LogicContainer();
    check(myLogicContainer);
    });
  }
}
