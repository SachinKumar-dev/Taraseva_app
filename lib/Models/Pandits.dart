import 'package:flutter/material.dart';

class Pandits {
  final String img;
  final String name;
  final String experiences;

  Pandits({
    required this.img,
    required this.name,
    required this.experiences,
  });

  static List listpandits = [
    Pandits(
        img: "assets/images/pandit.jpg",
        name: "Pandit HariOm",
        experiences: "5 years",
       ),
    Pandits(
        img: "assets/images/pandit.jpg",
        name: "Pandit Aditya",
        experiences: "8 years",
        ),
    Pandits(
        img: "assets/images/pandit.jpg",
        name: "Pandit Vikash",
        experiences: "2 years",
        ),
    Pandits(
        img: "assets/images/pandit.jpg",
        name: "Pandit Raghav",
        experiences: "9 years",
       ),
    Pandits(
        img: "assets/images/pandit.jpg",
        name: "Pandit Sukhi",
        experiences: "7 years",
       ),
    Pandits(
        img: "assets/images/pandit.jpg",
        name: "Pandit Ram",
        experiences: "1 years",
        ),
  ];
}
