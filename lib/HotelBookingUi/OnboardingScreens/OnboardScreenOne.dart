import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/LogGmailPage.dart';
import 'package:gitson/HotelBookingUi/BookingScreens/SearchHotels.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardOne extends StatefulWidget {
  const OnboardOne({super.key});

  @override
  State<OnboardOne> createState() => _OnboardOneState();
}

class _OnboardOneState extends State<OnboardOne> {
  final PageController _controller = PageController();

  //fun for skip button
  void done() {
    if (_controller == 0) {
      _controller.jumpToPage(1);
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SearchHotels()));
    }
  }

  bool finalPage = false;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final height=screen.height*0.4;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          PageView(
              onPageChanged: (index) {
                setState(() {
                  finalPage = (index == 1);
                });
              },
              controller: _controller,
              children: [
                Column(
                  children: [
                    Container(
                       height:height,
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20.r),
                              bottomLeft: Radius.circular(20.r)),
                        ),
                        child: ClipRRect(
                            borderRadius:  BorderRadius.only(
                                bottomRight: Radius.circular(20.r),
                                bottomLeft: Radius.circular(20.r)),
                            child: Image.asset(
                              "assets/images/H-one.jpg",
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ))),
                    Text("Let's have the best",
                        style: GoogleFonts.abel(fontSize: 40.sp)),
                    Text("vacation with us",
                        style: GoogleFonts.abel(fontSize: 40.sp)),
                    SizedBox(height: 15.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.0.w),
                      child: Text(
                        "Welcome to our Hotel Booking app! Explore the world, experience luxury, and create unforgettable memories with us. Find the perfect stay.",
                        style: GoogleFonts.abel(fontSize: 20.sp),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        height:screen.height*0.4,
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20.r),
                              bottomLeft: Radius.circular(20.r)),
                        ),
                        child: ClipRRect(
                            borderRadius:  BorderRadius.only(
                                bottomRight: Radius.circular(20.r),
                                bottomLeft: Radius.circular(20.r)),
                            child: Image.asset(
                              "assets/images/H-Two.jpg",
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ))),
                    Text("Travel made easy",
                        style: GoogleFonts.abel(fontSize: 40.sp)),
                    Text("in your hands",
                        style: GoogleFonts.abel(fontSize: 40.sp)),
                    SizedBox(height: 15.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.0.w),
                      child: Text(
                        "Welcome to our Hotel Booking app! Explore the world, experience luxury, and create unforgettable memories with us. Find the perfect stay.",
                        style: GoogleFonts.abel(fontSize: 20.sp),
                      ),
                    ),
                  ],
                ),
              ]),
          Positioned(
              top: screen.height*0.68,
              left: screen.width*0.5,
              child: SmoothPageIndicator(controller: _controller, count: 2)),
          Positioned(
            top: screen.height*0.72,
            left: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Container(
                    height: 70,
                    width:screen.width*0.9,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(35.r),
                    ),
                    child: Center(
                        child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    )),
                  ),
                ),
                 SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: done,
                  child: Container(
                    height: 70,
                    width:screen.width*0.9,
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(35.r),
                    ),
                    child: Center(
                        child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.green, fontSize: 20.sp),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
