import 'package:my_first_app/add_exer_to_routine.dart';
import 'package:my_first_app/my_routines.dart';

import 'apiModel.dart';
import 'exercise_info.dart';
import 'main.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class ExerciseListView extends StatelessWidget {
  List<Exer> list;

  ExerciseListView(this.list);

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Center(
            child: CircularProgressIndicator(
            color: Colors.pink[300],
          ))
        : ListView(
            children:
                list.map((exer) => _buildExerciseList(context, exer)).toList());
  }

  Widget _buildExerciseList(context, Exer exer) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(exer.name),
        subtitle: Text(exer.target),
        onTap: () async {
          var newInfo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExerInfo(
                        Exer(
                            bodyPart: exer.bodyPart,
                            equipment: exer.equipment,
                            gifUrl: exer.gifUrl,
                            id: exer.id,
                            name: exer.name,
                            target: exer.target),
                      )));
          if (newInfo != null) {
            Provider.of<MyState>(context, listen: false).showExerInfo(newInfo);
          }
        },
        trailing: IconButton(
            icon: const Icon(Icons.add_circle),
            color: Colors.pink[300],
            onPressed: () async {
              var pickedExer = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddExer(
                            Exer(
                                bodyPart: exer.bodyPart,
                                equipment: exer.equipment,
                                gifUrl: exer.gifUrl,
                                id: exer.id,
                                name: exer.name,
                                target: exer.target),
                          )));
              if (pickedExer != null) {
                Provider.of<MyState>(context, listen: false)
                    .showExerInfo(pickedExer);
              }
            }),
      );
}
