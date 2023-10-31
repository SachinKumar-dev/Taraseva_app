import 'package:flutter/material.dart';

class Cab {
  final String img;
  final String name;
  final String vehicle;
  final String numberPlate;
  final String status;
  final String source;
  final String destination;
  final String date;
  final String time;
  final String fareType;
  final String area;
  final String fare;
  final Color color;

  Cab(
      {required this.img,
        required this.name,
        required this.vehicle,
        required this.numberPlate,
        required this.status,
        required this.source,
        required this.destination,
        required this.date,
        required this.time,
        required this.fareType,
        required this.area,
        required this.fare,
        required this.color,
      });

  static List<Cab> cabs = [
    Cab(
      img: 'assets/images/cab1.jpg',
      name: 'Pavan Kumar',
      vehicle: 'Toyota Etios',
      numberPlate: 'JFHFH2344242',
      status: 'Confirmed',
      source: 'Shastri Nagar,Kamla Road,Delhi',
      destination: 'RK Puram,near IIT Delhi,New Delhi',
      date: '2024-10-12',
      time: '9:24 am',
      fareType: 'Weekend Fare',
      area: 'Outstation',
      fare: '₹ 643',
      color: Colors.blue.shade400,
    ),
    Cab(
      img: 'assets/images/cab1.jpg',
      name: 'Ravi Yadav',
      vehicle: 'Toyota Etios',
      numberPlate: 'JFHFH2344242',
      status: 'Ongoing',
      source: 'Shastri Nagar,Kamla Road,Delhi',
      destination: 'RK Puram,near IIT Delhi,New Delhi',
      date: '2024-10-12',
      time: '9:24 am',
      fareType: 'Weekend Fare',
      area: 'Outstation',
      fare: '₹ 887',
        color: Colors.deepPurple.shade400
    ),
    Cab(
      img: 'assets/images/cab2.jpg',
      name: 'Pavan Kumar',
      vehicle: 'Toyota Etios',
      numberPlate: 'JFHFH2344242',
      status: 'Completed',
      source: 'Shastri Nagar,Kamla Road,Delhi',
      destination: 'RK Puram,near IIT Delhi,New Delhi',
      date: '2024-10-12',
      time: '9:24 am',
      fareType: 'Night Fare',
      area: 'Local',
      fare: '₹ 467',
        color: Colors.green.shade400
    ),
    Cab(
      img: 'assets/images/cab1.jpg',
      name: 'Nitish Kumar',
      vehicle: 'Toyota Etios',
      numberPlate: 'JFHFH2344242',
      status: 'Confirmed',
      source: 'Shastri Nagar,Kamla Road,Delhi',
      destination: 'RK Puram,near IIT Delhi,New Delhi',
      date: '2024-10-12',
      time: '9:24 am',
      fareType: 'Weekend Fare',
      area: 'Outstation',
      fare: '₹ 643',
      color: Colors.blue.shade400,
    ),
    Cab(
      img: 'assets/images/cab1.jpg',
      name: 'Pavan Kumar',
      vehicle: 'Toyota Etios',
      numberPlate: 'JFHFH2344242',
      status: 'Cancelled',
      source: 'Shastri Nagar,Kamla Road,Delhi',
      destination: 'RK Puram,near IIT Delhi,New Delhi',
      date: '2024-10-12',
      time: '9:24 am',
      fareType: 'Normal Fare',
      area: 'Local',
      fare: '₹ 401',
        color: Colors.red.shade400
    ),
    Cab(
      img: 'assets/images/cab2.jpg',
      name: 'Pavan Kumar',
      vehicle: 'Toyota Etios',
      numberPlate: 'JFHFH2344242',
      status: 'Pending',
      source: 'Shastri Nagar,Kamla Road,Delhi',
      destination: 'RK Puram,near IIT Delhi,New Delhi',
      date: '2024-10-12',
      time: '9:24 am',
      fareType: 'Weekend Fare',
      area: 'Outstation',
      fare: '₹ 643',
        color: Colors.deepOrange.shade400
    ),
    Cab(
      img: 'assets/images/cab2.jpg',
      name: 'Pavan Kumar',
      vehicle: 'Toyota Etios',
      numberPlate: 'JFHFH2344242',
      status: 'Ongoing',
      source: 'Shastri Nagar,Kamla Road,Delhi',
      destination: 'RK Puram,near IIT Delhi,New Delhi',
      date: '2024-10-12',
      time: '9:24 am',
      fareType: 'Weekend Fare',
      area: 'Outstation',
      fare: '₹ 376',
        color: Colors.deepPurple.shade400
    ),
  ];
}
