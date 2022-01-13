import 'package:my_first_app/Exercises/add_exer_to_routine.dart';
import '../API/api_model.dart';
import 'exercise_info.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExerciseListView extends StatelessWidget {
  List<Exer> exerList;

  ExerciseListView(this.exerList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Bygger listan allt eftersom
    return ListView.builder(
        shrinkWrap: true,
        itemCount: exerList.isEmpty ? 1 : exerList.length,
        itemBuilder: (context, index) {
          return _buildExerciseList(context: context, exer: exerList[index]);
        });
  }

  //Skapar listrader
  Widget _buildExerciseList({context, required Exer exer}) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(exer.name),
        subtitle: Text(exer.target),
        onTap: () {
          //Väljer övning att visa info om
          Navigator.push(
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
        },
        trailing: IconButton(
            icon: const Icon(Icons.add_circle),
            color: Colors.pink[300],
            onPressed: () {
              //Väljer övning att lägga till i rutin
              Navigator.push(
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
            }),
      );
}
