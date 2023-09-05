import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/ChatPages/QR.dart';
import 'package:gitson/HotelBookingUi/PaymentScreens/AdvancePayment.dart';
import 'package:gitson/UserAppUi/PaymentModes.dart';
import 'package:gitson/UserAppUi/Support.dart';
import 'ChatPages/ChatScreen.dart';
import 'ChatPages/Payment.dart';
import 'Services/Onboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Onboard(),
        );
      },
      designSize: const Size(420, 910),
    );
  }
}
