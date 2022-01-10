import 'package:my_first_app/add_exer_to_routine.dart';
import 'api_model.dart';
import 'exercise_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

// ignore: must_be_immutable
class ExerciseListView extends StatelessWidget {
  List<Exer> exerList;

  ExerciseListView(this.exerList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return exerList.isEmpty
        ? Center(
            child: CircularProgressIndicator(
            color: Colors.pink[300],
          ))
        : */ return 
            ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: exerList
                .map((exer) => _buildExerciseList(context: context, exer: exer))
                .toList());
  }
  //Skapar listrader
  Widget _buildExerciseList({context, required Exer exer}) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(exer.name),
        subtitle: Text(exer.target),
        onTap: () async {
          //Väljer övning att visa info om
          var newInfo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExerInfo(
                        Exer(
                            bodyPart: exer.bodyPart,
                            equipment: exer.equipment,
                            gifUrl: exer.gifUrl,
                            id: exer.id,
                            name: exer.name,
                            target: exer.target),
                      )));
          if (newInfo != null) {
            Provider.of<MyState>(context, listen: false).showExerInfo(newInfo);
          }
        },
        trailing: IconButton(
            icon: const Icon(Icons.add_circle),
            color: Colors.pink[300],
            onPressed: () async {
              //Väljer övning att lägga till i rutin
              var pickedExer = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddExer(
                            Exer(
                                bodyPart: exer.bodyPart,
                                equipment: exer.equipment,
                                gifUrl: exer.gifUrl,
                                id: exer.id,
                                name: exer.name,
                                target: exer.target),
                          )));
              if (pickedExer != null) {
                Provider.of<MyState>(context, listen: false)
                    .showExerInfo(pickedExer);
              }
            }),
      );
}
