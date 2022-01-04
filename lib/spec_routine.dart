import 'package:flutter/material.dart';
import 'package:my_first_app/api_routine_model.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class SpecRoutine extends StatefulWidget {
  final Routines routine;
  const SpecRoutine(this.routine, {Key? key}) : super(key: key);

  @override
  State<SpecRoutine> createState() => _SpecRoutineState();
}

class _SpecRoutineState extends State<SpecRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange[300],
            centerTitle: true,
            title: Text(widget.routine.title)),
        body: _getExers(context));
  }

  Widget _getExers(context) {
    return ListView.builder(
        itemCount: widget.routine.exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: Text(widget.routine.exercises[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.pink[300],
              onPressed: () {
                setState(() {
                  Provider.of<MyState>(context, listen: false).changeRoutine(
                      widget.routine, index, widget.routine.exercises[index]);
                });
              },
            ),
          );
        });
  }
}
