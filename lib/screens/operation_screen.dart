import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallhelp/local_variables/local_variables.dart';
import 'package:hallhelp/widgets/operationCard.dart';
import 'package:hallhelp/widgets/operationCardIcon.dart';

class OperationScreen extends StatefulWidget {
  const OperationScreen({super.key});

  @override
  State<OperationScreen> createState() => _OperationScreenState();
}

class _OperationScreenState extends State<OperationScreen> {
  // Reference to the Firestore collection
  CollectionReference tables = FirebaseFirestore.instance.collection('tables');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: NasaLightBlue,
        child: ListView(
          children: [
            Image.asset(
              "assets/nasalogo.png",
              width: 200,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<QuerySnapshot>(
                // Listening to real-time updates from the Firestore 'tables' collection
                stream: tables.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error fetching data"));
                  }

                  // Getting the documents (data) from Firestore
                  final data = snapshot.data?.docs;

                  if (data == null || data.isEmpty) {
                    return Center(child: Text("No data available"));
                  }

                  // Using Wrap to display items
                  return Wrap(
                    spacing: 8.0, // Space between items
                    runSpacing: 8.0, // Space between rows
                    children: data.map((doc) {
                      // Accessing fields from the document
                      String need = doc['need'];
                      int number = doc['number'];
                      String documentId = doc.id; // Capture document ID for deletion

                      // Conditional rendering based on 'need' field
                      if (need == "Organizer") {
                        return operationCard(
                          number: number,
                          text: "Organizer",
                          color: NasaYellow,
                          textColor: NasaNavy,
                          event: (documentId) async {
                            await tables.doc(documentId).delete().then((_) {
                              print("Request deleted");
                            }).catchError((error) {
                              print("Failed to delete request: $error");
                            });
                          }, documentId: documentId,
                        );
                      } else if (need == "mentor") {
                        return operationCard(
                          number: number,
                          text: "Mentor",
                          color: NasaNavy,
                          textColor: NasaYellow,
                          event: (documentId) async {
                            await tables.doc(documentId).delete().then((_) {
                              print("Request deleted");
                            }).catchError((error) {
                              print("Failed to delete request: $error");
                            });
                          }, documentId: documentId,
                        );
                      } else {
                        return operationCardIcon(
                          number: number,
                          event: (documentId) async {
                            await tables.doc(documentId).delete().then((_) {

                              print("Request deleted");

                            }).catchError((error) {
                              print("Failed to delete request: $error");
                            });
                          }, documentId: documentId,
                        );
                      }
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
