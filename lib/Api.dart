// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'apiModel.dart';
import 'model.dart';

//Api för exercises
const API_URL = 'https://exercisedb.p.rapidapi.com/exercises?rapidapi-key=594be08a42msh44e8b8ac3841628p1064edjsned46cb6b0d83';


//Sätt in APi för Todo


class Api {

  static Future<List<Exer>> getInfo() async {
    var response = await http.get(Uri.parse('$API_URL'));
    var json = jsonDecode(response.body);

    return json.map<Exer>((data) {
      return Exer.fromJson(data);
    }).toList();

  }

  // gör en get 
}