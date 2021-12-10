import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/Api.dart';
import 'package:my_first_app/bottomnavbar.dart';
import 'package:my_first_app/routine_view.dart';
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

  Widget _buildRoutineList(context, Routines routine) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(routine.title),
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
    return FutureBuilder<List<Routines>>(
        future: Api.getRoutines(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Routines>? routineList = snapshot.data;

            if (routineList != null) {
              return ListView(
                  children: routineList
                      .map((routine) => _buildRoutineList(context, routine))
                      .toList());
            }
            // _buildRoutineList(context, routine);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}
