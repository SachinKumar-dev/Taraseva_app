import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Models/HotelModel/Hotel.dart';
import '../BookingScreens/HotelPreview.dart';

class Completed extends StatefulWidget {
  const Completed({Key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  //handling taps of navBar
  int selectedIndex = 1;

  //handling the navBar
  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (selectedIndex == 3) {
      context.go("/userMainScreen");
    }
    if (selectedIndex == 2) {
      context.go("/profile");
    }
    if (selectedIndex == 1) {
      context.go('/OngoingBookings');
    }
    if (selectedIndex == 0) {
      context.go('/searchHotels');
    }
  }

  int containerIndex = 1;

  //container fun
  void tap(int index) {
    setState(() {
      containerIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    List<Hotel> hotels = Hotel.hotels;
    return Scaffold(
      body: WillPopScope(
        onWillPop: (){
          context.go('/OngoingBookings');
          return Future.value(false);
        },
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " My Booking",
                      style: GoogleFonts.inter(
                          fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.search,
                      size: 35,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      tap(0);
                      context.go('/OngoingBookings');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: const Color(0xff0E6B56)),
                        color: containerIndex == 0
                            ? const Color(0xff0E6B56)
                            : Colors.white,
                      ),
                      child: Center(
                          child: Text(
                            "Ongoing",
                            style: TextStyle(
                              fontSize: 17,
                              color: containerIndex == 0
                                  ? Colors.white
                                  : const Color(0xff0E6B56),
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tap(1);
                      context.go('/completed');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: const Color(0xff0E6B56)),
                        color: containerIndex == 1
                            ? const Color(0xff0E6B56)
                            : Colors.white,
                      ),
                      child: Center(
                          child: Text(
                            "Completed",
                            style: TextStyle(
                              fontSize: 17,
                              color: containerIndex == 1
                                  ? Colors.white
                                  : const Color(0xff0E6B56),
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tap(2);
                      context.go('/canceled');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff0E6B56)),
                        borderRadius: BorderRadius.circular(25),
                        color: containerIndex == 2
                            ? const Color(0xff0E6B56)
                            : Colors.white,
                      ),
                      child: Center(
                          child: Text(
                            "Canceled",
                            style: TextStyle(
                              fontSize: 17,
                              color: containerIndex == 2
                                  ? Colors.white
                                  : const Color(0xff0E6B56),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
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
                          child: Stack(
                            children: [
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
                                          width: 75.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            shape: BoxShape.rectangle,
                                            color:Colors.green,
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Completed",
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
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                    ),
                                    color: Colors.green.shade300,
                                  ),
                                  height: 50,
                                  width: 200.w,
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.check_box, color: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Yea, you have completed it!",
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xff0E6B56),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/logos/img_10.png"),
              color: Colors.grey,
            ),
            label: "Return",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onTap,
      ),
    );
  }
}
