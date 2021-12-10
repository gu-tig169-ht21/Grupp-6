import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/Api.dart';
import 'package:my_first_app/bottomnavbar.dart';
import 'model.dart';
import 'api_routine_model.dart';

//Väntar med att göra denna vyn tills vi gjort overlay

class MyRoutines extends StatelessWidget {
  List<Routines> routineList;

  MyRoutines(this.routineList);

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

/* 
  _futureBuilder() {
    return FutureBuilder(
        future: _getAllRoutines(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _routinelistView(routineList: snapshot.data);
          }
          return Container(child: const Text("Couldn't find any routines."));
        });
  }

  _getAllRoutines() async {
    List<Routines> routineList = await Api.getRoutines();
    routineList.forEach((Routines routine) {
      routine.title;
      routine.exercises;
    });
  }

  _routinelistView({required routineList}) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: routineList.isEmpty ? 1 : routineList.length,
      itemBuilder: (context, index) {
        if (routineList.isEmpty) {
          return Container(child: const Text("Couldn't find any routines."));
        }
        return MyRoutines(routineList);
      },
    );
  }
}
 */