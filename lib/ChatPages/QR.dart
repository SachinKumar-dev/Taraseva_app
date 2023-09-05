import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class QR extends StatefulWidget {
  const QR({super.key});

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Scanner",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(children: [
                Container(
                  height: 900,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(

                    children: [
                       SizedBox(
                        height: 180.h,
                      ),
                     Image.asset("assets/logos/img_11.png",scale: 2,),
                      SizedBox(height: 20.h,),
                      Text("Scan Me",style:GoogleFonts.signikaNegative(fontSize: 30),)
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
