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
          Text(exer.target),
          Text(exer.equipment),
         
          //Navigator.pop(context, Exer(equipment: '', bodyPart: '', gifUrl: '', id: '', name: '', target: ''))
          
            ]
        ),
        ),
      );
    
  }

  //Widget _infoBox (context )


  
}