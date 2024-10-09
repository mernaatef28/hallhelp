import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallhelp/local_variables/local_variables.dart';
import 'package:hallhelp/widgets/operationCard.dart';
import 'package:hallhelp/widgets/operationCardIcon.dart';
import 'package:url_launcher/url_launcher.dart';

class OperationScreen extends StatefulWidget {
  const OperationScreen({super.key});

  @override
  State<OperationScreen> createState() => _OperationScreenState();
}

class _OperationScreenState extends State<OperationScreen> {
  late CollectionReference tables;

  @override
  void initState() {
    super.initState();
    tables = FirebaseFirestore.instance.collection('tables');
  }

  Future<void> _launchInAppWebView(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView, // Open within the app in a web view
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri(
      scheme: 'https',
      host: 'nasa-space-apps-leaderboard-lilac.vercel.app',
      path: '/',
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: NasaLightBlue,
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(NasaLightBlue),
            ),
            onPressed: () => _launchInAppWebView(toLaunch),
            child: Icon(
              Icons.sports_score_outlined,
              color: NasaYellow,
            ),
          ),
        ],
      ),
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
                stream: tables.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error fetching data"));
                  }

                  final data = snapshot.data?.docs;

                  if (data == null || data.isEmpty) {
                    return Center(child: Text("No data available"));
                  }

                  return Wrap(
                    spacing: 8.0, // Space between items
                    runSpacing: 8.0, // Space between rows
                    children: data.map((doc) {
                      String need = doc['need'];
                      int number = doc['number'];
                      String documentId = doc.id; // Capture document ID

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
                          },
                          documentId: documentId, // Pass documentId
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
                          },
                          documentId: documentId, // Pass documentId
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
                          },
                          documentId: documentId, // Pass documentId
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
