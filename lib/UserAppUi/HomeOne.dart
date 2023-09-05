import 'package:flutter/material.dart';
import 'package:gitson/UserAppUi/Menu.dart';

class HomeOne extends StatefulWidget {
  const HomeOne({super.key});

  @override
  State<HomeOne> createState() => _HomeOneState();
}

class _HomeOneState extends State<HomeOne> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
          padding: const EdgeInsets.all(20.0),
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'assets/logos/img_1.png',
                    color: Colors.green,
                    scale: 20,
                  ),
                  suffixIcon: (const Icon(
                    Icons.car_rental,
                    color: Colors.green,
                    size: 30,
                  )),
                  hintText: "Where To?",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey))),
            ),
          ),
        ),
      ),
    ]);
  }
}
