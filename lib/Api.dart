// ignore_for_file: constant_identifier_names, unnecessary_string_interpolations, file_names
import 'package:http/http.dart' as http;
import 'package:my_first_app/api_routine_model.dart';
import 'dart:convert';
import 'api_model.dart';

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

  // Hämta rutiner
  static Future<List<Routines>> getRoutines() async {
    var response = await http.get(Uri.parse('$API_ROUTINES'));
    var json = jsonDecode(response.body);

    return json.map<Routines>((data) {
      return Routines.fromJson(data);
    }).toList();
  }

  //Ta bort rutiner
  static Future deleteRoutine(int routinesId) async {
    await http.delete(Uri.parse('$API_ROUTINES$routinesId'));
    //Funktionen returnerar alltid en tom {}.
  }

//Modifiera en rutin, tex ta brot en övning
  static Future changeRoutine(int routinesId, Routines updatedRoutine) async {
    //Put
    var jsonRoutine = updatedRoutine.toJson();
    await http.put(Uri.parse('$API_ROUTINES$routinesId'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(jsonRoutine));
  }

//Skapa en ny rutin
  static Future createRoutine(
      {required String title, required List<String> list}) async {
    return http.post(
      Uri.parse('$API_ROUTINES'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'Title': title, 'Exercises': list}),
    );
  }
}
