import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/Api.dart';
import 'package:my_first_app/bottomnavbar.dart';
import 'package:my_first_app/routine_view.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'api_routine_model.dart';

//Väntar med att göra denna vyn tills vi gjort overlay

class MyRoutines extends StatelessWidget {
  /* List<Routines> routineList;

  MyRoutines(this.routineList); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange[300],
            centerTitle: true,
            title: const Text('My Routines')),
        body: _getRoutines(),
        bottomNavigationBar: const BottomNavBar());
  }

  Widget _buildRoutineList(context, Routines routines) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(routines.title),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RoutineListView()));
        },
        trailing: IconButton(
            icon: const Icon(Icons.add_circle),
            color: Colors.pink[300],
            onPressed: () {}),
      );

  Widget _getRoutines() {
    return Consumer<MyState>(
        builder: (context, state, child) =>
            _getRoutineList(context, state.routineList));
  }

  Widget _getRoutineList(context, List<Routines> routineList) {
    return ListView(
        children: routineList
            .map<Widget>((routine) => _buildRoutineList(context, routine))
            .toList());
  }
}
