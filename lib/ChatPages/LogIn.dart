import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:gitson/ChatPages/ChatScreen.dart";
import "package:gitson/ChatPages/SignUp.dart";
import "package:google_fonts/google_fonts.dart";
import "../AuthLogic/auth.dart";
import "../HotelBookingUi/AccountScreens/CreateAccount.dart";

class ChatLog extends StatefulWidget {
  const ChatLog({super.key});

  @override
  State<ChatLog> createState() => _ChatLogState();
}

class _ChatLogState extends State<ChatLog> {
  bool isChecked = false;
  final emailTwo = TextEditingController();
  final passwordTwo = TextEditingController();

  Future<void> signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTwo.text,
        password: passwordTwo.text,
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const ChatPage()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid credentials. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailTwo.dispose();
    passwordTwo.dispose();
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
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 30.sp,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text("Login to your",
                    style: GoogleFonts.rubik(
                      fontSize: 50.sp,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text("Account",
                    style: GoogleFonts.rubik(
                      fontSize: 50.sp,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 1.h),
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
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 1.h),
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
              const SizedBox(
                height: 15,
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
                  onTap: signIn,
                  child: Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                  child: Text(
                'Forgot the password?',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 15,
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
                    "Don't have an account?",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatSignUp()));
                      },
                      child: const Text(
                        "Sign up",
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
