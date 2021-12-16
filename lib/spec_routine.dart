import 'package:flutter/material.dart';
import 'package:my_first_app/api_routine_model.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class SpecRoutine extends StatelessWidget {
  final Routines routines;
  SpecRoutine(this.routines);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange[300],
            centerTitle: true,
            title: Text(routines.title)),
        body: _getExers(context));
  }

  Widget _getExers(context) {
    return ListView.builder(
        itemCount: routines.exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: Text(routines.exercises[index]),
            onTap: () async {
              /* Om man vill kan man länka vidare till showExerInfo */
            },
            trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.pink[300],
                onPressed: () {
                  var updatedRoutine =
                      changeRoutine(routines, index, routines.exercises[index]);
                  Provider.of<MyState>(context, listen: false).updateRoutine(
                    routines.id,
                    updatedRoutine,
                  );
                }),
          );
        });
  }

  changeRoutine(Routines routine, int index, String choosenExer) {
    //Fixa så att övningslistan uppdateras (ta bort den/index man klickar på. Return ny lista och skicka till provider.)
    routine.exercises.removeAt(index);
    Routines updatedRoutine = routine;
    print(updatedRoutine.exercises);
    return updatedRoutine;
  }
}
