
import 'package:flutter/material.dart';

Widget btnCalIcon ({
  required Widget icons ,
  required Function() event ,
  Color c = Colors.grey ,
  Color textColor = Colors.white ,
})
=> Padding(
  padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
  child: Container(
    width: double.infinity,
    child: MaterialButton(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20) ,
        ),
        onPressed: event ,
        color: c ,
        child: Padding(
            padding: const EdgeInsets.only(left: 10 , right: 10 , top: 5 , bottom: 5 ),
            child: icons
        )
    ),
  ),
);