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

  //Delete Routine
  static Future deleteRoutine(int routinesId) async {
    await http.delete(Uri.parse('$API_ROUTINES$routinesId'));
    //This function always return a empty {}.
  }

//Ta bort en övning
  static Future changeRoutine(
      int routinesId, String title, List<String> exers) async {
    //Put
    await http.put(Uri.parse('$API_ROUTINES$routinesId'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          {"Title": title, "Exercises": exers}
        }));
    //This function always return a empty {}.

    /* {
    "Title": "Rutin som ska ändras",
    "Exercises": [
        "Ett",
        "Två Lift"
        ]
      } */
  }
}
