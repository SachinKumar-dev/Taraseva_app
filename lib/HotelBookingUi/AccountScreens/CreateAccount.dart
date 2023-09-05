import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/LogPage.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var isChecked = false;
  final email = TextEditingController();
  final password = TextEditingController();

  //signup here
  void signUp() async {
    try {
      if (!email.text.contains('@gmail.com')) {
        throw Exception("Please enter a valid Gmail address.");
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('SignedUp Successfully'),
          duration: Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LogPage()));
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Signup failed.Please enter a valid Gmail address.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
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
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 30,
                  )),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 21.0),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: TextField(
                    controller: email,
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
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 21.0),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: TextField(
                    controller: password,
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
                height: 15.h,
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
                  onTap: signUp,
                  child: Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Text(
                      "SignUp",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
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
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogPage()));
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
