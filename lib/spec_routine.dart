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
        body: _getExers(context));
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
                Provider.of<MyState>(context, listen: false)
                    .changeRoutine(routine, index, routine.exercises[index]);
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
}
