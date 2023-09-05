import 'package:flutter/material.dart';

class CancelBooking extends StatefulWidget {
  const CancelBooking({super.key});

  @override
  State<CancelBooking> createState() => _CancelBookingState();
}

class _CancelBookingState extends State<CancelBooking> {
  int selectedValue = -1;

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
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 65),
                      child: const Text(
                        "Cancel Hotel Booking",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  ' Please select a payment refund method (only \n 80% will be refunded).',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: 380,
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
                  width: 380,
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
                  width: 380,
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
                  width: 380,
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
              const SizedBox(
                height: 140,
              ),
              const Center(
                child: SizedBox(
                  height: 50,
                  child: Text(
                    "Paid:\$479.5   Refund:\$383.8"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: GestureDetector(
                  onTap: () {
                    //logic
                  },
                  child: Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Text(
                      "Confirm Cancellation",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 25,
                width: double.infinity,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
