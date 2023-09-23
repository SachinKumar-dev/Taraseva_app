import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/Pandits/ShowPanditDetails.dart';

class PanditInfo extends StatefulWidget {
  const PanditInfo({super.key});

  @override
  State<PanditInfo> createState() => _PanditInfoState();
}

class _PanditInfoState extends State<PanditInfo> {
  final name = TextEditingController();
  final address = TextEditingController();
  final DOB = TextEditingController();
  final Gmail = TextEditingController();
  final MobileNumber = TextEditingController();
  final PujaPaliDate = TextEditingController();

  int tappedContainerIndex = -1;
  String selectedTitle = '';
//container error handling
  void _handleTap(int index) {
    setState(() {
      tappedContainerIndex = index;
      if (index == 0) {
        selectedTitle = 'Mr.';
      } else if (index == 1) {
        selectedTitle = 'Mrs.';
      } else if (index == 2) {
        selectedTitle = 'Ms.';
      }
    });
  }
 //error handling
  void detailHandling() {
    if (name.text.isEmpty) {
      throw Exception("Please fill all the details.");
    } else if (address.text.isEmpty) {
      throw Exception("Please fill all the details");
    } else if (DOB.text.isEmpty) {
      throw Exception("Please fill all the details");
    } else if (Gmail.text.isEmpty) {
      throw Exception("Please fill all the details");
    } else if (MobileNumber.text.isEmpty) {
      throw Exception("Please fill all the details");
    } else if (PujaPaliDate.text.isEmpty) {
      throw Exception("Please fill all the details");
    } else if (selectedTitle.isEmpty) {
      throw Exception("Please fill all the details");
    }
  }

//adding data to database
  Future<void> createData() async {
    DateTime now = DateTime.now();
    try {
      detailHandling();
      CollectionReference db = FirebaseFirestore.instance.collection(
          "Pandit Details");
      await db.add({
        "title": selectedTitle,
        "name": name.text,
        "address": address.text,
        "DOB": DOB.text,
        "Gmail": Gmail.text,
        "MobileNumber": MobileNumber.text,
        "Puja": PujaPaliDate.text,
        'createdAt': now,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Details Saved!'),
          duration: Duration(seconds: 2),
        ),
      );
      Future.delayed(const Duration(seconds: 5));
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          (MaterialPageRoute(builder: (context) => const ShowPanditDetails())));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("All fields are mandatory"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Container(
                    margin: const EdgeInsets.only(left: 75),
                    child: const Text(
                      "Pandit Details",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _handleTap(0),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: tappedContainerIndex == 0
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.green)),
                      child: Center(
                          child: Text(
                            "Mr.",
                            style: TextStyle(
                              color: tappedContainerIndex == 0
                                  ? Colors.white
                                  : Colors.green,
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _handleTap(1),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: tappedContainerIndex == 1
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.green)),
                      child: Center(
                          child: Text(
                            "Mrs.",
                            style: TextStyle(
                              color: tappedContainerIndex == 1
                                  ? Colors.white
                                  : Colors.green,
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _handleTap(2),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: tappedContainerIndex == 2
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.green)),
                      child: Center(
                          child: Text(
                            "Ms.",
                            style: TextStyle(
                              color: tappedContainerIndex == 2
                                  ? Colors.white
                                  : Colors.green,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.91,
                  height: 55,
                  child: TextFormField(
                    controller: name,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.91,
                  height: 55,
                  child: TextFormField(
                    controller: address,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Address",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.91,
                  height: 55,
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    controller: DOB,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "DOB",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.91,
                  height: 55,
                  child: TextFormField(
                    controller: Gmail,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Gmail",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.91,
                  height: 55,
                  child: TextFormField(
                    controller: MobileNumber,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Mobile Number",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.91,
                  height: 55,
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    controller: PujaPaliDate,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Puja Pali Date",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: createData,
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
          ]),
        ),
      ),
    );
  }
}
