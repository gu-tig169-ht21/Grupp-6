import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/Api.dart';
import 'package:my_first_app/bottomnavbar.dart';
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
        trailing: IconButton(
            icon: const Icon(Icons.add_circle),
            color: Colors.pink[300],
            onPressed: () {}),
      );

/* Widget _buildRoutineList2(context, List<Routines>? routine) => ListTile(
      contentPadding: const EdgeInsets.all(12),
      title: Text('Hela listan'),
      trailing: IconButton(
          icon: const Icon(Icons.add_circle),
          color: Colors.pink[300],
          onPressed: () {}),
    ); */

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


 /*  ListView(
            children: routineList
                .map((routine) => _buildRoutineList(context, routine))
                .toList()), */

 


  /* ListView _routineListView(routine) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: Text(routine.title),
            trailing: IconButton(
                icon: const Icon(Icons.add_circle),
                color: Colors.pink[300],
                onPressed: () {}),
          );
          ;
        }); */

/* 
return FutureBuilder<List<Job>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasroutine) {
          List<Job> routine = snapshot.routine;
          return _jobsListView(routine);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      } */

/* 
  _futureBuilder() {
    return FutureBuilder(
        future: _getAllRoutines(),
        builder: (context, snapshot) {
          if (snapshot.hasroutine) {
            return _routinelistView(routineList: snapshot.routine);
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




/* 

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
      ); */