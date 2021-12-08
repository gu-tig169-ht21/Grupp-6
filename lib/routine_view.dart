import 'package:flutter/material.dart';
import 'package:my_first_app/bottomnav.dart';
import 'package:my_first_app/routine_item.dart';

class RoutineListView extends StatelessWidget {
  final List<RoutineItem> list = [
    RoutineItem(title: 'title', exers: 'exers'),
    RoutineItem(title: 'title2', exers: 'exers2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
          //Använda ReorderableListView för att kunna sortera om listan
          children: list
              .map((routines) => _RoutineListView(context, routines))
              .toList()),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _RoutineListView(context, RoutineItem routineList) => ListTile(
      contentPadding: const EdgeInsets.all(12),
      title: Text(routineList.title),
      subtitle: Text(routineList.exers),
      onTap: () {
        // ...... *tystnad* vänta, *tysnad*, *Osäkert* Där kommer vi också ha en navigator...
      },
      trailing: Icon(Icons.menu, color: Colors.pink[300]));
}
