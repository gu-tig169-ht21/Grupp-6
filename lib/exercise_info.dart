import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'apiModel.dart';

class ExerInfo extends StatelessWidget {
 final Exer exer;

  ExerInfo(this.exer);
  //this.equipment = exer.equipment;

  //const ExerInfo({ Key? key, required this.exer }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        centerTitle: true,
        title: Text(exer.name),
        //??'Jag är null'),
      ),
      body: Center (
        child: Column (
          children: 
            <Widget>[
          //gifURL
          Text(exer.gifUrl),
          //Text(exer.target),
          //Text(exer.equipment),
          Wrap(
            alignment: WrapAlignment.end,
            spacing: 10.0,
            runSpacing: 20.0,
            children: [
         _infoBox(exer.target),
         _infoBox2(exer.equipment),
          
          
          //Navigator.pop(context, Exer(equipment: '', bodyPart: '', gifUrl: '', id: '', name: '', target: ''))
            
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
      child: Text(exer.target,
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      //Align(alignment: ,)


    );
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
      child: Text(exer.equipment,
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }


  
}