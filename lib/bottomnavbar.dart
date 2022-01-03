import 'package:flutter/material.dart';
import 'package:my_first_app/spec_routine.dart';
import 'my_routines.dart';
import 'api_routine_model.dart';
import 'model.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class BottomNavBar extends StatefulWidget {
  final dynamic currentRoute;

  const BottomNavBar({
    Key? key,
    required this.currentRoute,
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
        type: BottomNavigationBarType.fixed,
        selectedItemColor:
            widget.currentRoute == MyApp ? Colors.white : Colors.brown,
        unselectedItemColor:
            widget.currentRoute != MyApp ? Colors.white : Colors.brown,
        items: <BottomNavigationBarItem>[
          _exercisesItem(),
          _routinesItem(),
        ],
        currentIndex: _selectedIndex,

        //Fixa så färgen byts
        onTap: (int index) {
          if (mounted) {
            setState(() {
              _selectedIndex = index;
              switch (_selectedIndex) {
                case 0:
                  _navigateToExercises(context);
                  break;
                case 1:
                  _navigateToRoutine(context);
                  break;
              }
            });
          }
        });
  }

  _exercisesItem() {
    return BottomNavigationBarItem(
      icon: widget.currentRoute == MyApp
          ? const Icon(Icons.list, color: Colors.white)
          : const Icon(Icons.list, color: Colors.brown),
      label: 'Exercises',
    );
  }

  _routinesItem() {
    return BottomNavigationBarItem(
      icon: widget.currentRoute == MyRoutines
          ? const Icon(Icons.fitness_center_rounded, color: Colors.white)
          : const Icon(Icons.fitness_center_rounded, color: Colors.brown),
      label: 'My Routine',
    );
  }

  _navigateToRoutine(context) {
    ///Check if we can pop.
    if (Navigator.canPop(context)) {
      ///First we pop so we cant go back to the same route.
      Navigator.pop(context);
    }

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyRoutines()));
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
