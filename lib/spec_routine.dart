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
        body: _getExers(context, routines.exercises));
  }

  Widget _getExers(context, List<String> exer) {
    return ListView(
        children: exer.map((exer) => _buildExerList(context, exer)).toList());
  }

  Widget _buildExerList(context, exer) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(exer),
        onTap: () async {
          /* Om man vill kan man länka vidare till showExerInfo */
        },
        trailing: IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.pink[300],
            onPressed: () {
              print(routines.id);
              print(routines.title);
              print(routines.exercises);
              /*  Provider.of<MyState>(context, listen: false).updateRoutine(
                  routines.id, routines.title, routines.exercises); */
            }),
      );
}
