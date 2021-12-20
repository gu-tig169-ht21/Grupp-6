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
              Expanded(
                flex: 2,
                child: SizedBox(child: _getExers(context)),
              ),
              Expanded(
                child: SizedBox(height: 100, child: _startWorkout(context)),
              )
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

  Widget _startWorkout(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            child: Text('Start workout'),
            style: ElevatedButton.styleFrom(
              primary: Colors.pink[300],
              onPrimary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            onPressed: () async {
              var newStartRoutine = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StartRoutine(
                      Routines(
                          id: routine.id,
                          title: routine.title,
                          exercises: routine.exercises
                          ))));
            }),
      ],
    );
  }
}
