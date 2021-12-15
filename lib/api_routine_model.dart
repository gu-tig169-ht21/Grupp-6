import 'dart:convert';

List<Routines> routinesFromJson(String str) =>
    List<Routines>.from(json.decode(str).map((x) => Routines.fromJson(x)));

String routinesToJson(List<Routines> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Routines {
  Routines({
    required this.id,
    required this.title,
    required this.exercises,
  });
  //Gjorde om id från int till String?
  int id;
  String title;
  List<String> exercises;

  factory Routines.fromJson(Map<String, dynamic> json) => Routines(
        id: json["id"],
        title: json["Title"],
        exercises: List<String>.from(json["Exercises"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Title": title,
        "Exercises": List<dynamic>.from(exercises.map((x) => x)),
      };
}
