import 'dart:developer';
import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/src/core/exception_handling.dart';
import 'package:ark_module_course/src/core/failures.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_detail_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_jrc_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_entity.dart';
import 'package:ark_module_course/src/domain/entities/curriculum_entity.dart';
import 'package:ark_module_course/src/domain/entities/ulasan_entity.dart';
import 'package:ark_module_course/src/domain/entities/user_status_entity.dart';

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

  @override
  Future<Either<Failure, List<String>>> getListIdSimiliarClass(
      String categoryId) async {
    try {
      final listId = await dataSource.getListIdSimiliarClass(categoryId);
      return Right(listId);
    } catch (e) {
      log("ERROR HOME REPO GET LIST ID TRENDING COURSE: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, List<CourseParseEntity>>> getSimiliarClass(
      List<String> listId) async {
    try {
      final course = await dataSource.getSimiliarClass(listId);
      return Right(course);
    } catch (e) {
      log("ERROR HOME REPO GET COURSE FROM LIST: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, UlasanEntity>> getUlasan(
      String courseId, int page) async {
    try {
      final ulasan = await dataSource.getUlasan(courseId, page);
      return Right(ulasan);
    } catch (e) {
      log("ERROR HOME REPO GET ULASAN: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, CourseRevampEntity>> getCourseRevamp(
      String slug) async {
    try {
      final courseRevamp = await dataSource.getCourseRevamp(slug);
      return Right(courseRevamp);
    } catch (e) {
      log("ERROR COURSE REPO GET COURSE REVAMP: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, CourseRevampDetailEntity>> getDetailCourseRevamp(
      String slug) async {
    try {
      final response = await dataSource.getDetailCourseRevamp(slug);
      log('RESPONSE ARK COURSE REPO $response');

      return Right(response);
    } catch (e) {
      log("ERROR COURSE REPO GET COURSE REVAMP DETAIL: ${e.toString()}");

      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, bool>> removeFromFavorite(
      String courseId, String token) async {
    try {
      final response = await dataSource.removeFromFavorite(courseId, token);
      return right(response);
    } catch (e) {
      log("ERROR REMOVE FROM FAVORITE: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, bool>> addToFavorite(
      String courseId, String token) async {
    try {
      final response = await dataSource.addToFavorite(courseId, token);
      return right(true);
    } catch (e) {
      log("ERROR ADD TO FAVORITE: ${e.toString()}");

      return ExceptionHandleResponse.execute(e);
    }
  }
}
