import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/CreateAcctDetails.dart';
import 'package:gitson/HotelBookingUi/PaymentScreens/AdvancePayment.dart';
import 'package:gitson/Models/HotelModel/Hotel.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelPreview extends StatefulWidget {
  const HotelPreview({super.key});

  @override
  State<HotelPreview> createState() => _HotelPreviewState();
}

class _HotelPreviewState extends State<HotelPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset('assets/images/H-one.jpg'),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Royal President Hotel",
                style: GoogleFonts.signikaNegative(fontSize: 25),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  "assets/logos/loct.png",
                  scale: 20,
                  color: const Color(0xff0E6B56),
                ),
                Text(
                  "79 Place de la Madelne Wokas Pure",
                  style: GoogleFonts.signikaNegative(fontSize: 17),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Gallery Photos",
                style: GoogleFonts.signikaNegative(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/H-Four.jpg",
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/H-Two.jpg",
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/H-Three.jpg",
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/H-Four.jpg",
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Details",
                style: GoogleFonts.signikaNegative(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/logos/img_17.png",
                          scale: 12,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Hotels",
                          style: GoogleFonts.signikaNegative(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/logos/bath.png",
                        scale: 12,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "2 Bathrooms",
                        style: GoogleFonts.signikaNegative(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/logos/img_20.png",
                        scale: 12,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "4 Bedrooms",
                        style: GoogleFonts.signikaNegative(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/logos/img_21.png",
                        scale: 12,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "4000 sqfts",
                        style: GoogleFonts.signikaNegative(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Description",
                style: GoogleFonts.signikaNegative(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Welcome to our hotel, a luxurious and elegant retreat nestled in the heart. Our hotel offers a perfect blend of modern comfort and timeless sophistication, making it an ideal choice for both leisure and business travelers.With well-appointed rooms and suites, each designed with your utmost comfort in mind, we provide a tranquil oasis for your stay.",
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Facilities",
                style: GoogleFonts.signikaNegative(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/logos/img_22.png",
                          scale: 12,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Swimming",
                          style: GoogleFonts.signikaNegative(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/logos/parking.png",
                        scale: 12,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Parking",
                        style: GoogleFonts.signikaNegative(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/logos/img_24.png",
                        scale: 12,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Wifi",
                        style: GoogleFonts.signikaNegative(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/logos/img_25.png",
                        scale: 12,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Restaurant",
                        style: GoogleFonts.signikaNegative(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Reviews",
                    style: GoogleFonts.signikaNegative(fontSize: 20),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Text(
                    "(4,981)",
                    style: GoogleFonts.signikaNegative(fontSize: 20),
                  ),
                  SizedBox(
                    width: 140.w,
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.signikaNegative(
                        fontSize: 20, color: const Color(0xff0E6B56)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: 100,
                child: Center(
                  child: ListTile(
                    leading: Transform.scale(
                      scale: 2,
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1602233158242-3ba0ac4d2167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z2lybHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60"),
                        ),
                      ),
                    ),
                    title: Container(
                        margin: const EdgeInsets.only(left: 12, bottom: 13),
                        child: Text(
                          "Olivia Jenny",
                          style: GoogleFonts.signikaNegative(fontSize: 20),
                        )),
                    subtitle: Container(
                        margin: const EdgeInsets.only(left: 15, bottom: 13),
                        child: const Text("Nice")),
                    trailing: Container(
                      height: 50,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color:const Color(0xff0E6B56),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                          child: Text(
                        "5.0",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: 100,
                child: Center(
                  child: ListTile(
                    leading: Transform.scale(
                      scale: 2,
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1602233158242-3ba0ac4d2167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z2lybHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60"),
                        ),
                      ),
                    ),
                    title: Container(
                        margin: const EdgeInsets.only(left: 12, bottom: 13),
                        child: Text(
                          "Olivia Jenny",
                          style: GoogleFonts.signikaNegative(fontSize: 20),
                        )),
                    subtitle: Container(
                        margin: const EdgeInsets.only(left: 15, bottom: 13),
                        child: const Text("Awesome experiences")),
                    trailing: Container(
                      height: 50,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: const Color(0xff0E6B56),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                          child: Text(
                        "5.0",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: 100,
                child: Center(
                  child: ListTile(
                    leading: Transform.scale(
                      scale: 2,
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1602233158242-3ba0ac4d2167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z2lybHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60"),
                        ),
                      ),
                    ),
                    title: Container(
                        margin: const EdgeInsets.only(left: 12, bottom: 13),
                        child: Text(
                          "Olivia Jenny",
                          style: GoogleFonts.signikaNegative(fontSize: 20),
                        )),
                    subtitle: Container(
                        margin: const EdgeInsets.only(left: 15, bottom: 13),
                        child: const Text("Average experience")),
                    trailing: Container(
                      height: 50,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color:const Color(0xff0E6B56),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                          child: Text(
                        "5.0",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "\$29/night",
                  style: GoogleFonts.signikaNegative(
                      fontSize: 28, color: const Color(0xff0E6B56)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Payment()));
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.62,
                      decoration: BoxDecoration(
                        color: const Color(0xff0E6B56),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        "Book Now!",
                        style: GoogleFonts.signikaNegative(
                            fontSize: 25, color: Colors.white),
                      )),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
