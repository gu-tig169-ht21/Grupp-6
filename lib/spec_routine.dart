import 'package:flutter/material.dart';
import 'package:my_first_app/api_routine_model.dart';
import 'package:my_first_app/bottomnavbar.dart';

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
        body: _getExers(routines.exercises));
  }

  Widget _getExers(List<String> exer) {
    return ListView(
        children: exer.map((exer) => _buildExerList(exer)).toList());
  }

  Widget _buildExerList(exer) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(exer),
        onTap: () async {
          /* Om man vill kan man länka vidare till showExerInfo */
        },
        trailing: IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.pink[300],
            onPressed: () {}),
      );
}
