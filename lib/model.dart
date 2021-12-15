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

  void updateRoutine(int routinesId, String title, List<String> exers) async {
    await Api.changeRoutine(routinesId, title, exers);
    await getRoutineList();
  }

  List<Routines> _routineList = [];

  List<Routines> get routineList => _routineList;

  Future getRoutineList() async {
    List<Routines> routineList = await Api.getRoutines();
    _routineList = routineList;
    notifyListeners();
  }

  Future initialize() async {
    await getExerList();
    await getRoutineList();
  }
}
