import 'package:ark_module_setup/ark_module_setup.dart';

abstract class ArkCourseRemoteDataSource {
  Future<CourseJrcDTO> getDetailCourseJRC(String slug);

  Future<UserStatusDTO> getUserStatus(String slug, String token);

  Future<CurriculumDTO> getCurriculums(String courseId, String token);
}
