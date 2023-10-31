import 'package:flutter/material.dart';

class ManualBooking extends StatefulWidget {
  const ManualBooking({super.key});

  @override
  State<ManualBooking> createState() => _ManualBookingState();
}

class _ManualBookingState extends State<ManualBooking> {
  int selectedValue = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    const Padding(
                      padding: EdgeInsets.only(left: 60.0),
                      child: Text(
                        "Available For Booking",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Contacts',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 18.0),
                      child: Text(
                        "Available",
                        style: TextStyle(color: Color(0xff0E6B56), fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.91,
                  child: Card(
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/logos/img_27.png",
                          height: 35,
                        ),
                        title: const Text("Ravi Rajesh"),
                        subtitle: const Text("+91-8368127809"),
                        trailing: IconButton(onPressed: (){

                        }, icon: const Icon(Icons.call,color: Colors.blue,)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.91,
                  child: Card(
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/logos/img_27.png",
                          height: 35,
                        ),
                        title: const Text("Honey Paaji"),
                        subtitle: const Text("+91-8368127809"),
                        trailing: IconButton(onPressed: (){

                        }, icon: const Icon(Icons.call,color: Colors.blue,)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.91,
                  child: Card(
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/logos/img_27.png",
                          height: 35,
                        ),
                        title: const Text("Mukesh"),
                        subtitle: const Text("+91-8368127809"),
                        trailing: IconButton(onPressed: (){

                        }, icon: const Icon(Icons.call,color: Colors.blue,)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.91,
                  child: Card(
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/logos/img_27.png",
                          height: 35,
                        ),
                        title: const Text("Kamal Joshi"),
                        subtitle: const Text("+91-8368127809"),
                        trailing: IconButton(onPressed: (){

                        }, icon: const Icon(Icons.call,color: Colors.blue,)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.91,
                  child: Card(
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/logos/img_27.png",
                          height: 35,
                        ),
                        title: const Text("Ranjeet Kukreja"),
                        subtitle: const Text("+91-8368127809"),
                        trailing: IconButton(onPressed: (){

                        }, icon: const Icon(Icons.call,color: Colors.blue,)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.91,
                  child: Card(
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/logos/img_27.png",
                          height: 35,
                        ),
                        title: const Text("Abhi Rana"),
                        subtitle: const Text("+91-8368127809"),
                        trailing: IconButton(onPressed: (){

                        }, icon: const Icon(Icons.call,color: Colors.blue,)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.91,
                  child: Card(
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/logos/img_27.png",
                          height: 35,
                        ),
                        title: const Text("Jogi Singh"),
                        subtitle: const Text("+91-8368127809"),
                        trailing: IconButton(onPressed: (){

                        }, icon: const Icon(Icons.call,color: Colors.blue,)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
