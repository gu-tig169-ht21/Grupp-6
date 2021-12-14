import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'apiModel.dart';
import 'api_routine_model.dart';
import 'bottomnavbar.dart';
import 'model.dart';

class AddExer extends StatelessWidget {
  final Exer exer;
  AddExer(this.exer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange[300],
            centerTitle: true,
            title: const Text('Add to...')),
        body: _getRoutines(),
        bottomNavigationBar: const BottomNavBar());
  }

  Widget _buildRoutineList(context, Routines routines) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(routines.title),
        onTap: () {},
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
}
