import 'dart:developer';

import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/src/core/exception_handling.dart';
import 'package:ark_module_course/src/core/interceptor.dart';
import 'package:ark_module_course/src/data/dto/course_dto.dart';
import 'package:ark_module_course/src/data/dto/course_jrc_dto.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_detail_entity.dart';
import 'package:ark_module_course/src/data/dto/curriculum_dto.dart';
import 'package:ark_module_course/src/data/dto/ulasan_dto.dart';
import 'package:ark_module_course/src/data/dto/user_status_dto.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_entity.dart';
import 'package:ark_module_course/utils/app_constanta.dart';
import 'package:ark_module_course/utils/app_url.dart';

import 'package:dio/dio.dart';

class ArkCourseRemoteDataSourceImpl implements ArkCourseRemoteDataSource {
  late Dio dio;
  ArkCourseRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<CourseJrcDTO> getDetailCourseJRC(String slug) async {
    final response = await dio.get("$courseUrl/$slug/jrc");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      log('RESPONSE FROM COURSE REVAMP ${response.data}');
      return CourseJrcDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Detail Course JRC... failed connect to server',
    );
  }

  @override
  Future<UserStatusDTO> getUserStatus(String slug, String token) async {
    await dioInterceptor(dio, token);
    final response = await dio.get("$courseUrl/$slug/user_status");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return UserStatusDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get User Status... failed connect to server',
    );
  }

  @override
  Future<CurriculumDTO> getCurriculums(String courseId, String token) async {
    await dioInterceptor(dio, token);
    final response = await dio.get(
      "$courseUrl/$courseId/curriculums",
      options: globalOptions(),
    );
    log("CHECK CURRICULUM : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return CurriculumDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get User Status... failed connect to server',
    );
  }

  @override
  Future<List<String>> getListIdSimiliarClass(String categoryId) async {
    log("CHECK ID : $categoryId");
    List<String> listId = [];
    final response = await dio.get(
      "$courseUrl/category/$categoryId/coursesids?urutan=siswa-terbanyak",
      options: globalOptions(),
    );
    log("RES : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      for (var data in response.data["data"]) {
        ///response data id yg lowercase
        if (data["ID"] == null) {
          listId.add(data["id"].toString());
        }

        ///response data id yg uppercase
        if (data["id"] == null) {
          listId.add(data["ID"].toString());
        }
      }
    }
    return listId;
  }

  @override
  Future<List<CourseParseDTO>> getSimiliarClass(List<String> listId) async {
    final List<CourseParseDTO> listCourse = [];
    for (int i = 0; i < listId.length; i++) {
      final response = await dio.get("$courseUrl/${listId[i]}");
      int code = response.statusCode ?? 500;
      if (code == 200) {
        for (var data in response.data['data']) {
          listCourse.add(CourseParseDTO.fromJson(data));
        }
      }
    }
    return listCourse;
  }

  @override
  Future<UlasanDTO> getUlasan(String courseId, int page) async {
    final response =
        await dio.get("$courseUrl/$courseId/reviews", queryParameters: {
      "page": page,
    });
    int code = response.statusCode ?? 500;
    log("CHECK RES ULASAN : ${response.data}");
    if (code == 200) {
      return UlasanDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get User Status... failed connect to server',
    );
  }

  @override
  Future<CourseRevampEntity> getCourseRevamp(String slug) async {
    final response = await dio.get(
      "$courseUrl/$slug/revamp",
    );
    int code = response.statusCode ?? 500;
    log("CHECK RES COURSE REVAMP : ${response.data}");
    if (code == 200) {
      return CourseRevampEntity.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get CourseRevamp... failed connect to server',
    );
  }

  @override
  Future<CourseRevampDetailEntity> getDetailCourseRevamp(String slug) async {
    final response = await dio.get(
      '$courseUrl/$slug/detail',
    );
    int code = response.statusCode ?? 500;
    log("CHECK RES DETAIL COURSE REVAMP : ${response.data}");
    if (code == 200) {
      return CourseRevampDetailEntity.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Detail Course Revamp ... failed connect to server',
    );
  }
}
