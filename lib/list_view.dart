import 'dart:html';
import 'apiModel.dart';
import 'exercise_info.dart';
import 'main.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';
import 'my_routines.dart';
import 'overlay.dart';

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
                    bodyPart: exer.bodyPart, 
                    equipment: exer.equipment, 
                    gifUrl: exer.gifUrl, 
                    id: exer.id, 
                    name: exer.name, 
                    target: exer.target
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
            onPressed: () async {
               var newRoutine = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTask(MyRoutines(
                        title: '',
                      ))));
                    if (newRoutine != null) {}
                      

              showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => AddTask(routine),
                    backgroundColor: Colors.white,



                      /*return Wrap(
                        children: [
                          ListTile(
                          trailing: IconButton(
                          icon: const Icon(Icons.add_circle),
                          color: Colors.pink[300],
                          
                          onPressed: () {
                            },
                            
                      ),
                      
                          ),
                        ]*/
                    
                  );
                },
              
            
            
                


                  
              // Här kommmer vi behöva ha en navigator och eeeeennnn, bara en navigator.
              ),
        
            
      );
}

class AddTask extends StatefulWidget {

  final MyRoutines routine;

  AddTask(this.routine);

  @override
  State<AddTask> createState() => AddTaskState(routine);
}

class AddTaskState extends State<AddTask> {
  String title = '';

  //final _formKey = GlobalKey<FormState>();

  late TextEditingController textEditingController = TextEditingController();

  AddTaskState(MyRoutines routine) {

    this.title = routine.title;

  textEditingController.addListener(() {
      setState(() {
        title = textEditingController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: textEditingController,
            decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3.0),
            ),
            labelText:
            'Add Routine',
            //textAlign: TextAlign.center,
            //style: TextStyle(
             // color: Colors.pink[300]
            ),
          ),
          ElevatedButton(
          child: const Text('+ ADD'),
          onPressed: () {
            //if (_formKey.currentState!.validate()) {
              Navigator.pop(context, MyRoutines(title: title));
          }
          ),

        ],
        
      ),
    );
  }
}

