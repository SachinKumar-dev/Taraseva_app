import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/SignUpPage.dart';
import 'package:gitson/Pandits/PanditChat.dart';
import 'package:gitson/Services/Onboard.dart';
import 'package:provider/provider.dart';
import '../HotelBookingUi/AccountScreens/LogOptions.dart';
import '../Provider/LogicForTappedContainer.dart';
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
        body: Consumer<LogicContainer>(builder: (context, provider, child) {
      return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData && provider.tappedContainerIndex==0) {
              return const ServicesOpt();
            }
            else if (snapshot.hasData && provider.tappedContainerIndex==1) {
              return const PanditChat();
            }
            else {
              return const SignUp();
            }
          });
    }));
  }
}
