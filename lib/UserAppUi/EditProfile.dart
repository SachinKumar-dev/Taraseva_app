import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Edit Account",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(children: [
                Container(
                  height: 900,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 128.0),
                        child: CircleAvatar(
                          radius: 90,
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1554126807-6b10f6f6692a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Ym95fGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160.w,
                              child: TextField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    hintText: "First Name",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 160.w,
                              child: TextField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    hintText: "Last Name",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: SizedBox(
                          width: 390.w,
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintText: "Phone Number",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: SizedBox(
                          width: 390.w,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintText: "GMail",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Gender",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.3,
                            child: Radio(
                              value: 0,
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                              activeColor: Colors.green,
                              visualDensity: VisualDensity.standard,
                            ),
                          ),
                          const Text(
                            'Male',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 20),
                          Transform.scale(
                            scale: 1.3,
                            child: Radio(
                              value: 1,
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                          ),
                          const Text(
                            'Female',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: GestureDetector(
                          onTap: () {
                            //logic for SAVE
                          },
                          child: Container(
                            height: 60,
                            width: 380.w,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                                child: Text(
                              "SAVE",
                              style: TextStyle(fontSize: 18),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
