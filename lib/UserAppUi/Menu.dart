import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/LogOptions.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/SignUpPage.dart';
import 'package:gitson/Services/ServicesOpt.dart';
import 'package:gitson/UserAppUi/EditProfile.dart';
import 'package:gitson/UserAppUi/HomeOne.dart';
import 'package:gitson/UserAppUi/PaymentModes.dart';
import 'package:gitson/UserAppUi/Support.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/Onboard.dart';
import 'MyWallet.dart';
import 'ProfileForCab.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<DocumentSnapshot> documents = [];

  Future<void> readData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('User')
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();

      setState(() {
        documents = querySnapshot.docs;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  //back on services page
  void back() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ServicesOpt()));
  }

  //logOut
  Future<void> logOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Clear any user-specific data if needed

      // Navigate to the SignUp page and remove all previous routes
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SignUp()),
        (route) => false,
      );
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xff0E6B56),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 100,
              actions: [
                GestureDetector(
                  onTap: back,
                  child: Image.asset(
                    "assets/logos/img_10.png",
                    color: Colors.white,
                    scale: 20,
                  ),
                ),
              ],
              title: SizedBox(
                  height: 100,
                  width: 400,
                  child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      return Text(
                        "${"Hey " + documents[index]['name']}\nGrab Your New Ride",
                        style: GoogleFonts.roboto(color: Colors.white),
                      );
                    },
                  ))),
          body: WillPopScope(
              onWillPop: () {
                context.go("/userMainScreen");
                return Future.value(false);
              },
              child: const HomeOne()),
          drawer: Drawer(
            child: ListView(
              children: [
                SizedBox(
                  height: 200,
                  child: DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Color(0xff0E6B56),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 170.h,
                            width: 170.h,
                            child: ListView.builder(
                                itemCount: documents.length,
                                itemBuilder: (context, index) {
                                  String imageUrl =
                                      documents[index]["imageUrl"];
                                  return CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Colors.black,
                                    child: ClipOval(
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        width: 160,
                                        height: 160,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Text(
                                  "Welcome",
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: ListView.builder(
                                    itemCount: documents.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        documents[index]['name'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp),
                                      );
                                    },
                                  ))
                            ],
                          ),
                        ],
                      )),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/img_15.png",
                        scale: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfileCab()));
                        },
                        child: const Text(
                          "Profile",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/img_16.png",
                        scale: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentModes()));
                      },
                      child: const Text(
                        "Payment Methods",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/img_23.png",
                        scale: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          context.push("/trips");
                        },
                        child: const Text(
                          "Trips History",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/img_22.png",
                        scale: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              (MaterialPageRoute(
                                  builder: (context) => const MyWallet())));
                        },
                        child: const Text(
                          "My Wallet",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/img_21.png",
                        scale: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "My Referral",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/img_19.png",
                        scale: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        context.push("/manualBooking");
                      },
                      child: const Text(
                        "Manual Booking",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/img_18.png",
                        scale: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Support()));
                        },
                        child: const Text(
                          "Support",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.logout),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          try {
                            await FirebaseAuth.instance.signOut();
                            var sharedPref = await SharedPreferences.getInstance();
                            sharedPref.setBool(OnboardState.KEYLOGIN, false);
                            context.go('/signup');} catch (e) {
                            print("Error during logout: $e");
                          }
                        },
                        child: const Text(
                          "Log Out",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
