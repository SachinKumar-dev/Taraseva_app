import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/HotelBookingUi/BookingScreens/SearchHotels.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int selectedValue = -1;
  void done(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content:Text('Reservation is made successfully'),
        duration: Duration(seconds: 2),)
    );
    Future.delayed(Duration(seconds: 2));
    Navigator.push(context,
        (MaterialPageRoute(builder: (context) => const SearchHotels())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 90.0),
                      child: Text(
                        "Payment",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Payment Methods',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 18.0),
                      child: Text(
                        "Add New Card",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.91,
                  child: Card(
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0.5,
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/img_4.png",
                          height: 35,
                        ),
                        title: const Text("Paypal"),
                        trailing: Radio(
                            value: 1,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                            activeColor: Colors
                                .green // Set the color of the selected radio button
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.91,
                  child: Card(
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0.5,
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/img.png",
                          height: 35,
                        ),
                        title: const Text("Google Pay"),
                        trailing: Radio(
                            value: 0,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                            activeColor: Colors
                                .green // Set the color of the selected radio button
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.91,
                  child: Card(
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0.5,
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/img_2.png",
                          height: 35,
                        ),
                        title: const Text("Apple Pay"),
                        trailing: Radio(
                            value: 2,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                            activeColor: Colors
                                .green // Set the color of the selected radio button
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.91,
                  child: Card(
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0.5,
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/img_5.png",
                          height: 35,
                        ),
                        title: const Text("•••• •••• •••• 4679"),
                        trailing: Radio(
                            value: 3,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                            activeColor: Colors
                                .green // Set the color of the selected radio button
                            ),
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: GestureDetector(
                  onTap: () {
                    //logic
                  },
                  child: GestureDetector(
                    onTap: done,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.91,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                          child: Text(
                        "Continue",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
