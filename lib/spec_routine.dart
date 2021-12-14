import 'package:flutter/material.dart';
import 'package:my_first_app/api_routine_model.dart';
import 'package:my_first_app/bottomnavbar.dart';

class SpecRoutine extends StatelessWidget {
  final Routines routines;
  SpecRoutine(this.routines);

  /*  @override
  State<SpecRoutine> createState() => _RoutineListViewState();
}

class _RoutineListViewState extends State<SpecRoutine> {
/*   _updateRoutineExercises(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final RoutineItem updatedItem = list.removeAt(oldIndex);
    list.insert(newIndex, updatedItem);
  } */
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange[300],
          centerTitle: true,
          title: Text(routines.title)),
    );
  }
}



/* ListView(
          //Använda ReorderableListView för att kunna sortera om listan
          children: list
              .map((routines) => _RoutineListView(context, routines))
              .toList()),
      bottomNavigationBar: BottomNavBar(),
    ); */

  /* Widget _RoutineListView(context, RoutineItem routineList) => ListTile(
      contentPadding: const EdgeInsets.all(12),
      title: Text(routineList.title),
      subtitle: Text(routineList.exers),
      onTap: () {
        // ...... *tystnad* vänta, *tysnad*, *Osäkert* Där kommer vi också ha en navigator...
      },
      trailing: Icon(Icons.menu, color: Colors.pink[300]));
}
 */