import 'package:flutter/material.dart';
import 'package:my_first_app/apiModel.dart';
import 'package:my_first_app/api_routine_model.dart';
import 'package:provider/provider.dart';

import 'model.dart';
import 'start_routine.dart';

class SpecRoutine extends StatelessWidget {
  final Routines routine;
  SpecRoutine(this.routine);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange[300],
            centerTitle: true,
            title: Text(routine.title)),
        body: Center(
          child: Column(
            children: [
              _getExers(context),
              _startWorkout(),
            ],
          ),
        ));
  }

  Widget _getExers(context) {
    return ListView.builder(
        itemCount: routine.exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: Text(routine.exercises[index]),
            onTap: () async {
              /* Om man vill kan man länka vidare till showExerInfo */
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.pink[300],
              onPressed: () {
                var updatedRoutine =
                    changeRoutine(routine, index, routine.exercises[index]);
                Provider.of<MyState>(context, listen: false).updateRoutine(
                  routine.id,
                  updatedRoutine,
                );
                //Fixa en legit update
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SpecRoutine(Routines(
                            exercises: routine.exercises,
                            id: routine.id,
                            title: routine.title))));
                if (routine != null) {
                  Provider.of<MyState>(context, listen: false)
                      .showSpecRoutine(routine);
                }
              },
            ),
          );
        });
  }

  changeRoutine(Routines routine, int index, String choosenExer) {
    //Fixa så att övningslistan uppdateras (ta bort den/index man klickar på. Return ny lista och skicka till provider.)
    routine.exercises.removeAt(index);
    Routines updatedRoutine = routine;
    return updatedRoutine;
  }

  Widget _startWorkout() {
    return Container(
      width: 200,
      height: 100,
      padding: EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.pink[300],
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: TextButton(
          onPressed: () async {
            var newStartRoutine = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StartRoutine(Routines(
                      id: routine.id,
                      title: routine.title,
                      exercises: routine.exercises)),
                ));
          },
          child: Text("Start Workout"),
          style: TextButton.styleFrom(
              primary: Colors.white, backgroundColor: Colors.indigo)),
    );
  }
}
