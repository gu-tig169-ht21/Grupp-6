import 'package:flutter/material.dart';
import 'api_model.dart';

class ExerInfo extends StatelessWidget {
  final Exer exer;

  const ExerInfo(this.exer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[300],
          centerTitle: true,
          title: Text(exer.name),
        ),
        body: _content());
  }

  Widget _content() {
    return exer.gifUrl.isEmpty
        ? Center(
            child: CircularProgressIndicator(
            color: Colors.pink[300],
          ))
        : Center(
            child: Column(
              children: <Widget>[
                Image(image: NetworkImage(exer.gifUrl)),
                const SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 10.0,
                  runSpacing: 20.0,
                  children: [
                    _infoBox(target: exer.target),
                    _infoBox2(equipment: exer.equipment),
                    //named argument
                  ],
                ),
              ],
            ),
          );
  }

  Widget _infoBox({target}) { //parameter
    return Container(
        width: 200,
        height: 100,
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink[300],
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
              target,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }

  Widget _infoBox2({equipment}) {
    return Container(
        width: 200,
        height: 100,
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink[300],
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
              equipment,
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
