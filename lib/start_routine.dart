import 'package:flutter/material.dart';
import 'apiModel.dart';

class StartRoutine extends StatelessWidget {
  final Exer exer;
  StartRoutine(this.exer);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        centerTitle: true,
        title: Text(exer.name),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image(image: NetworkImage(exer.gifUrl)),
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 10.0,
              runSpacing: 20.0,
              children: [_nextButton(), _backButton()],
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
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.pink[300],
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: TextButton(
          onPressed: () {},
          child: Text("Back"),
          style: TextButton.styleFrom(
              primary: Colors.white, backgroundColor: Colors.indigo)),
    );
  }
}

Widget _nextButton() {
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
            primary: Colors.white, backgroundColor: Colors.indigo)),
  );
}
