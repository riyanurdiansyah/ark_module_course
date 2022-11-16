import 'package:ark_module_course/src/domain/entities/course_coin_entity.dart';

class CourseCoinDTO extends CourseCoinEntity {
  CourseCoinDTO({
    required super.coinFlag,
    required super.coinDescription,
    required super.coinValue,
  });

  factory CourseCoinDTO.fromJson(Map<String, dynamic> json) => CourseCoinDTO(
        coinFlag: json["coin_flag"] ?? "1",
        coinValue: json["coin_value"] ?? "",
        coinDescription: json["coin_description"] ?? "",
      );
}
