import 'package:ark_module_course/src/domain/repositories/ark_course_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkCourseUseCase {
  final ArkCourseRepository repository;

  ArkCourseUseCase(this.repository);

  ///GET DETAIL COURSE JRC BY SLUG
  Future<Either<Failure, CourseJrcEntity>> getDetailCourseJRC(
          String slug) async =>
      await repository.getDetailCourseJRC(slug);

  Future<Either<Failure, UserStatusEntity>> getUserStatus(
          String slug, String token) async =>
      await repository.getUserStatus(slug, token);

  Future<Either<Failure, CurriculumEntity>> getCurriculums(
          String courseId, String token) async =>
      await repository.getCurriculums(courseId, token);

  Future<Either<Failure, List<String>>> getListIdSimiliarClass(
          String categoryId) async =>
      await repository.getListIdSimiliarClass(categoryId);

  Future<Either<Failure, List<CourseParseEntity>>> getSimiliarClass(
          List<String> listId) async =>
      await repository.getSimiliarClass(listId);

  Future<Either<Failure, UlasanEntity>> getUlasan(
          String courseId, int page) async =>
      await repository.getUlasan(courseId, page);
}
