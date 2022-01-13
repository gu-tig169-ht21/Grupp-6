import 'package:flutter/material.dart';
import 'package:my_first_app/Exercises/my_home_page.dart';
import './Routines/my_routines.dart';

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
        //Ändrar textfärg beroende på om man är på MyHomePage eller inte
        selectedItemColor:
            widget.currentRoute == MyHomePage ? Colors.white : Colors.brown,
        unselectedItemColor:
            widget.currentRoute != MyHomePage ? Colors.white : Colors.brown,
        items: <BottomNavigationBarItem>[
          _exercisesItem(),
          _routinesItem(),
        ],
        currentIndex: _selectedIndex,
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

  //Skapar bottomnavbaritem för exercises
  _exercisesItem() {
    return BottomNavigationBarItem(
      icon: widget.currentRoute == MyHomePage
          ? const Icon(Icons.list, color: Colors.white)
          : const Icon(Icons.list, color: Colors.brown),
      label: 'Exercises',
    );
  }

  //Skapar routines för exercises
  _routinesItem() {
    return BottomNavigationBarItem(
      icon: widget.currentRoute == MyRoutines
          ? const Icon(Icons.fitness_center_rounded, color: Colors.white)
          : const Icon(Icons.fitness_center_rounded, color: Colors.brown),
      label: 'My Routines',
    );
  }

  _navigateToRoutine(context) {
    //Kollar om vi kan popa.
    if (Navigator.canPop(context)) {
      ///Om vi kan popar vi tillbaka vy
      Navigator.pop(context);
    }

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyRoutines()));
  }

  _navigateToExercises(context) {
    //Kollar om vi kan popa.
    if (Navigator.canPop(context)) {
      ///Om vi kan popar vi tillbaka vy
      Navigator.pop(context);
    }

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }
}
