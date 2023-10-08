import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/Pandits/UserChat.dart';
import 'package:gitson/Services/ServicesOpt.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  //sharedpref
  Future<void> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final onboardingShown = prefs.getBool('user') ?? false;

    if (onboardingShown) {
      // Onboarding has been shown before, navigate to a different screen
      context.go('/userMainScreen');
    }
    prefs.setBool('user', true);
  }
  @override
  void initState() {
    super.initState();
    checkOnboardingStatus();
  }
  //controllers
  bool isUploading = false;
  final name = TextEditingController();
  final address = TextEditingController();
  final DOB = TextEditingController();
  final Gmail = TextEditingController();
  final MobileNumber = TextEditingController();
  final Gender = TextEditingController();

  int tappedContainerIndex = -1;
  String selectedTitle = '';

//handling container taps
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
  bool validateFields() {
    if (name.text.isEmpty ||
        address.text.isEmpty ||
        DOB.text.isEmpty ||
        Gmail.text.isEmpty ||
        MobileNumber.text.isEmpty ||
        Gender.text.isEmpty ||
        selectedTitle.isEmpty) {
      return false;
    }
    return true;
  }

  //image picker
  File? _imageFile;
  bool imagePicked = false;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        imagePicked = true;
      } else {
        print('No image selected.');
      }
    });
  }

//adding user to database
  Future<void> createData(String? imageUrl) async {
    DateTime now=DateTime.now();
    try {
      CollectionReference db = FirebaseFirestore.instance.collection("User");
      validateFields();
      await db.add({
        "title": selectedTitle,
        "name": name.text,
        "address": address.text,
        "DOB": DOB.text,
        "Gmail": Gmail.text,
        "MobileNumber": MobileNumber.text,
        "Gender": Gender.text,
        "createdAt":now,
        "imageUrl": imageUrl,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xff0E6B56),
          content: Text('Details Saved'),
          duration: Duration(seconds: 2),
        ),
      );
      Future.delayed(const Duration(seconds: 5));
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          (MaterialPageRoute(builder: (context) => const ServicesOpt())));
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
  //add image to firebase
  Future<String?> uploadImageToFirebase(File? imageFile) async {
    if (imageFile == null) return null;

    try {
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_images/${DateTime.now()}.jpg');
      final UploadTask uploadTask = storageReference.putFile(imageFile);

      final TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      final String imageUrl = await snapshot.ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:
              Stack(
                children:[ Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      margin:  EdgeInsets.only(left: 100.w),
                      child: const Text(
                        "User Details",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
            ),
                  Center(
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.grey,
                      backgroundImage:
                      _imageFile != null ? FileImage(_imageFile!) : null,
                      child: GestureDetector(
                          onTap: _getImage,
                          child: Padding(
                            padding: EdgeInsets.only(top: 120.0.h, left: 80.w),
                            child: Container(
                                height: 60,
                                width: 200,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff0E6B56),
                                ),
                                child: const Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          )),
                    ),
                  ),
                  SizedBox(height: 20.0.h),
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
                                ?  Color(0xff0E6B56)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color:  Color(0xff0E6B56))),
                        child: Center(
                            child: Text(
                          "Mr.",
                          style: TextStyle(
                            color: tappedContainerIndex == 0
                                ? Colors.white
                                : Color(0xff0E6B56),
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
                                ?  Color(0xff0E6B56)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Color(0xff0E6B56))),
                        child: Center(
                            child: Text(
                          "Mrs.",
                          style: TextStyle(
                            color: tappedContainerIndex == 1
                                ? Colors.white
                                :  Color(0xff0E6B56),
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
                                ?  Color(0xff0E6B56)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color:  Color(0xff0E6B56))),
                        child: Center(
                            child: Text(
                          "Ms.",
                          style: TextStyle(
                            color: tappedContainerIndex == 2
                                ? Colors.white
                                :  Color(0xff0E6B56),
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
                    width: MediaQuery.of(context).size.width * 0.91,
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
                    width: MediaQuery.of(context).size.width * 0.91,
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
                    width: MediaQuery.of(context).size.width * 0.91,
                    height: 55,
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      controller: DOB,
                      cursorColor: Colors.black54,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "DOB(12/01/2000)",
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
                    width: MediaQuery.of(context).size.width * 0.91,
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
                    width: MediaQuery.of(context).size.width * 0.91,
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
                    width: MediaQuery.of(context).size.width * 0.91,
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
            SizedBox(
                height: 50.h,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    if (validateFields() && imagePicked) {
                      setState(() {
                        isUploading = true; // Start uploading
                      });

                      String? imageUrl = await uploadImageToFirebase(_imageFile);
                      await createData(imageUrl);

                      setState(() {
                        isUploading = false; // Upload finished
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content:
                          Text("Please fill all fields and select an image."),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.91,
                      decoration: BoxDecoration(
                          color: const Color(0xff0E6B56),
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
          ]),
                  if (isUploading)
                    Positioned(
                      top: MediaQuery.of(context).size.height*0.5,
                      left: MediaQuery.of(context).size.height*0.2,
                      child: const CircularProgressIndicator(
                        color:Color(0xff0E6B56),
                      ),
                    ),
              ]),
        ),
      ),
    );
  }
}
