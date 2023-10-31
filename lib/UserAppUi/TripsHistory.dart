import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/Models/CabModel/Cab.dart';
import 'package:go_router/go_router.dart';

class TripHistory extends StatefulWidget {
  const TripHistory({super.key});

  @override
  State<TripHistory> createState() => _TripHistoryState();
}

class _TripHistoryState extends State<TripHistory> {
  void _handleMenuItemSelection(String value) {
    // Handle menu item selection here
    print('You selected: $value');
  }

  PopupMenuButton<String> buildPopupMenuButton() {
    return PopupMenuButton<String>(
      onSelected: _handleMenuItemSelection,
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Option 1',
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.download_outlined,
                    color: Colors.black,
                  ),
                ),
                Text('All Bookings'),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'Option 2',
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.pending,
                    color: Colors.black,
                  ),
                ),
                Text('Pending'),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'Option 2',
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.confirmation_number_sharp,
                    color: Colors.black,
                  ),
                ),
                Text('Confirmed'),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'Option 3',
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.ac_unit_outlined,
                    color: Colors.black,
                  ),
                ),
                Text('Ongoing'),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'Option 3',
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.done_outline,
                    color: Colors.black,
                  ),
                ),
                Text('Completed'),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'Option 3',
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.cancel,
                    color: Colors.black,
                  ),
                ),
                Text('Cancelled'),
              ],
            ),
          ),
        ];
      },
    );
  }

  List<Cab> list = Cab.cabs;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0E6B56),
        title: const Center(child: Text("My Trips")),
        actions: [
          buildPopupMenuButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    context.push("/tripsTwo");
                  },
                  child: SizedBox(
                    height: height * 0.34,
                    width: width * 0.3,
                    child: Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              const SizedBox(
                                width: 11,
                              ),
                              Container(
                                height: 40,
                                width: width * 0.368,
                                decoration: BoxDecoration(
                                    color: list[index].color,
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(12))),
                                child: Center(
                                    child: Text(
                                  list[index].status,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 17),
                                )),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                            color: Color(0xff0E6B56),
                            height: 15,
                            endIndent: 10,
                            indent: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              SizedBox(
                                width: 14.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.date_range,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(list[index].date),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.more_time_rounded,
                                        size: 18,
                                      ),
                                      Text(list[index].time),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
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
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                            color: Color(0xff0E6B56),
                            height: 15,
                            endIndent: 10,
                            indent: 10,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height: height * 0.039,
                                  width: width * 0.29,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff0E6B56),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Center(
                                      child: Text(
                                    list[index].area,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height: height * 0.039,
                                  width: width * 0.29,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff0E6B56),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Center(
                                      child: Text(
                                    list[index].fareType,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  )),
                                ),
                              ),
                              Column(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 35.0, top: 5),
                                    child: Text(
                                      'TOTAL FARE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40.0, top: 5),
                                    child: Text(
                                      list[index].fare,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff0E6B56),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
