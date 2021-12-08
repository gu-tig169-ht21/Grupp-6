/* import 'list_view.dart';
import 'apiModel.dart';



List<Exercises> _list = [Exercises(bodyPart: 'waist', equipment: equipment, gifUrl: gifUrl, id: id, name: name, target: target)];
List<Exercises> get list => _list; */

import 'package:flutter/cupertino.dart';
import 'list_view.dart';
import 'main.dart';
import 'apiModel.dart';

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

  void showInfo(Exer exer) {
  _list = list;
  notifyListeners();
  }
 
  }

  



