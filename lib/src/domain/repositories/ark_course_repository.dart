import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

abstract class ArkCourseRepository {
  Future<Either<Failure, CourseJrcEntity>> getDetailCourseJRC(String slug);

  Future<Either<Failure, UserStatusEntity>> getUserStatus(
      String slug, String token);

  Future<Either<Failure, CurriculumEntity>> getCurriculums(
      String courseId, String token);
}
