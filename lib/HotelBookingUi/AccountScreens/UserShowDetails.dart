import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../Pandits/UserChat.dart';
import '../../Services/ServicesOpt.dart';


class ShowDetails extends StatefulWidget {
  const ShowDetails({Key? key}) : super(key: key);

  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  List<DocumentSnapshot> documents = [];
  @override
  void initState() {
    super.initState();
    readData();
  }
  int tappedContainerIndex = -1;

  //handling taps of navBar
  int selectedIndex = 1;

  //handling the navBar
  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (selectedIndex == 2) {
      context.go("/userMainScreen");
    } else if (selectedIndex == 1) {
      context.go("/showDetails");
    } else if (selectedIndex == 0) {
      context.go("/userchat");
    }
  }
  Future<void> readData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('User')
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();

      setState(() {
        documents = querySnapshot.docs;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          context.go("/userchat");
          return false;
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.go("/userchat");
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 65.0),
                      child: Text(
                        "Personal Details",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height:170.h,
                  child: ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        String imageUrl = documents[index]["imageUrl"];
                        return CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.black,
                          child: ClipOval(
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              // Use BoxFit.cover to fit the image within the circle
                              width: 160,
                              // Adjust the width as needed
                              height: 160, // Adjust the height as needed
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.91,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 19),
                            child: Text(
                              documents[index]['title'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.91,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 19),
                            child: Text(
                              documents[index]['name'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.91,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 19),
                            child: Text(
                              documents[index]['address'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.91,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 19),
                            child: Text(
                              documents[index]['DOB'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.91,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 19),
                            child: Text(
                              documents[index]['Gmail'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.91,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 19),
                            child: Text(
                              documents[index]['MobileNumber'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.91,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 19),
                            child: Text(
                              documents[index]['Gender'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor:const Color(0xff0E6B56),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chats",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/logos/img_10.png")),
                label: "Return"),
          ]),
    );
  }
}

