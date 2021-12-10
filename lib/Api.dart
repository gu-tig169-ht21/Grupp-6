// ignore_for_file: file_names
import 'package:http/http.dart' as http;
import 'package:my_first_app/api_routine_model.dart';
import 'dart:convert';
import 'apiModel.dart';
import 'model.dart';

//Api för exercises
const API_URL =
    'https://exercisedb.p.rapidapi.com/exercises?rapidapi-key=594be08a42msh44e8b8ac3841628p1064edjsned46cb6b0d83';

//API-länk Rutiner:
const API_ROUTINES = 'https://retoolapi.dev/qoXb2d/routines/';

class Api {
  static Future<List<Exer>> getInfo() async {
    var response = await http.get(Uri.parse('$API_URL'));
    var json = jsonDecode(response.body);

    return json.map<Exer>((data) {
      return Exer.fromJson(data);
    }).toList();
  }

  // gör en get

  static Future<List<Routines>> getRoutines() async {
    var response = await http.get(Uri.parse('$API_ROUTINES'));
    var json = jsonDecode(response.body);

    return json.map<Routines>((data) {
      return Routines.fromJson(data);
    }).toList();
  }
}
