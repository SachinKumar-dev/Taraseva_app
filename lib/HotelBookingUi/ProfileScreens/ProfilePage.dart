import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/HotelBookingUi/PaymentScreens/AdvancePayment.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Services/Onboard.dart';
import 'editProfile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //handling taps of navBar
  int selectedIndex = 2;

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

  bool _value = false;
  List<DocumentSnapshot> documents = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

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

  //logOut
  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      var sharedPref = await SharedPreferences.getInstance();
      sharedPref.setBool(OnboardState.KEYLOGIN, false);
      context.go('/signup');
    } catch (e) {
      print("Error during logout: $e");
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
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/logos/img_16.png",
                        scale: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 210.w,
                      ),
                      Transform.rotate(
                          angle: -90 * 3.1415927 / 180,
                          child: Image.asset(
                            "assets/images/img_14.png",
                            scale: 20,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 170.h,
                    child: ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          String imageUrl = documents[index]["imageUrl"];
                          return CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.black,
                            child: ClipOval(
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                // Use BoxFit.cover to fit the image within the circle
                                width: 160,
                                // Adjust the width as needed
                                height: 160, // Adjust the height as needed
                              ),
                            ),
                          );
                        }),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                documents[index]["name"],
                                style: const TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              documents[index]["Gmail"],
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        );
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/img_6.png",
                        scale: 17,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                (MaterialPageRoute(
                                    builder: (context) => const Profile())));
                          },
                          child: const Text(
                            "Profile",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/img_7.png",
                        scale: 17,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Payment()));
                          },
                          child: const Text(
                            "Payment",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/img_8.png",
                        scale: 17,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Notifications",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Image.asset(
                      "assets/images/img_10.png",
                      scale: 17,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Help",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/img_11.png",
                        scale: 17,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Dark Theme",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 150.w,
                      ),
                      CupertinoSwitch(
                        value: _value,
                        activeColor: const Color(0xff0E6B56),
                        trackColor: Colors.grey.shade300,
                        thumbColor: Colors.white,
                        onChanged: (newValue) {
                          setState(() {
                            _value = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/img_12.png",
                        scale: 17,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: logOut,
                          child: const Text(
                            "Logout",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
