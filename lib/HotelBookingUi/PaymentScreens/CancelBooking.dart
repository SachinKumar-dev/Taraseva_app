import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelBooking extends StatefulWidget {
  const CancelBooking({super.key});

  @override
  State<CancelBooking> createState() => _CancelBookingState();
}

class _CancelBookingState extends State<CancelBooking> {
  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: MediaQuery.of(context).size.height*0.6,
            width:  MediaQuery.of(context).size.width*0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(
                      "assets/logos/tick.png",
                      scale: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Successfull!",
                      style: GoogleFonts.inter(
                          fontSize: 22.0.sp,
                          color: const Color(0xff0E6B56),
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "You have successfully canceled\nyour order.80% funds will be\nreturned to your account.",
                        maxLines: 3,
                        overflow: TextOverflow.visible,
                        style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50.h,
                        width: 280.w,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff0E6B56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Ok",
                              style: GoogleFonts.inter(
                                  color: Colors.white, fontSize: 20.sp)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  int selectedValue = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: (){
          context.go('/OngoingBookings');
          return Future.value(false);
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.go('/OngoingBookings');
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 65),
                        child: const Text(
                          "Cancel Hotel Booking",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    ' Please select a payment refund method (only \n 80% will be refunded).',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: SizedBox(
                    height: 90,
                    width: 380,
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0.5,
                      child: Center(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/img_4.png",
                            height: 35,
                          ),
                          title: const Text("Paypal"),
                          trailing: Radio(
                            value: 1,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                            activeColor: const Color(0xff0E6B56),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: SizedBox(
                    height: 90,
                    width: 380,
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0.5,
                      child: Center(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/img.png",
                            height: 35,
                          ),
                          title: const Text("Google Pay"),
                          trailing: Radio(
                              value: 0,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value!;
                                });
                              },
                              activeColor: const Color(0xff0E6B56)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: SizedBox(
                    height: 90,
                    width: 380,
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0.5,
                      child: Center(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/img_2.png",
                            height: 35,
                          ),
                          title: const Text("Apple Pay"),
                          trailing: Radio(
                            value: 2,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                            activeColor: const Color(0xff0E6B56),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: SizedBox(
                    height: 90,
                    width: 380,
                    child: Card(
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0.5,
                      child: Center(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/img_5.png",
                            height: 35,
                          ),
                          title: const Text("•••• •••• •••• 4679"),
                          trailing: Radio(
                              value: 3,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value!;
                                });
                              },
                              activeColor: const Color(0xff0E6B56)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h,),
                const Center(
                  child: SizedBox(
                    height: 50,
                    child: Text("Paid:\$479.5   Refund:\$383.8"),
                  ),
                ),
                GestureDetector(
                  onTap: () => showCustomDialog(context),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 10),
                    child: Container(
                      height: 50.h,
                      width: 380.w,
                      decoration: BoxDecoration(
                          color: const Color(0xff0E6B56),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                          child: Text(
                        "Confirm Cancellation",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
