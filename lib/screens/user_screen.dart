import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hallhelp/firebase_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hallhelp/local_variables/local_variables.dart';
import 'package:hallhelp/local_variables/tabledata.dart';
import 'package:hallhelp/widgets/btn.dart';
import 'package:hallhelp/widgets/btnicon.dart';
import 'package:hallhelp/widgets/textFormFeild_Widget.dart';
import 'package:url_launcher/url_launcher.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late TextEditingController _controller;
  String _selectedOption = 'Option 1';
  late CollectionReference tables;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
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
        backgroundColor: NasaBlue,
        actions: [
          ElevatedButton(
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(NasaBlue) ),
            onPressed: () => _launchInAppWebView(toLaunch),
            // Launch the URL
            child:  Icon(Icons.sports_score_outlined , color: NasaYellow ,),
          ),
        ],
      ),
      body: Container(
        color: NasaBlue,
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/nasalogo.png",
                  width: 300,
                  height: 300,
                ),
                TextformfeildWidget(
                  controller: _controller,
                  fieldName: "table number",
                ),
                btnCal(
                  text: "Organizer",
                  event: () {
                    setState(() {
                      _selectedOption = "Organizer";
                    });
                  },
                  c: _selectedOption == "Organizer" ? Colors.white : NasaYellow,
                  textColor: _selectedOption == "Organizer" ? NasaYellow : NasaNavy,
                ),
                btnCal(
                  text: "Mentor",
                  event: () {
                    setState(() {
                      _selectedOption = "mentor";
                    });
                  },
                  c: _selectedOption == "mentor" ? Colors.white : NasaNavy,
                  textColor: _selectedOption == "mentor" ? NasaNavy : NasaYellow,
                ),
                btnCalIcon(
                  event: () {
                    setState(() {
                      _selectedOption = "WCorOUT";
                    });
                  },
                  c: _selectedOption == "WCorOUT" ? Colors.white : NasaRed,
                  icons: Center(
                    child: Row(
                      children: [
                        SizedBox(width: 60),
                        Icon(
                          Icons.girl_sharp,
                          size: 45,
                          color: _selectedOption == "WCorOUT" ? NasaRed : Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "|",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: _selectedOption == "WCorOUT" ? NasaRed : Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.boy_sharp,
                          size: 45,
                          color: _selectedOption == "WCorOUT" ? NasaRed : Colors.white,
                        ),
                        SizedBox(width: 30),
                        Icon(
                          Icons.directions_run,
                          size: 45,
                          color: _selectedOption == "WCorOUT" ? NasaRed : Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        title: "Sent",
                        desc: "Your request has been sent successfully.",
                      ).show();

                      setState(() {
                        tables.add({
                          'need': _selectedOption,
                          'number': int.parse(_controller.text),
                        }).then((value) => print("Order Added"))
                            .catchError((error) => print("Failed to add user: $error"));
                        _selectedOption = "OPTION 1";
                        _controller.clear();
                      });
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Text(
                        "GO",
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }
}
