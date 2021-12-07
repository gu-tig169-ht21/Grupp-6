import 'dart:html';
import 'apiModel.dart';
import 'main.dart';

import 'package:flutter/material.dart';

class ExerciseListView extends StatelessWidget {
  List<Exercises> list;

  ExerciseListView(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list
            .map((exercises) => _buildExerciseList(context, exercises))
            .toList());
  }

  Widget _buildExerciseList(context, Exercises exercises) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(exercises.name),
        onTap: () {
          // ...... *tystnad* vänta, *tysnad*, *Osäkert* Där kommer vi också ha en navigator...
        },
        trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Här kommmer vi behöva ha en navigator och eeeeennnn, bara en navigator.
            }),
      );
}
