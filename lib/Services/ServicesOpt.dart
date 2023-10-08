import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/OnboardImages/Images.dart';

class ServicesOpt extends StatefulWidget {
  const ServicesOpt({
    super.key,
  });

  @override
  State<ServicesOpt> createState() => _ServicesOptState();
}

class _ServicesOptState extends State<ServicesOpt> {
  //fetch user
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
                  style: TextStyle(fontSize: 20, color: Color(0xff0E6B56)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text(
                  'Yes',
                  style: TextStyle(fontSize: 20, color: Color(0xff0E6B56)),
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
            decoration: const BoxDecoration(
              color: Color(0xff0E6B56),
            ),
          ),
          leading: IconButton(
            onPressed: show,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
          title: SizedBox(
            height: 100.h,
            width: 300.w,
            child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      "${"Hi ! " + documents[index]['name']}",
                      style: GoogleFonts.roboto(
                          color: Colors.white, fontSize: 20.sp),
                    ),
                  );
                }),
          ),
        ),
        body: WillPopScope(
          onWillPop: (){
            show();
            return Future.value(false);
          },
          child: SingleChildScrollView(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 35.h),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          context.go('/menu');
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xff5AB3F3),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/logos/newCab.png",
                                  scale: 1.5),
                              Text(
                                "   Cab \nBooking",
                                style: GoogleFonts.inter(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.h),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          context.go('/hotel');
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffF98787),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image.asset(
                                  "assets/logos/newHotel.png",
                                  scale: 1.6,
                                ),
                              ),
                              Text(
                                "  Hotel \nBooking",
                                style: GoogleFonts.inter(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      context.go('/userchat');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      width: MediaQuery.of(context).size.width * 0.36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffFFC255),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Image.asset(
                              "assets/logos/newPanditt.png",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28, top: 10),
                            child: Text(
                              "Pandits Booking",
                              style: GoogleFonts.inter(
                                  fontSize: 25, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
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
                        height: MediaQuery.of(context).size.height*0.42,
                        width: MediaQuery.of(context).size.height*0.25,
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
          ])),
        ));
  }
}
