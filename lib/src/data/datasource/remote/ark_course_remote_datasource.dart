import 'package:ark_module_course/src/data/dto/course_dto.dart';
import 'package:ark_module_course/src/data/dto/course_jrc_dto.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_detail_entity.dart';
import 'package:ark_module_course/src/data/dto/curriculum_dto.dart';
import 'package:ark_module_course/src/data/dto/ulasan_dto.dart';
import 'package:ark_module_course/src/data/dto/user_status_dto.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_entity.dart';

abstract class ArkCourseRemoteDataSource {
  Future<CourseJrcDTO> getDetailCourseJRC(String slug);

  Future<CourseRevampEntity> getCourseRevamp(String slug);

  Future<CourseRevampDetailEntity> getDetailCourseRevamp(String slug);

  Future<UserStatusDTO> getUserStatus(String slug, String token);

  Future<CurriculumDTO> getCurriculums(String courseId, String token);

  Future<List<String>> getListIdSimiliarClass(String categoryId);

  Future<List<CourseParseDTO>> getSimiliarClass(List<String> listId);

  Future<UlasanDTO> getUlasan(String courseId, int page);

  Future<bool> removeFromFavorite(String courseId, String token);

  Future<bool> addToFavorite(String courseId, String token);
}
