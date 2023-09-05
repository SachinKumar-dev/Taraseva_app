import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/ChatPages/LogIn.dart';
import 'package:google_fonts/google_fonts.dart';
import '../HotelBookingUi/AccountScreens/LogPage.dart';

class ChatSignUp extends StatefulWidget {
  const ChatSignUp({super.key});

  @override
  State<ChatSignUp> createState() => _ChatSignUpState();
}

class _ChatSignUpState extends State<ChatSignUp> {
  var isChecked = false;
  final emailTwo = TextEditingController();
  final passwordTwo = TextEditingController();
  final cpassword = TextEditingController();
  //check fields
  void checkField() {
    // ignore: unrelated_type_equality_checks
    if (emailTwo == "" && passwordTwo == "" && cpassword == "") {
      print("Please fill all the details");
    }
    if (cpassword.text.trim() != passwordTwo.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Missmatched password'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      signUp();
    }
  }

  //signup here
  void signUp() async {
    UserCredential? credential;
    try {
      if (!emailTwo.text.contains('@gmail.com')) {
        throw Exception("Please enter a valid Gmail address.");
      }
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTwo.text.trim(),
        password: passwordTwo.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('SignedUp Successfully'),
          duration: Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ChatLog()));
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Signup failed.Please enter a valid Gmail address.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
    //   // if (credential != null) {
    //   //   String uid = credential.user!.uid;
    //   //   UserModel newUser = UserModel(
    //   //       uid: uid, fullname: "", email: emailTwo.text.trim(), profilepic: "");
    //     await FirebaseFirestore.instance
    //         .collection("users")
    //         .doc(uid)
    //         .set(newUser.toMap())
    //         .then((value) => print("New user created"));
    //     // ignore: use_build_context_synchronously
    //     Navigator.push(context, MaterialPageRoute(builder: (context) {
    //       return CompleteProfile(
    //           userModel: newUser, firebaseUser: credential!.user!);
    //     }));
    //   }
    // }
  }
  @override
  void dispose() {
    super.dispose();
    emailTwo.dispose();
    passwordTwo.dispose();
    cpassword.dispose();
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
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Text("Create your",
                    style: GoogleFonts.rubik(
                      fontSize: 50,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Text("Account",
                    style: GoogleFonts.rubik(
                      fontSize: 50,
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 21.0),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: TextField(
                    controller: emailTwo,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        prefixIcon: const Icon(
                          Icons.email_rounded,
                          color: Colors.black54,
                        ),
                        hintText: ("Email"),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ))),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 21.0),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: TextField(
                    controller: passwordTwo,
                    obscureText: true,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      suffixIcon: Image.asset(
                        'assets/images/img_3.png',
                        scale: 20,
                        color: Colors.black54,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black54,
                      ),
                      hintText: ("Password"),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 21.0.w),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: TextField(
                    obscureText: true,
                    controller: cpassword,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black54,
                        ),
                        suffixIcon: Image.asset(
                          'assets/images/img_3.png',
                          scale: 20,
                          color: Colors.black54,
                        ),
                        hintText: ("Confirm Password"),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ))),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    activeColor: Colors.green,
                    value: isChecked,
                    onChanged: (bool? newValue) {
                      // This function will be called whenever the checkbox is toggled
                      setState(() {
                        isChecked =
                            newValue ?? true; // Update the value of _isChecked
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  Text(
                    "Remember me",
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: GestureDetector(
                  onTap: () {
                    //logic
                  },
                  child: GestureDetector(
                    onTap: checkField,
                    child: Container(
                      height: 50,
                      width: 380,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        "SignUp",
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text(
                    "or continue with",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 15,
                          left: 30,
                          child: Image.asset(
                            "assets/images/img_1.png",
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 17,
                          left: 30,
                          child: Image.asset(
                            "assets/images/img.png",
                            height: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 15,
                          left: 30,
                          child: Image.asset(
                            "assets/images/img_2.png",
                            height: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 15.sp, color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatLog()));
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
