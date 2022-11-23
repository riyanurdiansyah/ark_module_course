// To parse this JSON data, do
//
//     final courseStatus = courseStatusFromJson(jsonString);

import 'dart:convert';

ArkCourseStatusEntity arkCourseStatusFromJson(String str) =>
    ArkCourseStatusEntity.fromJson(json.decode(str));

String arkCourseStatusToJson(ArkCourseStatusEntity data) =>
    json.encode(data.toJson());

class ArkCourseStatusEntity {
  ArkCourseStatusEntity({
    this.success,
    this.data,
  });

  final bool? success;
  final Data? data;

  factory ArkCourseStatusEntity.fromJson(Map<String, dynamic> json) =>
      ArkCourseStatusEntity(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.currentUnitKey,
    this.courseitems,
    this.remainingDuration,
  });

  final int? currentUnitKey;
  final List<Courseitem>? courseitems;
  final String? remainingDuration;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentUnitKey: json["current_unit_key"],
        courseitems: List<Courseitem>.from(
            json["courseitems"].map((x) => Courseitem.fromJson(x))),
        remainingDuration: json["remaining_duration"],
      );

  Map<String, dynamic> toJson() => {
        "current_unit_key": currentUnitKey,
        "courseitems": List<dynamic>.from(courseitems!.map((x) => x.toJson())),
        "remaining_duration": remainingDuration,
      };
}

class Courseitem {
  Courseitem({
    this.key,
    this.id,
    this.type,
    this.title,
    this.duration,
    this.content,
    this.meta,
    this.status,
    this.mp4Link,
    this.arkQuizType,
    this.passingScore,
    this.marks,
    this.passingCertificatePosttest,
    this.homework,
    this.ujianAkhir,
    this.evaluasiHomework,
  });

  final int? key;
  final String? id;
  final TypeCourseUnit? type;
  final String? title;
  final int? duration;
  final String? content;
  final List<dynamic>? meta;
  final int? status;
  final String? mp4Link;
  final String? arkQuizType;
  final int? passingScore;
  final String? marks;
  final String? passingCertificatePosttest;
  final String? homework;
  final String? ujianAkhir;
  final String? evaluasiHomework;

  factory Courseitem.fromJson(Map<String, dynamic> json) => Courseitem(
        key: json["key"],
        id: json["id"] == 0 ? '0' : json["id"],
        type: typeValues.map[json["type"]],
        title: json["title"],
        duration: json["duration"],
        content: json["content"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        status: json["status"],
        mp4Link: json["mp4_link"],
        arkQuizType: json["ark_quiz_type"],
        passingScore: json["passing_score"] ?? 0,
        marks: json["marks"] ?? '0',
        passingCertificatePosttest: json["passing_certificate_posttest"],
        homework: json['homework'] == 0 ? '0' : json['homework'],
        ujianAkhir: json['ujian_akhir'] == 0 ? '0' : json['ujian_akhir'],
        evaluasiHomework:
            json['evaluasi_homework'] == 0 ? '0' : json['evaluasi_homework'],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "id": id,
        "type": typeValues.reverse![type],
        "title": title,
        "duration": duration,
        "content": content,
        "meta": List<dynamic>.from(meta!.map((x) => x)),
        "status": status,
        "mp4_link": mp4Link,
        "ark_quiz_type": arkQuizType,
        "passing_score": passingScore,
        "marks": marks,
        "passing_certificate_posttest": passingCertificatePosttest,
        "homework": homework,
        "ujian_akhir": ujianAkhir,
        "evaluasi_homework": evaluasiHomework,
      };
}

enum TypeCourseUnit { section, unit, quiz }

final typeValues = EnumValues({
  "quiz": TypeCourseUnit.quiz,
  "section": TypeCourseUnit.section,
  "unit": TypeCourseUnit.unit
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
