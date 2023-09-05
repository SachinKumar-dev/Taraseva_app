import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/ChatPages/QR.dart';
import 'package:google_fonts/google_fonts.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
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
                        "Payment",
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
                      const SizedBox(
                        height: 50,
                      ),
                        SizedBox(
                          height: 250,
                          width: 370,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Account Details:-",
                                style:
                                    GoogleFonts.signikaNegative(fontSize: 30),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                "Account Number:-3248 4578 8988 0987",
                                style:
                                    GoogleFonts.signikaNegative(fontSize: 20),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "IFSC Code:-HDFC0003880",
                                style:
                                    GoogleFonts.signikaNegative(fontSize: 20),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Branch Name:-Booty More",
                                style:
                                GoogleFonts.signikaNegative(fontSize: 20),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Name:-Pandit Gyani",
                                style:
                                GoogleFonts.signikaNegative(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                       SizedBox(height: 30.h,),
                       Expanded(
                         child: SizedBox(
                           height: 210,
                           width: 370,
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "UPI Details:-",
                                style:
                                GoogleFonts.signikaNegative(fontSize: 30),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                "upi id:-sakhsi@okicici",
                                style:
                                GoogleFonts.signikaNegative(fontSize: 20),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Phone number:-7623894678",
                                style:
                                GoogleFonts.signikaNegative(fontSize: 20),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Pay by QR:-",
                                    style:
                                    GoogleFonts.signikaNegative(fontSize: 20),
                                  ),
                                  GestureDetector(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const QR()));
                                      },
                                      child: Text("Click here.",style: GoogleFonts.signikaNegative(color: Colors.blue,fontSize: 20),))
                                ],
                              ),
                              SizedBox(height: 100.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/logos/img_12.png',scale: 15,),
                                  ),
                                  Text("Verified.",style: GoogleFonts.signikaNegative(fontSize: 20,color: Colors.blue),),
                                ],
                              )
                            ],
                      ),
                         ),
                       ),
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
