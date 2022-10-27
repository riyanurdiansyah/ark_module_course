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
}
