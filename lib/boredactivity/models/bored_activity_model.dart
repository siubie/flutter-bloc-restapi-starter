// To parse this JSON data, do
//
//     final activity = activityFromJson(jsonString);

import 'dart:convert';

ActivityModel activityModelFromJson(String str) =>
    ActivityModel.fromJson(json.decode(str));

String activityModelToJson(ActivityModel data) => json.encode(data.toJson());

class ActivityModel {
  ActivityModel({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  String activity;
  dynamic type;
  dynamic participants;
  dynamic price;
  String link;
  String key;
  dynamic accessibility;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        price: json["price"],
        link: json["link"],
        key: json["key"],
        accessibility: json["accessibility"],
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        "participants": participants,
        "price": price,
        "link": link,
        "key": key,
        "accessibility": accessibility,
      };
}
