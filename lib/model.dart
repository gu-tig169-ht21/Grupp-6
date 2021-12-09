/* import 'list_view.dart';
import 'apiModel.dart';



List<Exercises> _list = [Exercises(bodyPart: 'waist', equipment: equipment, gifUrl: gifUrl, id: id, name: name, target: target)];
List<Exercises> get list => _list; */

import 'package:flutter/cupertino.dart';
import 'package:my_first_app/my_routines.dart';
import 'list_view.dart';
import 'main.dart';
import 'apiModel.dart';
import 'Api.dart';

class MyState extends ChangeNotifier {
   List<Exer> _list = [
     Exer(
        bodyPart: "waist",
        equipment: "body weight",
        gifUrl: "http://d205bpvrqc9yn1.cloudfront.net/0002.gif",
        id: "0002",
        name: "name",
        target: "target")
  ];

  List<Exer> get list => _list;

  List<MyRoutines> _list2 = [];
  List<MyRoutines> get list2 => _list2;

  Future getList() async {
    List<Exer> list = await Api.getInfo();
    _list = list;
    notifyListeners();
  }

  void showInfo(Exer exer) {
  _list = list;
  notifyListeners();
  }

  void newRoutine(MyRoutines routine) {
    _list2.add(routine);
    notifyListeners();
  }
 
  }

  



