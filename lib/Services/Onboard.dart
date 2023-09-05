import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/LogGmailPage.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _Onboard();
}

class _Onboard extends State<Onboard> {
  double opacity1 = 0.0;
  double opacity2 = 0.0;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LogGmailPage()));
    });

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
      body: Stack(
        children: [
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
        ],
      ),
    );
  }
}
