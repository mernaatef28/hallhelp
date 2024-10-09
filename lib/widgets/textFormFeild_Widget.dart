import 'package:flutter/material.dart';

class TextformfeildWidget extends StatelessWidget {
  final TextEditingController controller;
  final String fieldName;

  TextformfeildWidget({
    required this.controller,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 124, 124, 124), width: 2.0),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2.0),
            borderRadius: BorderRadius.circular(5),
          ),
          labelText: fieldName,
          labelStyle: TextStyle(color: Color(0xffEAFE07) ,fontWeight: FontWeight.w900),
        ),
        style: TextStyle(
          color: Colors.blueAccent, // Text color
          fontSize: 18.0,      // Font size
          fontWeight: FontWeight.bold, // Font weight
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your table number';
          }
          if (!RegExp(r'^\d+$').hasMatch(value)) {
            return 'Please enter a valid table number';
          }
          return null;
        },
      ),
    );
  }
}
