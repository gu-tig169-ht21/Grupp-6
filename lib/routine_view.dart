import 'package:flutter/material.dart';
import 'package:my_first_app/bottomnavbar.dart';

class RoutineItem {
  final String title;
  final String exers;

  RoutineItem({required this.title, required this.exers});
}

class RoutineListView extends StatefulWidget {
  @override
  State<RoutineListView> createState() => _RoutineListViewState();
}

class _RoutineListViewState extends State<RoutineListView> {
  final List<RoutineItem> list = [
    RoutineItem(title: 'Back and abs', exers: 'Crunches'),
    RoutineItem(title: 'Leg Day', exers: 'Squats'),
    RoutineItem(title: 'Bla', exers: 'Blabla')
  ];

  _updateRoutineExercises(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final RoutineItem updatedItem = list.removeAt(oldIndex);
    list.insert(newIndex, updatedItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange[300],
          centerTitle: true,
          title: const Text('Routine')),
      body: ReorderableListView(
        buildDefaultDragHandles: true,
        children: List.generate(list.length, (index) {
          return ListTile(
            key: ValueKey("$index"),
            title: Text(list[index].exers),
          );
        }),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            _updateRoutineExercises(oldIndex, newIndex);
          });
        },
      ),
    );
  }

/* ListView(
          //Använda ReorderableListView för att kunna sortera om listan
          children: list
              .map((routines) => _RoutineListView(context, routines))
              .toList()),
      bottomNavigationBar: BottomNavBar(),
    ); */

  Widget _RoutineListView(context, RoutineItem routineList) => ListTile(
      contentPadding: const EdgeInsets.all(12),
      title: Text(routineList.title),
      subtitle: Text(routineList.exers),
      onTap: () {
        // ...... *tystnad* vänta, *tysnad*, *Osäkert* Där kommer vi också ha en navigator...
      },
      trailing: Icon(Icons.menu, color: Colors.pink[300]));
}
