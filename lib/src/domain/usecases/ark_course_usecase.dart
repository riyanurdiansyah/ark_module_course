import 'package:ark_module_course/src/core/failures.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_detail_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_jrc_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_entity.dart';
import 'package:ark_module_course/src/domain/entities/curriculum_entity.dart';
import 'package:ark_module_course/src/domain/entities/ulasan_entity.dart';
import 'package:ark_module_course/src/domain/entities/user_status_entity.dart';
import 'package:ark_module_course/src/domain/repositories/ark_course_repository.dart';

import 'package:dartz/dartz.dart';

class ArkCourseUseCase {
  final ArkCourseRepository repository;

  ArkCourseUseCase(this.repository);

  ///GET DETAIL COURSE JRC BY SLUG
  Future<Either<Failure, CourseJrcEntity>> getDetailCourseJRC(
          String slug) async =>
      await repository.getDetailCourseJRC(slug);

  Future<Either<Failure, CourseRevampEntity>> getCourseRevamp(
          String slug) async =>
      await repository.getCourseRevamp(slug);

  Future<Either<Failure, CourseRevampDetailEntity>> getDetailCourseRevamp(
          String slug) async =>
      await repository.getDetailCourseRevamp(slug);

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
