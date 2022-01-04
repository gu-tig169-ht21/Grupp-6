import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/bottomnavbar.dart';
import 'package:my_first_app/spec_routine.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'api_routine_model.dart';

class MyRoutines extends StatefulWidget {
  const MyRoutines({Key? key}) : super(key: key);

  @override
  State<MyRoutines> createState() => _MyRoutinesState();
}

class _MyRoutinesState extends State<MyRoutines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange[300],
            centerTitle: true,
            title: const Text('My Routines')),
        body: _getRoutines(),
        bottomNavigationBar: const BottomNavBar(currentRoute: MyRoutines));
  }

  Widget _getRoutines() {
    return Consumer<MyState>(
        builder: (context, state, child) =>
            _getRoutineList(context: context, routineList: state.routineList));
  }

  Widget _getRoutineList({context, required List<Routines> routineList}) {
    return routineList.isEmpty
        ? Center(
            child: CircularProgressIndicator(
            color: Colors.pink[300],
          ))
        : ListView(
            children: routineList
                .map<Widget>((routine) =>
                    _buildRoutineList(context: context, routines: routine))
                .toList());
  }

  Widget _buildRoutineList({context, required Routines routines}) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(routines.title),
        onTap: () async {
          var pickedRoutine = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SpecRoutine(Routines(
                      exercises: routines.exercises,
                      id: routines.id,
                      title: routines.title))));
          if (pickedRoutine != null) {
            Provider.of<MyState>(context, listen: false)
                .showSpecRoutine(pickedRoutine);
          }
        },
        trailing: IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.pink[300],
            onPressed: () {
              setState(() {
                Provider.of<MyState>(context, listen: false)
                    .removeRoutine(routines);
              });
            }),
      );
}
