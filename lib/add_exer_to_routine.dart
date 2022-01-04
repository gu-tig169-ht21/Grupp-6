import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'api_model.dart';
import 'api_routine_model.dart';
import 'main.dart';
import 'model.dart';

class AddExer extends StatefulWidget {
  final Exer exer;
  const AddExer(this.exer, {Key? key}) : super(key: key);

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
        body: Center(
            child: Column(children: [
          Expanded(
            flex: 3,
            child: SizedBox(child: _getRoutines()),
          ),
          Expanded(
            child: SizedBox(height: 100, child: _addRoutine(context)),
          )
        ])));
  }

  Widget _buildRoutineList(context, Routines routine) => ListTile(
      contentPadding: const EdgeInsets.all(12),
      title: Text(routine.title),
      onTap: () {
        Provider.of<MyState>(context, listen: false)
            .addExerToRoutine(widget.exer, routine);
        successfullyAddedDialog(context);
      });

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
    Widget okButton = TextButton(
      child: const Text("OK"),
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

  Widget _addRoutine(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            child: const Text('New Routine +'),
            style: ElevatedButton.styleFrom(
              primary: Colors.pink[300],
              onPrimary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            onPressed: () async {
              addNewRoutineDialog(context);
            }),
      ],
    );
  }
}
