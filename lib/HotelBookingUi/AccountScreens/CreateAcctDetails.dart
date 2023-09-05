import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gitson/HotelBookingUi/BookingScreens/SearchHotels.dart';
import 'package:gitson/HotelBookingUi/ProfileScreens/editProfile.dart';

class CreateAccountDetails extends StatefulWidget {
  const CreateAccountDetails({super.key});

  @override
  State<CreateAccountDetails> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccountDetails> {
  final firsrName = TextEditingController();
  final lastName = TextEditingController();
  final DOB = TextEditingController();
  final Gmail = TextEditingController();
  final MobileNumber = TextEditingController();
  final Gender = TextEditingController();

  int tappedContainerIndex = -1;
  String selectedTitle = '';

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

  Future<void> createData() async {
    CollectionReference db = FirebaseFirestore.instance.collection("user");
    await db.add({
      "title": selectedTitle,
      "firstName": firsrName.text,
      "lastName": lastName.text,
      "DOB": DOB.text,
      "Gmail": Gmail.text,
      "MobileNumber": MobileNumber.text,
      "Gender": Gender.text,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Reservation Successfull'),
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    Navigator.push(context,
        (MaterialPageRoute(builder: (context) => const SearchHotels())));
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
                    margin: const EdgeInsets.only(left: 65),
                    child: const Text(
                      "Name of Reservation",
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
                  width: 380,
                  height: 55,
                  child: TextFormField(
                    controller: firsrName,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "First Name",
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
                  width: 380,
                  height: 55,
                  child: TextFormField(
                    controller: lastName,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Last Name",
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
                  width: 380,
                  height: 55,
                  child: TextFormField(
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
                  width: 380,
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
                  width: 380,
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
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  width: 380,
                  height: 55,
                  child: TextFormField(
                    controller: Gender,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Gender",
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
              height: 135,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: createData,
                child: Container(
                  height: 50,
                  width: 380,
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
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 25,
              width: double.infinity,
              color: Colors.green,
            ),
          ]),
        ),
      ),
    );
  }
}
