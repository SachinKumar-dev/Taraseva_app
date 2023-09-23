import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/ChatPages/ChatScreen.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/UserShowDetails.dart';
import 'package:gitson/Models/Pandits.dart';
import 'package:gitson/Pandits/Details.dart';
import 'package:gitson/Services/ServicesOpt.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List list = Pandits.listpandits;
  int tappedContainerIndex = -1;

  //handling taps of navBar
  int selectedIndex = 0;

  //handling the navBar
  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (selectedIndex == 3) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ServicesOpt()));
    }else if (selectedIndex == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChatPage()));
      }
    else if (selectedIndex == 2) {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => const ShowDetails()));
    }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.green.shade200,
              ], // Your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Center(
          child: Text(
            "Welcome Bhakt",
            style: GoogleFonts.signikaNegative(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.0.w, vertical: 18.0.h),
                    child: SizedBox(
                      height: 110.h,
                      width: 390.w,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Details()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 18.0.w),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.red,
                                  backgroundImage: AssetImage(list[index].img),
                                ),
                              ),
                              SizedBox(
                                width: 80.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    list[index].name,
                                    style: GoogleFonts.signikaNegative(
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Experience:-" + list[index].experiences,
                                    style: GoogleFonts.signikaNegative(
                                        fontSize: 16.sp),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.green,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/logos/img_10.png")),
                label: "Return"),
          ]),
    );
  }
}
