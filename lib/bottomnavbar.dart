import 'package:flutter/material.dart';
import 'package:my_first_app/routine_view.dart';

import 'main.dart';

class BottomNavBar extends StatefulWidget {
  final currentRoute;

  const BottomNavBar({
    Key? key,
    this.currentRoute,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return BottomNavigationBar(
        backgroundColor: Colors.deepOrange[300],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_rounded),
            label: 'My Routine',
          ),
        ],
        currentIndex: _selectedIndex,
        //Fixa så färgen byts
        selectedItemColor: Colors.white,
        onTap: (int index) {
          if (mounted) {
            setState(() {
              _selectedIndex = index;
              switch (_selectedIndex) {
                case 0:
                  _navigateToExercises(context);
                  print(_selectedIndex);
                  break;
                case 1:
                  _navigateToRoutine(context);
                  print(_selectedIndex);
                  break;
              }
            });
          }
        });
  }

  _navigateToRoutine(context) {
    ///Check if we can pop.
    if (Navigator.canPop(context)) {
      ///First we pop so we cant go back to the same route.
      Navigator.pop(context);
    }

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RoutineListView()));
  }

  _navigateToExercises(context) {
    ///Check if we can pop.
    if (Navigator.canPop(context)) {
      ///First we pop so we cant go back to the same route.
      Navigator.pop(context);
    }

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyApp()));
  }
}