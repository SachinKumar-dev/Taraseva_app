import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xff0E6B56),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 90,
          leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded),
          ),
          title: const Text(
            "My Wallet",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(58.0),
                    child: CircleAvatar(
                      radius: 80,
                      child: Image.asset(
                        "assets/images/img_28.png",
                        scale: 4,
                      ),
                    ),
                  ),
                  const Text(
                    "₹0",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.38,
                  ),
                  GestureDetector(
                    onTap: () {
                      //logic
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Expanded(
                        child: Container(
                          height: 50,
                          width: 350.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:const Color(0xff0E6B56)),
                          child: const Center(
                              child: Text(
                            "ADD MONEY",
                            style: TextStyle(fontSize: 15,color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
