import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../HotelBookingUi/AccountScreens/LogGmailPage.dart';
import '../Services/ServicesOpt.dart';


class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return  const ServicesOpt();
            } else {
              return const LogGmailPage();
            }
          }),
    );
  }
}
