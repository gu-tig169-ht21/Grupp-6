

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Väntar med att göra denna vyn tills vi gjort overlay

class MyRoutines extends StatelessWidget {

  MyRoutines({
    required this.title,
  });

  String title;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        backgroundColor: Colors.deepOrange[300],
        title: Text('My Routines')),
        body: Column (
          //_myRoutineList();

        )

        
        );
    
  }

  Widget _myRoutineList (context ) => ListTile (
    
    title: Text(''),

  );

  
}