import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/ChattingScreens/InsideChatPagePreviewTwo.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/PanditShowDetails.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/SignUpPage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


class PanditChat extends StatefulWidget {
  const PanditChat({super.key});

  @override
  State<PanditChat> createState() => _PanditChatState();
}

class _PanditChatState extends State<PanditChat> {

  bool isClick=false;

  //dialog box
  void showImagePreviewDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: 300,
            height: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: 300,
                    height: 300,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    color:  const Color(0xff0E6B56),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PreviewTwo()));
                            },
                            child: const Icon(Icons.chat_sharp,color: Colors.white,)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isClick = !isClick;
                            });
                          },
                          child: isClick
                              ? const Icon(Icons.favorite_rounded, color: Colors.red)
                              : const Icon(Icons.favorite_border_rounded, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
//fetch user
  List<DocumentSnapshot> documents = [];

  Future<void> readData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('User')
          .orderBy('createdAt', descending: true)
          .get();

      setState(() {
        documents = querySnapshot.docs;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
  @override
  void initState() {
    super.initState();
    readData();
  }
//sign Out
  Future<void> logOut() async {
    try {
      setState(()  {
        FirebaseAuth.instance.signOut();
      });
     context.go("/signup");
    } catch (e) {
      print("Error during logout: $e");
    }
  }
  int tappedContainerIndex = -1;

  //handling taps of navBar
  int selectedIndex = 0;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Available Bhakts",
          style: GoogleFonts.inter(fontSize: 20.sp),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search,size: 30,),
          )
        ],
        backgroundColor:  const Color(0xff0E6B56),
      ),
      body: SafeArea(
          child: ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              String imageUrl = documents[index]["imageUrl"];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PreviewTwo()));
                    },
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showImagePreviewDialog(context, imageUrl);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 33,
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text(
                          documents[index]["name"],
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.2,
                  )
                ],
              );
            },
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
