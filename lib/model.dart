/* import 'list_view.dart';
import 'apiModel.dart';



List<Exercises> _list = [Exercises(bodyPart: 'waist', equipment: equipment, gifUrl: gifUrl, id: id, name: name, target: target)];
List<Exercises> get list => _list; */

import 'package:flutter/cupertino.dart';
import 'package:my_first_app/api_routine_model.dart';
import 'package:my_first_app/routine_view.dart';
import 'exercise_list_view.dart';
import 'main.dart';
import 'apiModel.dart';
import 'Api.dart';

class MyState extends ChangeNotifier {
  List<Exer> _list = [];

  List<Exer> get list => _list;

  Future getList() async {
    List<Exer> list = await Api.getInfo();
    _list = list;
    notifyListeners();
  }

  void showInfo(Exer exer) {
    _list = list;
    notifyListeners();
  }

/*   List<Routines> _routineList = [];

  List<Routines> get routineList => _routineList;

  Future getRoutineList() async {
    List<Routines> routinelist = await Api.getRoutines();
    _routineList = routinelist;
    print(_routineList);
    notifyListeners(); 
    }*/

}
