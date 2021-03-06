// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<Exer> ExerFromJson(String str) =>
    List<Exer>.from(json.decode(str).map((x) => Exer.fromJson(x)));

String ExerToJson(List<Exer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exer {
  Exer({
    required this.bodyPart,
    required this.equipment,
    required this.gifUrl,
    required this.id,
    required this.name,
    required this.target,
  });

  String bodyPart;
  String equipment;
  String gifUrl;
  String id;
  String name;
  String target;

  factory Exer.fromJson(Map<String, dynamic> json) => Exer(
        bodyPart: json["bodyPart"],
        equipment: json["equipment"],
        gifUrl: json["gifUrl"],
        id: json["id"],
        name: json["name"],
        target: json["target"],
      );

  Map<String, dynamic> toJson() => {
        "bodyPart": bodyPart,
        "equipment": equipment,
        "gifUrl": gifUrl,
        "id": id,
        "name": name,
        "target": target,
      };
}
