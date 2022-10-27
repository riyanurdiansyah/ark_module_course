import 'dart:developer';
import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkCourseRepositoryImpl implements ArkCourseRepository {
  final ArkCourseRemoteDataSource dataSource;

  ArkCourseRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CourseJrcEntity>> getDetailCourseJRC(
      String slug) async {
    try {
      final course = await dataSource.getDetailCourseJRC(slug);
      return Right(course);
    } catch (e) {
      log("ERROR HOME REPO GET CATEGORY: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, UserStatusEntity>> getUserStatus(
      String slug, String token) async {
    try {
      final status = await dataSource.getUserStatus(slug, token);
      return Right(status);
    } catch (e) {
      log("ERROR HOME REPO GET USER STATUS: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, CurriculumEntity>> getCurriculums(
      String courseId, String token) async {
    try {
      final curriculums = await dataSource.getCurriculums(courseId, token);
      return Right(curriculums);
    } catch (e) {
      log("ERROR HOME REPO GET CURRICULUMS: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }
}
