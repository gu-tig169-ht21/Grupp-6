import 'dart:html';
import 'apiModel.dart';
import 'exercise_info.dart';
import 'main.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class ExerciseListView extends StatelessWidget {
  List<Exer> list;

  ExerciseListView(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list
            .map((exer) => _buildExerciseList(context, exer))
            .toList());
  }

  Widget _buildExerciseList(context, Exer exer) => ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(exer.name),
        subtitle: Text(exer.target),
        onTap: () async {
          var newInfo = await Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) =>  ExerInfo(Exer(
                    bodyPart: 'Leg', 
                    equipment: 'Roller', 
                    gifUrl: 'www.se', 
                    id: '2', 
                    name: 'korv', 
                    target: 'Framsida lår'
                    ),))); 
                    //Exer(equipment: '', target: '', bodyPart: '', gifUrl: '', name: '', id: ''),
                    if (newInfo != null) {
                      Provider.of<MyState>(context, listen:false).showInfo(newInfo);
                    }
          // ...... *tystnad* vänta, *tysnad*, *Osäkert* Där kommer vi också ha en navigator...
        },
        trailing: IconButton(
            icon: const Icon(Icons.add_circle),
            color: Colors.pink[300],
            onPressed: ()   {
              
            }
            
                


                  
              // Här kommmer vi behöva ha en navigator och eeeeennnn, bara en navigator.
              ),
        
            
      );
}
