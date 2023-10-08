import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/ChattingScreens/InsideChatPagePreview.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/UserShowDetails.dart';
import 'package:gitson/Models/Pandits.dart';
import 'package:gitson/Services/ServicesOpt.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ImagePreview.dart';

class UserChat extends StatefulWidget {
  const UserChat({super.key});

  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  //dialog box
  void showImagePreviewDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: 300, // Set the desired fixed width
            height: 350, // Adjust the height as needed
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Close the dialog when the enlarged image is tapped.
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Preview()));
                            },
                            child: const Icon(Icons.chat_sharp,color: Colors.white,)),
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageGridPage()));
                            },
                            child: const Icon(Icons.info_outline_rounded,color: Colors.white,)),
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

  List<DocumentSnapshot> documents = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Pandit Details')
          .orderBy('createdAt', descending: false)
          .get();

      setState(() {
        documents = querySnapshot.docs;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  List list = Pandits.listpandits;
  int tappedContainerIndex = -1;

  //handling taps of navBar
  int selectedIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Available Pandits",
          style: GoogleFonts.inter(fontSize: 20.sp),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
        backgroundColor: const Color(0xff0E6B56),
      ),
      body: WillPopScope(
        onWillPop: (){
          context.go("/userMainScreen");
          return Future.value(false);
        },
        child: SafeArea(
          child: ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              String imageUrl = documents[index]["imageUrlP"];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Preview()),
                      );
                    },
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Show the image preview dialog when the CircleAvatar is tapped.
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
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              documents[index]["name"],
                              style: GoogleFonts.inter(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            Text(
                              "Experience:-" + list[index].experiences,
                              style: GoogleFonts.signikaNegative(fontSize: 16.sp),
                            ),
                          ],
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
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Color(0xff0E6B56),
              ),
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
