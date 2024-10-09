import 'package:firebase_core/firebase_core.dart';
import 'package:hallhelp/screens/operation_screen.dart';
import 'package:hallhelp/screens/score_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:hallhelp/screens/user_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserScreen()
      //OperationScreen(),
    //ScoreScreen() ,

  ));

}


