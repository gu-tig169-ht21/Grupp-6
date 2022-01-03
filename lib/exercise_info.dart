import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'apiModel.dart';

class ExerInfo extends StatelessWidget {
  final Exer exer;

  ExerInfo(this.exer);

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
              children: [
                _infoBox(exer.target),
                _infoBox2(exer.equipment),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(target) {
    return Container(
        width: 200,
        height: 100,
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink[300],
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          children: [
            const Text(
              'Target muscle',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              exer.target,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }

  Widget _infoBox2(equipment) {
    return Container(
        width: 200,
        height: 100,
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink[300],
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          children: [
            const Text(
              'Equipment',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              exer.equipment,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
