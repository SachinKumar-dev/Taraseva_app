import 'package:flutter/material.dart';
import 'package:gitson/Services/ServicesOpt.dart';
import 'package:gitson/UserAppUi/AppSettings.dart';
import 'package:gitson/UserAppUi/EditProfile.dart';
import 'package:gitson/UserAppUi/HomeOne.dart';
import 'package:gitson/UserAppUi/PaymentModes.dart';
import 'package:gitson/UserAppUi/Support.dart';
import 'MyWallet.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  //back on services page
  void back() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ServicesOpt()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.green,
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
            title: const Text(
              " Hey Provat Mondal\n Grab Your New Ride",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const HomeOne(),
          drawer: Drawer(
            child: ListView(
              children: [
                SizedBox(
                  height: 200,
                  child: DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: const CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1554126807-6b10f6f6692a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Ym95fGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60"),
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 18.0),
                                child: Text(
                                  "Welcome",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Provat Mondal",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                                softWrap: true,
                                maxLines: 5,
                                textAlign: TextAlign.center,
                              ),
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
                                  builder: (context) => const EditProfile()));
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
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Trips History",
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
                        "assets/images/img_20.png",
                        scale: 18,
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
                                  builder: (context) => const AppSettings()));
                        },
                        child: const Text(
                          "App Settings",
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
                        "assets/images/img_19.png",
                        scale: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Manual Booking",
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/img_17.png",
                        scale: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(fontSize: 20),
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
