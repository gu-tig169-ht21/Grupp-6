// To parse this JSON data, do
//
//     final Exercises = ExercisesFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Exercises> ExercisesFromJson(String str) => List<Exercises>.from(json.decode(str).map((x) => Exercises.fromJson(x)));

String ExercisesToJson(List<Exercises> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exercises {
    Exercises({
        required this.bodyPart,
        required this.equipment,
        required this.gifUrl,
        required this.id,
        required this.name,
        required this.target,
    });

    BodyPart bodyPart;
    Equipment equipment;
    String gifUrl;
    String id;
    String name;
    Target target;

    factory Exercises.fromJson(Map<String, dynamic> json) => Exercises(
        bodyPart: json["bodyPart"] == null ? null : bodyPartValues.map[json["bodyPart"]],
        equipment: json["equipment"] == null ? null : equipmentValues.map[json["equipment"]],
        gifUrl: json["gifUrl"] == null ? null : json["gifUrl"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        target: json["target"] == null ? null : targetValues.map[json["target"]],
    );

    Map<String, dynamic> toJson() => {
        "bodyPart": bodyPart == null ? null : bodyPartValues.reverse[bodyPart],
        "equipment": equipment == null ? null : equipmentValues.reverse[equipment],
        "gifUrl": gifUrl == null ? null : gifUrl,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "target": target == null ? null : targetValues.reverse[target],
    };
}

enum BodyPart { WAIST, UPPER_LEGS, BACK, LOWER_LEGS, CHEST, UPPER_ARMS, CARDIO, SHOULDERS, LOWER_ARMS, NECK }

final bodyPartValues = EnumValues({
    "back": BodyPart.BACK,
    "cardio": BodyPart.CARDIO,
    "chest": BodyPart.CHEST,
    "lower arms": BodyPart.LOWER_ARMS,
    "lower legs": BodyPart.LOWER_LEGS,
    "neck": BodyPart.NECK,
    "shoulders": BodyPart.SHOULDERS,
    "upper arms": BodyPart.UPPER_ARMS,
    "upper legs": BodyPart.UPPER_LEGS,
    "waist": BodyPart.WAIST
});

enum Equipment { BODY_WEIGHT, CABLE, LEVERAGE_MACHINE, ASSISTED, MEDICINE_BALL, STABILITY_BALL, BAND, BARBELL, ROPE, DUMBBELL, EZ_BARBELL, SLED_MACHINE, UPPER_BODY_ERGOMETER, KETTLEBELL, OLYMPIC_BARBELL, WEIGHTED, BOSU_BALL, RESISTANCE_BAND, ROLLER, SKIERG_MACHINE, HAMMER, SMITH_MACHINE, WHEEL_ROLLER, STATIONARY_BIKE, TIRE, TRAP_BAR, ELLIPTICAL_MACHINE, STEPMILL_MACHINE }

final equipmentValues = EnumValues({
    "assisted": Equipment.ASSISTED,
    "band": Equipment.BAND,
    "barbell": Equipment.BARBELL,
    "body weight": Equipment.BODY_WEIGHT,
    "bosu ball": Equipment.BOSU_BALL,
    "cable": Equipment.CABLE,
    "dumbbell": Equipment.DUMBBELL,
    "elliptical machine": Equipment.ELLIPTICAL_MACHINE,
    "ez barbell": Equipment.EZ_BARBELL,
    "hammer": Equipment.HAMMER,
    "kettlebell": Equipment.KETTLEBELL,
    "leverage machine": Equipment.LEVERAGE_MACHINE,
    "medicine ball": Equipment.MEDICINE_BALL,
    "olympic barbell": Equipment.OLYMPIC_BARBELL,
    "resistance band": Equipment.RESISTANCE_BAND,
    "roller": Equipment.ROLLER,
    "rope": Equipment.ROPE,
    "skierg machine": Equipment.SKIERG_MACHINE,
    "sled machine": Equipment.SLED_MACHINE,
    "smith machine": Equipment.SMITH_MACHINE,
    "stability ball": Equipment.STABILITY_BALL,
    "stationary bike": Equipment.STATIONARY_BIKE,
    "stepmill machine": Equipment.STEPMILL_MACHINE,
    "tire": Equipment.TIRE,
    "trap bar": Equipment.TRAP_BAR,
    "upper body ergometer": Equipment.UPPER_BODY_ERGOMETER,
    "weighted": Equipment.WEIGHTED,
    "wheel roller": Equipment.WHEEL_ROLLER
});

enum Target { ABS, QUADS, LATS, CALVES, PECTORALS, GLUTES, HAMSTRINGS, ADDUCTORS, TRICEPS, CARDIOVASCULAR_SYSTEM, SPINE, UPPER_BACK, BICEPS, DELTS, FOREARMS, TRAPS, SERRATUS_ANTERIOR, ABDUCTORS, LEVATOR_SCAPULAE }

final targetValues = EnumValues({
    "abductors": Target.ABDUCTORS,
    "abs": Target.ABS,
    "adductors": Target.ADDUCTORS,
    "biceps": Target.BICEPS,
    "calves": Target.CALVES,
    "cardiovascular system": Target.CARDIOVASCULAR_SYSTEM,
    "delts": Target.DELTS,
    "forearms": Target.FOREARMS,
    "glutes": Target.GLUTES,
    "hamstrings": Target.HAMSTRINGS,
    "lats": Target.LATS,
    "levator scapulae": Target.LEVATOR_SCAPULAE,
    "pectorals": Target.PECTORALS,
    "quads": Target.QUADS,
    "serratus anterior": Target.SERRATUS_ANTERIOR,
    "spine": Target.SPINE,
    "traps": Target.TRAPS,
    "triceps": Target.TRICEPS,
    "upper back": Target.UPPER_BACK
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }