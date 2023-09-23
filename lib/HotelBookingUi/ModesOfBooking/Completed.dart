import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletedBookings extends StatefulWidget {
  const CompletedBookings({super.key});

  @override
  State<CompletedBookings> createState() => _CompletedBookingsState();
}

class _CompletedBookingsState extends State<CompletedBookings> {
  int tappedContainerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: DefaultTabController(
        length: 3,
        initialIndex: 0, // Set the initial tab index here
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.green,
            title: Text("My Booking", style: GoogleFonts.signikaNegative(fontSize: 30)),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Implement your search functionality here
                },
              ),
            ],
            bottom: TabBar(
              labelStyle: GoogleFonts.signikaNegative(fontSize: 20),
              tabs: const [
                Tab(text: "Completed"),
                Tab(text: "Ongoing"),
                Tab(text: "Canceled"),
              ],
              indicatorColor: Colors.green,
              onTap: (index) {
                setState(() {
                  tappedContainerIndex = index;
                });
              },
            ),
          ),
          body: TabBarView(
            children: [
              // Completed Tab
              _buildTabContent("Completed", Colors.green, "Yea, you have completed it!"),

              // Ongoing Tab
              _buildTabContent("Ongoing", Colors.blue, "Payments are still pending!"),

              // Canceled Tab
              _buildTabContent("Canceled", Colors.red, "Refund has initiated!"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(String title, Color color, String message) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 150.h,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/images/H-Three.jpg"),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                "Bulgari Resort",
                                style: GoogleFonts.signikaNegative(fontSize: 20.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("Paris, France", style: GoogleFonts.signikaNegative(fontSize: 20.sp)),
                            SizedBox(height: 35.h),
                            Container(
                              height: 40,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color,
                              ),
                              child: Center(
                                child: Text(
                                  title,
                                  style: GoogleFonts.signikaNegative(fontSize: 20.sp, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: color.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(message, style: GoogleFonts.signikaNegative(fontSize: 20.sp, color: color)),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 150.h,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/images/H-Three.jpg"),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                "Bulgari Resort",
                                style: GoogleFonts.signikaNegative(fontSize: 20.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("Paris, France", style: GoogleFonts.signikaNegative(fontSize: 20.sp)),
                            SizedBox(height: 35.h),
                            Container(
                              height: 40,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color,
                              ),
                              child: Center(
                                child: Text(
                                  title,
                                  style: GoogleFonts.signikaNegative(fontSize: 20.sp, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: color.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(message, style: GoogleFonts.signikaNegative(fontSize: 20.sp, color: color)),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 150.h,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/images/H-Three.jpg"),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                "Bulgari Resort",
                                style: GoogleFonts.signikaNegative(fontSize: 20.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("Paris, France", style: GoogleFonts.signikaNegative(fontSize: 20.sp)),
                            SizedBox(height: 35.h),
                            Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: color,
                              ),
                              child: Center(
                                child: Text(
                                  title,
                                  style: GoogleFonts.signikaNegative(fontSize: 20.sp, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: color.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(message, style: GoogleFonts.signikaNegative(fontSize: 20.sp, color: color)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
