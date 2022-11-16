import 'dart:convert';
import 'package:ark_module_course/src/domain/entities/curriculum_entity.dart';

CurriculumDTO curriculumFromJson(String str) =>
    CurriculumDTO.fromJson(json.decode(str));

class CurriculumDTO extends CurriculumEntity {
  CurriculumDTO({
    required super.success,
    required super.data,
  });

  factory CurriculumDTO.fromJson(Map<String, dynamic> json) => CurriculumDTO(
        success: json["success"],
        data: List<CurriculumDataEntity>.from(
          json["data"].map(
            (x) => CurriculumDataDTO.fromJson(x),
          ),
        ),
      );
}

class CurriculumDataDTO extends CurriculumDataEntity {
  CurriculumDataDTO({
    required super.key,
    required super.id,
    required super.type,
    required super.title,
    required super.duration,
    required super.content,
    required super.meta,
    required super.format,
    required super.status,
    required super.passingScore,
    required super.marks,
    required super.arkQuizType,
    required super.passingCertificatePosttest,
  });

  factory CurriculumDataDTO.fromJson(Map<String, dynamic> json) =>
      CurriculumDataDTO(
        key: json["key"] ?? 0,
        id: json["id"] ?? 0,
        type: json["type"] ?? "",
        title: json["title"] ?? "",
        duration: json["duration"] ?? 0,
        content: json["content"] ?? "",
        meta: json["meta"] == null
            ? []
            : List<dynamic>.from(json["meta"].map((x) => x)),
        format: json["format"] ?? "",
        status: json["status"] ?? 0,
        passingScore: json["passing_score"] ?? 0,
        marks: json["marks"] ?? "",
        arkQuizType: json["ark_quiz_type"] ?? "",
        passingCertificatePosttest: json["passing_certificate_posttest"] ?? "",
      );
}
