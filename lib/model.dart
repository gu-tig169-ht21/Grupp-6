import 'package:flutter/cupertino.dart';
import 'package:my_first_app/API/api_routine_model.dart';
import 'API/api_model.dart';
import 'API/api.dart';

class MyState extends ChangeNotifier {
  Future initialize() async {
    await getExerList();
    await getRoutineList();
  }

//Hantera övningar
  List<Exer> _exerList = [];

  List<Exer> get exerList => _exerList;

  Future getExerList() async {
    List<Exer> exerList = await Api.getInfo();
    _exerList = exerList;
    getFilterList(_exerList);
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

//Plockar 'targets' från exerList till en egen lista
  void getFilterList(_exerList) {
    List<String> _getFilterList = [];

    for (var i = 0; i < _exerList.length; i++) {
      _getFilterList.add(_exerList[i].target);
    }
    _filterList = _getFilterList.toSet().toList();
    notifyListeners();
  }

  //Ändrar filtreringsvärdet
  void filter(String? filterBy) {
    if (filterBy != null) {
      _filterBy = filterBy;
    }
    notifyListeners();
  }
}
