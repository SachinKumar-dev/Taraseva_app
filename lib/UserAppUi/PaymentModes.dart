import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentModes extends StatefulWidget {
  const PaymentModes({super.key});

  @override
  State<PaymentModes> createState() => _PaymentModesState();
}

class _PaymentModesState extends State<PaymentModes> {
  int selectedValue = -1;

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
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded,color: Colors.white,),
            ),
            title: const Text(
              "Payment Modes",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 45,
                            decoration: BoxDecoration(
                              color:Color(0xff0E6B56),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 12.0, left: 18),
                              child: Text(
                                "Payment Methods",
                                style: TextStyle(fontSize: 20,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey.shade500,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 7.0, left: 2),
                                  child: Image.asset(
                                    "assets/images/img_27.png",
                                    scale: 3,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Cash",
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                              ),
                              Transform.scale(
                                scale: 1.3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Radio(
                                      value: 0,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value!;
                                        });
                                      },
                                      activeColor:Color(0xff0E6B56)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey.shade500,
                                child: Image.asset(
                                  "assets/images/img_26.png",
                                  color: Colors.white,
                                  scale: 2,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "UPI",
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.51,
                              ),
                              Transform.scale(
                                scale: 1.3,
                                child: Radio(
                                    value: 1,
                                    groupValue: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value!;
                                      });
                                    },
                                    activeColor: Color(0xff0E6B56),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Container(
                            width: 380,
                            height: 45,
                            decoration: BoxDecoration(
                              color:Color(0xff0E6B56),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 12.0, left: 18),
                              child: Text(
                                "My Wallet",
                                style: TextStyle(fontSize: 20,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.grey.shade500,
                                    child: Image.asset(
                                      "assets/images/img_22.png",
                                      color: Colors.white,
                                      scale: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Use Wallet",
                                    style: TextStyle(fontSize: 20.sp),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                  ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Radio(
                                          value: 2,
                                          groupValue: selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value!;
                                            });
                                          },
                                          activeColor: Color(0xff0E6B56)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Container(
                            width: 380,
                            height: 45,
                            decoration: BoxDecoration(
                              color:Color(0xff0E6B56),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 12.0, left: 18),
                              child: Text(
                                "Promotions",
                                style: TextStyle(fontSize: 20,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            //logic
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0.w),
                            child: Text(
                              "Add Promo/Gift Code",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Color(0xff0E6B56),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0.w),
                          child: const Divider(
                            thickness: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            //logic
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xff0E6B56),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(fontSize: 20,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
