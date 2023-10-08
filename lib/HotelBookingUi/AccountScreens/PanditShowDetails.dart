import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class PanditShowDetails extends StatefulWidget {
  const PanditShowDetails({Key? key}) : super(key: key);

  @override
  State<PanditShowDetails> createState() => _PanditShowDetailsState();
}

class _PanditShowDetailsState extends State<PanditShowDetails> {
  List<DocumentSnapshot> documents = [];
  int tappedContainerIndex = -1;
  //handling taps of navBar
  int selectedIndex = 1;
  //sign Out
  Future<void> logOut() async {
    try {
      setState(()  {
        FirebaseAuth.instance.signOut();
      });
     context.go('/signup');
    } catch (e) {
      print("Error during logout: $e");
    }
  }
  //handling the navBar
  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (selectedIndex == 0) {
      context.go('/panditchat');
    }
    else if (selectedIndex == 1) {
      context.go('/panditShowDetails');
    }
    else if (selectedIndex == 2) {
      logOut();
    }
  }
  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Pandit Details')
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
          context.go('/panditchat');
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
                       context.go('/panditchat');
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 80.0),
                      child: Text(
                        "Personal Details",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 180.h,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          String imageUrl = documents[index]["imageUrlP"];
                          return Expanded(
                            child: CircleAvatar(
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
                            ),
                          );
                        }),
                  ),
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
                              documents[index]['Puja'],
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
          currentIndex: selectedIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color(0xff0E6B56),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: "SignOut"),
          ]),
    );
  }
}
