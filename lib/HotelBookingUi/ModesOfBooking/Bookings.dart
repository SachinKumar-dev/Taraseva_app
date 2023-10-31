import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Ongoing.dart';

class NewBookings extends StatefulWidget {
  const NewBookings({super.key});

  @override
  State<NewBookings> createState() => _NewBookingsState();
}

class _NewBookingsState extends State<NewBookings> {
  //container taps
  int containerIndex = 0;

  //container fun
  void tap(int index) {
    setState(() {
      containerIndex = index;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          context.go('/searchHotels');
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
              const Expanded(child: Ongoing()),
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
