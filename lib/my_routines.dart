import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/bottomnavbar.dart';
import 'model.dart';
import 'api_routine_model.dart';

//Väntar med att göra denna vyn tills vi gjort overlay

class MyRoutines extends StatelessWidget {
  List<Routines> routineList;

  MyRoutines({required this.routineList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange[300],
            centerTitle: true,
            title: const Text('My Routines')),
        body: ListView(
            children: routineList
                .map((routine) => _buildRoutineList(context, routine))
                .toList()),
        bottomNavigationBar: const BottomNavBar());
  }

  Widget _buildRoutineList(context, Routines routine) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(routine.title),
        trailing: IconButton(
            icon: const Icon(Icons.add_circle),
            color: Colors.pink[300],
            onPressed: () {}),
      );
}



//bottomNavigationBar: BottomNavBar())