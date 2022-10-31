import 'dart:developer';

import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
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
      return CourseJrcDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Detail Course JRC... failed connect to server',
      'Failed Get Detail Course JRC... Please try again',
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
      'Failed Get User Status... Please try again',
    );
  }

  @override
  Future<CurriculumDTO> getCurriculums(String courseId, String token) async {
    await dioInterceptor(dio, token);
    final response = await dio.get("$courseUrl/$courseId/curriculums");
    log("CHECK CURRICULUM : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return CurriculumDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get User Status... failed connect to server',
      'Failed Get User Status... Please try again',
    );
  }

  @override
  Future<List<String>> getListIdSimiliarClass(String categoryId) async {
    List<String> listId = [];
    final response = await dio.get(
        "$courseUrl/category/$categoryId/coursesids?urutan=siswa-terbanyak");
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

      return listId;
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get List Id Newest Course... failed connect to server',
      'Failed Get List Id Newest Course... Please try again',
    );
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
      'Failed Get User Status... Please try again',
    );
  }
}
