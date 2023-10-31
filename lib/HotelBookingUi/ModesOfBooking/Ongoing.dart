import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Models/HotelModel/Hotel.dart';
import '../BookingScreens/HotelPreview.dart';
class Ongoing extends StatelessWidget {
  const Ongoing({super.key});

  @override
  Widget build(BuildContext context) {
    //show dialog
    void showCustomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 300, // Customize the height as needed
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Cancel Booking",
                      style: GoogleFonts.inter(
                          fontSize: 22.0.sp, color: Colors.red),
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Are you sure you want to cancel your hotel\n                             booking?",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Only 80% of the money you can refund from your payment\n                                according to our policy",
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50.h,
                        width: 180.w,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel",
                              style: GoogleFonts.inter(
                                  color: Colors.black, fontSize: 15.sp)),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 180.w,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff0E6B56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            context.go('/refund');
                          },
                          child: Text(
                            "Yes,Continue",
                            style: GoogleFonts.inter(
                                color: Colors.white, fontSize: 15.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    List<Hotel> hotels = Hotel.hotels;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 250,
            width: double.infinity,
            child: Card(
              color: Colors.white,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0.2,
              child: Stack(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 110,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(hotels[index].img),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Stack Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              hotels[index].hotelName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(hotels[index].location),
                          const SizedBox(height: 20),
                          Container(
                            height: 25.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              color: const Color(0xff0E6B56),
                            ),
                            child: const Center(
                              child: Text(
                                "Paid",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 162,
                  left: 5,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            showCustomDialog(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.06,
                            width:  MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  width: 1, color: const Color(0xff0E6B56)),
                              color: Colors.white,
                            ),
                            child: const Center(
                                child: Text(
                              "Cancel Booking",
                              style: TextStyle(color: Color(0xff0E6B56)),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.06,
                          width:  MediaQuery.of(context).size.width*0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xff0E6B56),
                          ),
                          child: const Center(
                            child: Text("View Ticket",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
