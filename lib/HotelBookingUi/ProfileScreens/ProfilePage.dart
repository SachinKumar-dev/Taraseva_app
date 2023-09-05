import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/LogGmailPage.dart';
import 'package:gitson/HotelBookingUi/PaymentScreens/AdvancePayment.dart';

import 'editProfile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _value = false;
  List<DocumentSnapshot> documents = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('user').get();

    setState(() {
      documents = querySnapshot.docs;
    });
  }
  //logOut
  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Redirect the user to the login or home page after successful sign-out
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LogGmailPage()), // Replace with your login page
            (route) => false,
      );
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      "assets/images/img_13.png",
                      scale: 20,
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
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1554126807-6b10f6f6692a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Ym95fGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
                  ),
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
                              documents[index]["firstName"] +
                                  (documents[index]["lastName"]),
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
                          "Edit Profile",
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
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Payment()));
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
                Row(
                  children: [
                    Image.asset(
                      "assets/images/img_9.png",
                      scale: 17,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Security",
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
                      activeColor: Colors.green,
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
                        onTap:logOut,
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
    );
  }
}
