import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../local_variables/local_variables.dart';

Widget operationCardIcon
    (
    {
      required int number,
      required Function event ,
      required String documentId
    })
=> Container(
    width: 171 ,
    height: 151,
    decoration: BoxDecoration( color:Colors.white70 ,borderRadius: BorderRadius.circular(25)),
    child: Column(
      children: [
        ListTile(
          title: CircleAvatar(
            child: Text(number.toString() , style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.green,
          ),
          trailing: Container(
            width: 35,
            height: 35,
            child: MaterialButton(
              onPressed: () => event(documentId), // Pass the document ID to the delete function
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: NasaRed,
              padding: EdgeInsets.all(0), // Remove default padding
              child: Center(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 20, // Adjust the size as needed
                ),
              ),
            ),
          ),

        ),
        Container(
          width: 135 ,
          height: 68,
          decoration: BoxDecoration( color:NasaRed ,borderRadius: BorderRadius.circular(20)),
          child:Center(child: Row(
            children: [
              SizedBox(width: 10,) ,
              Icon(Icons.girl_sharp , size: 30, color:   Colors.white,),
              SizedBox(width: 2,) ,
              Text("|", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30 , color:  Colors.white),) ,
              SizedBox(width: 2,) ,
              Icon(Icons.boy_sharp , size: 30 ,color:Colors.white,),
              SizedBox(width: 10,) ,
              Icon(Icons.directions_run , size: 30 ,color:Colors.white,),
            ],
          ),)
          ,
        )

      ]
      ,
    )
);