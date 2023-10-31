import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Models/CabModel/Cab.dart';

class TripsTwo extends StatefulWidget {
  const TripsTwo({super.key});

  @override
  State<TripsTwo> createState() => _TripsTwoState();
}

class _TripsTwoState extends State<TripsTwo> {
  List<Cab> list = Cab.cabs;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0E6B56),
        title: const Center(child: Text("Booking Summary")),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height * 0.15,
                width: double.infinity,
                child: Card(
                  shadowColor: Colors.grey,
                  surfaceTintColor: Colors.green,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Row(children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.ac_unit_sharp,
                                    size: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    list[index].source,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              ]);
                            }),
                        const Text("To"),
                        ListView.builder(
                            physics: const BouncingScrollPhysics(
                                decelerationRate:
                                    ScrollDecelerationRate.normal),
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Row(children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.red,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    list[index].destination,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              ]);
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height * 0.2,
                width: double.infinity,
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height * 0.07,
                              width: width * 0.36,
                              decoration: BoxDecoration(
                                  color: const Color(0xff0E6B56),
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "One Way",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "Get dropped off",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: height * 0.07,
                            width: width * 0.36,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(4)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Round-trip",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Keep the car till return",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left:12.0,top: 4),
                        child: Text(
                          "When",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(list[index].date),
                                  SizedBox(
                                    width: 50.w,
                                  ),
                                  const Icon(
                                    Icons.more_time_rounded,
                                    size: 18,
                                  ),
                                  Text(list[index].time),
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Selected Cab",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height * 0.15,
                width: double.infinity,
                child: Card(
                  shadowColor:Colors.green,
                  elevation: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          "assets/images/Toyota.jpg",
                          scale: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Toyota",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child:
                                        const Center(child: Text("6 seater")),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Center(child: Text("Petrol")),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(child: Text("Manual")),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              height: 20,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Center(child: Text("Air Bags")),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "₹ 250",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height * 0.18,
                width: double.infinity,
                child: Card(
                  elevation: 2,
                  child: ListView.builder(
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 80.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(list[index].img),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          list[index].name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(list[index].vehicle),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(list[index].numberPlate),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff0E6B56),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          "4.8 *",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        )),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Status"),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Arriving in 10 mins",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        "Cancel Ride",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.call),
                                      Text(
                                        "Call Now",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: SizedBox(
                  height: height * 0.55,
                  width: double.infinity,
                  child: const Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Booking Id",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "B345UYHIONT60",
                                style: TextStyle(
                                    color: Color(0xff0E6B56),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total KMs",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "55.5 kms",
                                style: TextStyle(
                                    color: Color(0xff0E6B56),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Fare Applied",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "normal",
                                style: TextStyle(
                                    color: Color(0xff0E6B56),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Base Fare",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹ 60",
                                style: TextStyle(
                                    color: Color(0xff0E6B56),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Excess Km",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "15 Kms",
                                style: TextStyle(
                                    color: Color(0xff0E6B56),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Standard Fare/Km",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹ 10/Km",
                                style: TextStyle(
                                    color: Color(0xff0E6B56),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Additional Label",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹ 353.09",
                                style: TextStyle(
                                    color: Color(0xff0E6B56),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Total Fare",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹ 445.5",
                                style: TextStyle(
                                    color: Color(0xff0E6B56),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹ 45.5",
                                style: TextStyle(
                                    color: Color(0xff0E6B56),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Color(0xff0E6B56),
                          height: 15,
                          endIndent: 10,
                          indent: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Fare",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹ 401.1",
                                style: TextStyle(
                                    color: Color(0xff0E6B56),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "** All prices are inclusive of GST **",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
