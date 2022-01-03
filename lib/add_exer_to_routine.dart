import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_first_app/exercise_list_view.dart';
import 'package:my_first_app/spec_routine.dart';
import 'package:provider/provider.dart';

import 'apiModel.dart';
import 'api_routine_model.dart';
import 'bottomnavbar.dart';
import 'main.dart';
import 'model.dart';

class AddExer extends StatefulWidget {
  final Exer exer;
  AddExer(this.exer);

  @override
  State<AddExer> createState() => _AddExerState();
}

class _AddExerState extends State<AddExer> {
  late final TextEditingController _textFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange[300],
          centerTitle: true,
          title: Text('Add ' + widget.exer.name + ' to...')),
      body: _getRoutines(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.pink[300],
          onPressed: () {
            addNewRoutineDialog(context);
          }),
    );
  }

  Widget _buildRoutineList(context, Routines routine) => ListTile(
      contentPadding: const EdgeInsets.all(12),
      title: Text(routine.title),
      onTap: () {
        Provider.of<MyState>(context, listen: false)
            .addExerToRoutine(widget.exer, routine);
        successfullyAddedDialog(context);
        //Navigator.pop(context);
      }

      //Posta övning till rutin.
      );

  Widget _getRoutines() {
    return Consumer<MyState>(
        builder: (context, state, child) =>
            _getRoutineList(context, state.routineList));
  }

  Widget _getRoutineList(context, List<Routines> routineList) {
    return ListView(
        children: routineList
            .map<Widget>((routine) => _buildRoutineList(context, routine))
            .toList());
  }

  addNewRoutineDialog(BuildContext context) {
    Widget okButton = TextButton(
        child: const Text("CREATE"),
        onPressed: () {
          setState(() {
            Navigator.of(context).pop();
            Provider.of<MyState>(context, listen: false)
                .createRoutine(_textFieldController.text, widget.exer.name);
          });
          successfullyAddedDialog(context);
        },
        style: TextButton.styleFrom(primary: Colors.pink[300]));

    AlertDialog alert = AlertDialog(
      title: const Text("Create new routine:"),
      content: TextFormField(
        onChanged: (value) {},
        controller: _textFieldController,
        decoration: const InputDecoration(hintText: "Name your new routine..."),
        validator: (title) {
          if (title == null || title.isEmpty) {
            return 'Textfield is empty, please try again!';
          }
          return null;
        },
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  successfullyAddedDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MyApp()));
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Exercise added successfully!"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
