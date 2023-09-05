import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gitson/Pandits/Home.dart';
import 'package:gitson/UserAppUi/Menu.dart';
import 'package:google_fonts/google_fonts.dart';
import '../HotelBookingUi/BookingScreens/SearchHotels.dart';
import '../HotelBookingUi/OnboardingScreens/OnboardScreenOne.dart';
import '../Models/OnboardImages/Images.dart';
import '../UserAppUi/HomeOne.dart';

class ServicesOpt extends StatefulWidget {
  const ServicesOpt({
    super.key,
  });

  @override
  State<ServicesOpt> createState() => _ServicesOptState();
}

class _ServicesOptState extends State<ServicesOpt> {
  void show() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: const Text('Exit App?'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'No',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text(
                  'Yes',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Images> images = Images.images;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        leading: IconButton(
          onPressed: show,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 88.0),
          child: Text(
            "Taraseva",
            style: GoogleFonts.signikaNegative(fontSize: 30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Menu()));
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 100,
                  width: 390,
                  child: Card(
                    color: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Image.asset(
                            "assets/logos/img_4.png",
                            scale: 8,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text(
                            "Cab Booking",
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardOne()));
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 100,
                  width: 390,
                  child: Card(
                    color: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Image.asset(
                            "assets/logos/img_5.png",
                            scale: 8,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text(
                            "Hotel Booking",
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 100,
                width: 390,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Image.asset(
                            "assets/logos/img_6.png",
                            scale: 8,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text(
                            "Pandits",
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              height: 30,
              thickness: 1,
              color: Colors.grey,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: images.map((image) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 5),
                      child: Container(
                        height: 330,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(image.img),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
