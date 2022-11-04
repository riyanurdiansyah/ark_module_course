import 'package:ark_module_course/src/core/failures.dart';
import 'package:ark_module_course/src/domain/entities/course_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_jrc_entity.dart';
import 'package:ark_module_course/src/domain/entities/curriculum_entity.dart';
import 'package:ark_module_course/src/domain/entities/ulasan_entity.dart';
import 'package:ark_module_course/src/domain/entities/user_status_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ArkCourseRepository {
  Future<Either<Failure, CourseJrcEntity>> getDetailCourseJRC(String slug);

  Future<Either<Failure, UserStatusEntity>> getUserStatus(
      String slug, String token);

  Future<Either<Failure, CurriculumEntity>> getCurriculums(
      String courseId, String token);

  Future<Either<Failure, List<String>>> getListIdSimiliarClass(
      String categoryId);

  Future<Either<Failure, List<CourseParseEntity>>> getSimiliarClass(
      List<String> listId);

  Future<Either<Failure, UlasanEntity>> getUlasan(String courseId, int page);
}
