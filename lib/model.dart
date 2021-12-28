import 'package:flutter/cupertino.dart';
import 'package:my_first_app/api_routine_model.dart';
import 'package:my_first_app/spec_routine.dart';
import 'exercise_list_view.dart';
import 'main.dart';
import 'apiModel.dart';
import 'Api.dart';

class MyState extends ChangeNotifier {
  List<Exer> _list = [];

  List<Exer> get list => _list;

  Future getExerList() async {
    List<Exer> list = await Api.getInfo();
    _list = list;
    getFilterList(_list);
    notifyListeners();
  }

  void showExerInfo(Exer exer) {
    _list = list;
    notifyListeners();
  }

  void showSpecRoutine(Routines routines) {
    _routineList = routineList;
    notifyListeners();
  }

  void removeRoutine(Routines routines) async {
    await Api.deleteRoutine(routines.id);
    await getRoutineList();
  }

  void createRoutine(String newRoutineTitle, String addExer) async {
    final List<String> newExerList = [];
    newExerList.add(addExer);

    await Api.createRoutine(title: newRoutineTitle, list: newExerList);
  }

  List<Routines> _routineList = [];

  List<Routines> get routineList => _routineList;

  Future getRoutineList() async {
    List<Routines> routineList = await Api.getRoutines();
    _routineList = routineList;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
  }

  Future initialize() async {
    await getExerList();
    await getRoutineList();
  }

  void changeRoutine(Routines routine, int index, String choosenExer) async {
    //Fixa så att övningslistan uppdateras (ta bort den/index man klickar på. Return ny lista och skicka till provider.)
    routine.exercises.removeAt(index);
    Routines updatedRoutine = routine;
    await Api.changeRoutine(routine.id, updatedRoutine);
    await getRoutineList();
  }

  void addExerToRoutine(Exer exer, Routines routine) async {
    routine.exercises.add(exer.name);
    Routines updatedRoutine = routine;
    await Api.changeRoutine(routine.id, updatedRoutine);
    await getRoutineList();
  }

  void getFilterList(_list) {
    List<String> _getFilterList = [];

    for (var i = 0; i < _list.length; i++) {
      _getFilterList.add(_list[i].target);
    }
    List<String> _filterList = _getFilterList.toSet().toList();
    print(_filterList);
  }
}
