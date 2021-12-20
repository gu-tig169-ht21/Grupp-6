import 'package:flutter/material.dart';
import 'apiModel.dart';
import 'api_routine_model.dart';

class StartRoutine extends StatelessWidget {
  final Routines routine;
  //final Exer exer;
  StartRoutine(this.routine);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        centerTitle: true,
        title: Text(routine.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //Image(image: NetworkImage(exer.gifUrl)),
            SizedBox(
              height: 400,
              width: 100,
              child: Text('Här ska GIF placeras'
              ),
              
              
              
            ),
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 60.0,
              runSpacing: 20.0,
              children: [
                 _backButton(),
                 _nextButton()],
            ),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return Container(
       width: 200,
        height: 100,
    padding: EdgeInsets.all(12),
    alignment: Alignment.bottomLeft,
    child:
        ElevatedButton(
            child: Text('BACK'),
            style: ElevatedButton.styleFrom(
              primary: Colors.pink[300],
              onPrimary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            onPressed: () {
              
            }),
    
    );
  }

/*Widget _nextButton() {
  return Container(
    width: 200,
    height: 100,
    padding: EdgeInsets.all(12),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.pink[300],
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    child: TextButton(
        onPressed: () {},
        child: Text("Next"),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.indigo,
          textStyle: const TextStyle(fontSize: 30),
        )),
  );*/
}
Widget _nextButton() {
   return Container(
      width: 200,
        height: 100,
    padding: EdgeInsets.all(12),
    alignment: Alignment.bottomRight,
    child:
        ElevatedButton(
            child: Text('NEXT'),
            style: ElevatedButton.styleFrom(
              primary: Colors.pink[300],
              onPrimary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            onPressed: () {
              
            }),
      
    );
  }

