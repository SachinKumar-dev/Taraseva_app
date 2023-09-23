import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PanditShowDetails extends StatefulWidget {
  const PanditShowDetails({Key? key}) : super(key: key);

  @override
  State<PanditShowDetails> createState() => _PanditShowDetailsState();
}

class _PanditShowDetailsState extends State<PanditShowDetails> {
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
      body: SingleChildScrollView(
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
                      Navigator.pop(context);
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
              const SizedBox(
                height: 30,
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
    );
  }
}
