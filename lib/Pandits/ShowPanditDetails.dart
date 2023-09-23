import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/ChatPages/ChatScreen.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/LogOptions.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/PanditShowDetails.dart';
import 'package:gitson/Models/Pandits.dart';
import 'package:gitson/Pandits/Details.dart';
import 'package:gitson/Pandits/HomePagePandit.dart';
import 'package:gitson/Services/ServicesOpt.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowPanditDetails extends StatefulWidget {
  const ShowPanditDetails({super.key});

  @override
  State<ShowPanditDetails> createState() => _ShowPanditDetailsState();
}

class _ShowPanditDetailsState extends State<ShowPanditDetails> {
//sign Out
  Future<void> logOut() async {
    try {
      setState(()  {
        FirebaseAuth.instance.signOut();
      });
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LogGmailPage()), // Replace with your login page
            (route) => false,
      );
    } catch (e) {
      print("Error during logout: $e");
    }
  }
  //
  List list = Pandits.listpandits;
  int tappedContainerIndex = -1;

  //handling taps of navBar
  int selectedIndex = 0;

  //handling the navBar
  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
   if (selectedIndex == 1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ChatPage()));
    }
    else if (selectedIndex == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const PanditShowDetails()));
    }
   else if (selectedIndex == 3) {
     logOut();
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
            "Welcome Pandit",
            style: GoogleFonts.signikaNegative(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: const SafeArea(
        child: HomePagePandit(),
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
              icon: Icon(Icons.account_circle_outlined),
              label: "Experiences",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: "SignOut"),
          ]),
    );
  }
}
