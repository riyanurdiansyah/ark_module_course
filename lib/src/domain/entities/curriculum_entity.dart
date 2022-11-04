import 'dart:convert';

String curriculumEntityToJson(CurriculumEntity data) =>
    json.encode(data.toJson());

class CurriculumEntity {
  CurriculumEntity({
    required this.success,
    required this.data,
  });

  bool success;
  List<CurriculumDataEntity> data;

  CurriculumEntity copyWith({
    bool? success,
    List<CurriculumDataEntity>? data,
  }) =>
      CurriculumEntity(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CurriculumDataEntity {
  CurriculumDataEntity({
    required this.key,
    required this.id,
    required this.type,
    required this.title,
    required this.duration,
    required this.content,
    required this.meta,
    required this.format,
    required this.status,
    required this.passingScore,
    required this.marks,
    required this.arkQuizType,
    required this.passingCertificatePosttest,
  });

  final int key;
  final dynamic id;
  final String type;
  final String title;
  final int duration;
  final String content;
  final List<dynamic> meta;
  final String format;
  final int status;
  final int passingScore;
  final String marks;
  final String arkQuizType;
  final String passingCertificatePosttest;

  CurriculumDataEntity copyWith({
    int? key,
    dynamic id,
    String? type,
    String? title,
    int? duration,
    String? content,
    List<dynamic>? meta,
    String? format,
    int? status,
    int? passingScore,
    String? marks,
    String? arkQuizType,
    String? passingCertificatePosttest,
  }) =>
      CurriculumDataEntity(
        key: key ?? this.key,
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        content: content ?? this.content,
        meta: meta ?? this.meta,
        format: format ?? this.format,
        status: status ?? this.status,
        passingScore: passingScore ?? this.passingScore,
        marks: marks ?? this.marks,
        arkQuizType: arkQuizType ?? this.arkQuizType,
        passingCertificatePosttest:
            passingCertificatePosttest ?? this.passingCertificatePosttest,
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "id": id,
        "type": type,
        "title": title,
        "duration": duration,
        "content": content,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "format": format,
        "status": status,
        "passing_score": passingScore,
        "marks": marks,
        "ark_quiz_type": arkQuizType,
        "passing_certificate_posttest": passingCertificatePosttest,
      };
}
