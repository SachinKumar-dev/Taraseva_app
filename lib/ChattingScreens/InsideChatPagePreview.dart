import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ChatPages/Payment.dart';

class MessageWidget extends StatelessWidget {
  final String message;

  const MessageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: const BoxDecoration(
        color: Color(0xff0E6B56),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          topLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: Text(
        message,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

class Preview extends StatefulWidget {
  Preview({Key? key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
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

  final TextEditingController _textController = TextEditingController();

  final CollectionReference _chats =
      FirebaseFirestore.instance.collection("Pandit's Chat");

  void _handleMessageSend(String message) {
    if (message.isNotEmpty) {
      _chats.add({
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0E6B56),
        leading: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              String imageUrl = documents[index]["imageUrlP"];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              );
            }),
        actions: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 60.0, top: 15),
                    child: Text(
                      documents[index]["name"],
                    ),
                  );
                }),
          ),
          const Icon(Icons.video_call_rounded),
          SizedBox(
            width: 30.w,
          ),
          const Icon(Icons.call),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    dialog(context);
                  },
                  icon: const Icon(Icons.currency_rupee_rounded))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream:
                      _chats.orderBy('timestamp', descending: true).snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "Error: ${snapshot.error}",
                          style: GoogleFonts.inter(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text(
                          "No messages yet!",
                          style: GoogleFonts.inter(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                    final messages = snapshot.data!.docs;
                    return SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: messages.reversed
                            .map((QueryDocumentSnapshot messageDoc) {
                          final message = messageDoc['message'];
                          return MessageWidget(message);
                        }).toList(),
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  // Attachment button
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: () {
                      // Handle attachment button tap here
                    },
                  ),
                  // Text input field
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      onChanged: (text) {
                        // Handle text input here
                      },
                      decoration: InputDecoration(
                        focusColor: const Color(0xff0E6B56),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'Type a message',
                      ),
                    ),
                  ),
                  // Send button
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      // Handle send button tap here
                      _handleMessageSend(_textController.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Payment Details',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Tap open to show details.',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff0E6B56))),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Payments()));
                      },
                      child: const Text('Open'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff0E6B56))),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
