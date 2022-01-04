import 'package:flutter/cupertino.dart';
import 'package:my_first_app/api_routine_model.dart';
import 'api_model.dart';
import 'api.dart';

class MyState extends ChangeNotifier {
  Future initialize() async {
    await getExerList();
    await getRoutineList();
  }

//Hantera övningar
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

//Hantera rutiner
  List<Routines> _routineList = [];

  List<Routines> get routineList => _routineList;

  Future getRoutineList() async {
    List<Routines> routineList = await Api.getRoutines();
    _routineList = routineList;
    notifyListeners();
  }

  void showSpecRoutine(Routines routines) {
    _routineList = routineList;
    notifyListeners();
  }

  void removeRoutine(Routines routines) async {
    await Api.deleteRoutine(routines.id);
    await getRoutineList();
    notifyListeners();
  }

  void createRoutine(String newRoutineTitle, String addExer) async {
    final List<String> newExerList = [];
    newExerList.add(addExer);

    await Api.createRoutine(title: newRoutineTitle, list: newExerList);
    await getRoutineList();

    notifyListeners();
  }

  void changeRoutine(Routines routine, int index, String choosenExer) async {
    routine.exercises.removeAt(index);
    Routines updatedRoutine = routine;
    await Api.changeRoutine(routine.id, updatedRoutine);
    await getRoutineList();
    notifyListeners();
  }

  void addExerToRoutine(Exer exer, Routines routine) async {
    routine.exercises.add(exer.name);
    Routines updatedRoutine = routine;
    await Api.changeRoutine(routine.id, updatedRoutine);
    await getRoutineList();
  }

//Hantera filtrering
  List<String> _filterList = [];

  List<String> get filterList => _filterList;

  String _filterBy = 'All';

  String get filterBy => _filterBy;

  void getFilterList(_list) {
    List<String> _getFilterList = [];

    for (var i = 0; i < _list.length; i++) {
      _getFilterList.add(_list[i].target);
    }
    _filterList = _getFilterList.toSet().toList();
    notifyListeners();
  }

  void filter(String? filterBy) {
    if (filterBy != null) {
      _filterBy = filterBy;
    }
    notifyListeners();
  }
}
