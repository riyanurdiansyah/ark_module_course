import 'dart:developer';

import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/services/firebase_analytics.dart';
import 'package:ark_module_course/src/core/exception_handling.dart';
import 'package:ark_module_course/src/data/dto/course_dto.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_detail_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_jrc_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_entity.dart';
import 'package:ark_module_course/src/domain/entities/curriculum_entity.dart';
import 'package:ark_module_course/src/domain/entities/lowongan_entity.dart';
import 'package:ark_module_course/src/domain/entities/ulasan_entity.dart';
import 'package:ark_module_course/src/domain/entities/user_status_entity.dart';
import 'package:ark_module_course/utils/app_dialog.dart';
import 'package:ark_module_course/utils/app_empty_entity.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ArkCourseController extends GetxController {
  // final ArkCourseUseCase _useCase = ArkCourseUseCase(
  //     ArkCourseRepositoryImpl(ArkCourseRemoteDataSourceImpl()));
  final Rx<CourseDataEntity> _detailCourse = courseEmpty.obs;
  Rx<CourseDataEntity> get detailCourse => _detailCourse;

  final Rx<bool> _isLoading = true.obs;
  Rx<bool> get isLoading => _isLoading;

  final Rx<bool> _isLoadingUlasan = true.obs;
  Rx<bool> get isLoadingUlasan => _isLoadingUlasan;

  final Rx<bool> _isLoadingUserStatus = true.obs;
  Rx<bool> get isLoadingUserStatus => _isLoadingUserStatus;

  final Rx<bool> _isLoadingCurriculums = true.obs;
  Rx<bool> get isLoadingCurriculums => _isLoadingCurriculums;

  final Rx<bool> _isLoadingSimiliar = true.obs;
  Rx<bool> get isLoadingSimiliar => _isLoadingSimiliar;

  final Rx<bool> _isLogin = false.obs;
  Rx<bool> get isLogin => _isLogin;

  final Rx<bool> _isPlayedYoutube = true.obs;
  Rx<bool> get isPlayedYoutube => _isPlayedYoutube;

  final Rx<bool> _isHaveVideo = true.obs;
  Rx<bool> get isHaveVideo => _isHaveVideo;

  final Rx<String> _token = "".obs;
  Rx<String> get token => _token;

  final RxList<String> _splitVid = <String>[].obs;
  RxList<String> get splitVid => _splitVid;

  late SharedPreferences _prefs;

  final RxList<CourseParseEntity> _similiarClass = <CourseParseEntity>[].obs;
  RxList<CourseParseEntity> get similiarClass => _similiarClass;

  final Rx<CourseJrcEntity> _detailCourseJRC = courseJrcEmpty.obs;
  Rx<CourseJrcEntity> get detailCourseJRC => _detailCourseJRC;

  final Rx<CourseRevampEntity> _courseRevamp = courseRevampEmpty.obs;
  Rx<CourseRevampEntity> get courseRevamp => _courseRevamp;

  final Rx<CourseRevampDetailEntity> _detailCourseRevamp =
      courseRevampDetailEntity.obs;
  Rx<CourseRevampDetailEntity> get detailCourseRevamp => _detailCourseRevamp;

  final Rx<CourseRevampDetailEntity> _detailCourseBiasa =
      courseRevampDetailEntity.obs;
  Rx<CourseRevampDetailEntity> get detailCourseBiasa => _detailCourseBiasa;

  final Rx<int> _indexTabCourse = 0.obs;
  Rx<int> get indexTabCourse => _indexTabCourse;

  final Rx<int> _tabIndexRevamp = 0.obs;
  Rx<int> get tabIndexRevamp => _tabIndexRevamp;

  final Rx<CurriculumEntity> _curriculum =
      CurriculumEntity(success: false, data: []).obs;
  Rx<CurriculumEntity> get curriculum => _curriculum;

  //FAVORITE
  var isFav = false.obs;

  var listTitle = <CurriculumDataEntity>[].obs;
  var listUnit = <CurriculumDataEntity>[].obs;
  var tempList = <CurriculumDataEntity>[].obs;
  var duration = 0.obs;
  var penyelesaianKelas = 0.obs;
  var paketKelas = [].obs;

  var totalUnit = 0.obs;
  var totalKuis = 0.obs;

  // TAB JRC
  var tabIndexJrc = 0.obs;
  var isExpanded = false.obs;
  var isExpandedInstructor = false.obs;

  // FOR COURSE REVAMP
  var isExpandedCourseRevamp = false.obs;

  final Rx<UserStatusEntity> _userStatus = UserStatusEntity(
          userId: 0, userStatus: "", userExpiry: "", isExpired: false)
      .obs;
  Rx<UserStatusEntity> get userStatus => _userStatus;

  late YoutubePlayerController ytController;

  var cek = const LowonganEntity();

  final Rx<UlasanEntity> _ulasan = UlasanEntity(
          success: false,
          data: UlasanParseDataEntity(
              currentPage: 0,
              data: [],
              firstPageUrl: "",
              from: 0,
              lastPage: 0,
              lastPageUrl: "",
              links: "",
              nextPageUrl: "",
              path: "",
              perPage: 0,
              prevPageUrl: 0,
              to: 0,
              total: 0))
      .obs;
  Rx<UlasanEntity> get ulasan => _ulasan;

  final Rx<int> _ratingPage = 1.obs;
  Rx<int> get ratingPage => _ratingPage;

  late ArkCourseUseCase _useCase;
  late ArkCourseRepositoryImpl _repository;
  late ArkCourseRemoteDataSourceImpl _dataSource;

  late ScrollController scrollControllerPage;

  @override
  void onInit() async {
    await _setup();
    if (_detailCourse.value.courseFlag.jrc == "1") {
      _getCourseDetailJRC();
      log('THIS IS COURSE JRC');
    }
    if (_detailCourse.value.courseFlag.revamp == "1") {
      _getCourseRevamp();
      _getCourseRevampDetail();

      log('THIS IS COURSE REVAMP');
    }
    // _getCourseRevamp();
    // _getCourseRevampDetail();
    // log('COURSE REVAMP');
    await _getDetailCourse();
    fetchUserStatus();
    fetchCurriculums();
    fetchCurriculumsCourseRevamp();
    fetchUlasan(_ratingPage.value);
    _fetchListIdSimiliarClass();
    await _changeLoading(false);
    super.onInit();
  }

  void fetchUlasan(int page) async {
    _changeLoadingUlasan(true);
    final response =
        await _useCase.getUlasan(_detailCourse.value.id.toString(), page);

    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _ulasan.value = data,
    );
    await _changeLoadingUlasan(false);
  }

  void changeSourceCourse(CourseParseEntity simClass) async {
    _changeLoading(true);
    _ratingPage.value = 1;
    _detailCourse.value = simClass.course;
    _isHaveVideo.value = checkVideoOrImage;
    if (_isHaveVideo.value) {
      ytController.load(_splitVid[0]);
      ytController.stop();
      // _ytListen();
    }
    if (_detailCourse.value.courseFlag.jrc == "1") {
      _getCourseDetailJRC();
    }
    if (_detailCourse.value.courseFlag.revamp == "1") {
      _getCourseRevamp();
      _getCourseRevampDetail();
    }

    fetchUserStatus();

    fetchCurriculums();
    fetchUlasan(_ratingPage.value);
    _fetchListIdSimiliarClass();
    await _getDetailCourse();
    await _changeLoading(false);
  }

  Future<void> _getCourseRevamp() async {
    _changeLoading(true);

    final response =
        await _useCase.getCourseRevamp(_detailCourse.value.courseSlug);
    response.fold(
      (l) => ExceptionHandle.execute(l),
      (r) {
        log('RESPONSE COURSE REVAMP $r');
        return _courseRevamp.value = r;
      },
    );
    await _changeLoading(false);
  }

  Future<void> _getCourseRevampDetail() async {
    _changeLoading(true);

    final response =
        await _useCase.getDetailCourseRevamp(_detailCourse.value.courseSlug);
    response.fold((l) {
      log('ERROR DETAIL COURSE REVAMP $l');
      return ExceptionHandle.execute(l);
    }, (r) {
      log('SUCCESS DETAIL COURSE REVAMP ${r.data}');
      return _detailCourseRevamp.value = r;
    });
    await _changeLoading(false);
  }

  Future<void> _getDetailCourse() async {
    _changeLoading(true);
    final response =
        await _useCase.getDetailCourse(_detailCourse.value.id.toString());
    response.fold((l) => ExceptionHandle.execute(l), (r) {
      log('RESPONSE SUCCESS FROM GET DETAIL COURSE ${r.data}');

      return _detailCourseBiasa.value = r;
    });
    await _changeLoading(false);
  }

  Future<void> _getCourseDetailJRC() async {
    final response =
        await _useCase.getDetailCourseJRC(_detailCourse.value.courseSlug);
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) {
      _detailCourseJRC.value = data;
    });
  }

  Future _setup() async {
    //INITIALIZE DATASOURCE
    _dataSource = ArkCourseRemoteDataSourceImpl();
    //INITIALIZE REPOSITORY
    _repository = ArkCourseRepositoryImpl(_dataSource);
    //INITIALIZE USECASE
    _useCase = ArkCourseUseCase(_repository);

    scrollControllerPage = ScrollController();

    _prefs = await SharedPreferences.getInstance();
    _token.value = _prefs.getString('token_access') ?? '';
    _isLogin.value = _prefs.getBool('user_login') ?? false;
    if (Get.arguments != null) {
      if (Get.arguments is Map<String, dynamic>) {
        _detailCourse.value = CourseDataDTO.fromJson(Get.arguments);
      }
    }
    _isHaveVideo.value = checkVideoOrImage;
    if (_isHaveVideo.value) {
      ytController = YoutubePlayerController(
        initialVideoId: _splitVid[0],
        params: const YoutubePlayerParams(
          autoPlay: false,
          mute: false,
          showControls: false,
          showFullscreenButton: false,
        ),
      );
      _ytListen();
    }
  }

  Future _changeLoadingUserStatus(bool val) async {
    _isLoadingUserStatus.value = val;
  }

  Future _changeLoadingCurriculum(bool val) async {
    _isLoadingCurriculums.value = val;
  }

  Future _changeLoadingSimiliar(bool val) async {
    _isLoadingSimiliar.value = val;
  }

  Future _changeLoadingUlasan(bool val) async {
    _isLoadingUlasan.value = val;
  }

  Future _changeLoading(bool val) async {
    _isLoading.value = val;
  }

  void _ytListen() {
    ytController.listen((event) {
      if (event.playerState == PlayerState.playing) {
        _isPlayedYoutube.value = true;
      }
      if (event.playerState == PlayerState.paused) {
        AppFirebaseAnalyticsService().addLogWithParam(
          'thumbnail_video_click_duration',
          {
            'seconds:': '${event.position.inSeconds}',
          },
        );
      }
    });
  }

  bool get checkVideoOrImage {
    final re =
        RegExp(r'(?<=https://www.youtube-nocookie.com/embed/)(.*)(?=iv_load_)');
    var match = re.firstMatch(_detailCourse.value.description);
    if (match != null) {
      final vidDesc = match.group(0)!;
      _splitVid.value = vidDesc.split('?');
      return true;
    }
    return false;
  }

  void onTapMplinks(int i) {
    launchUrl(
      Uri.parse(detailCourse.value.mpLinks[i - 1].mpProdukLink),
      mode: LaunchMode.externalApplication,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),
    );
    AppFirebaseAnalyticsService().addLog(
        'reguler_marketplace_${_detailCourse.value.mpLinks[i - 1].mpName}');
  }

  void onChangeTab(int i) {
    _indexTabCourse.value = i;
  }

  void fetchUserStatus() async {
    _changeLoadingUserStatus(true);
    final response = await _useCase.getUserStatus(
        _detailCourse.value.courseSlug, _token.value);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) {
        log('FETCH USER STATUS ${data.userStatus}');
        return _userStatus.value = data;
      },
    );
    await _changeLoadingUserStatus(false);
  }

  void fetchCurriculums() async {
    _changeLoadingCurriculum(true);
    final response = await _useCase.getCurriculums(
        _detailCourse.value.id.toString(), _token.value);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) {
        List<int> unitDurations = [];
        List quizes = [];
        if (data.data.isNotEmpty) {
          for (int i = 0; i < data.data.length; i++) {
            if (data.data[i].type == 'unit') {
              unitDurations.insert(0, data.data[i].duration);
            } else if (data.data[i].type == 'quiz') {
              quizes.insert(0, data.data[i].type);
            }
          }
        }
        for (int i = 0; i < unitDurations.length; i++) {
          duration.value = unitDurations[i];
        }
        totalKuis.value = quizes.length;
        penyelesaianKelas.value = Duration(seconds: duration.value).inHours +
            const Duration(minutes: 120).inHours;
        totalUnit.value = unitDurations.length;
        return _curriculum.value = data;
      },
    );
    await _changeLoadingCurriculum(false);
  }

  Future<void> fetchCurriculumsCourseRevamp() async {
    _changeLoadingCurriculum(true);
    final response = await _useCase.getCurriculums(
        _detailCourse.value.id.toString(), _token.value);
    response.fold((l) => ExceptionHandle.execute(l), (r) async {
      List<int> unitDurations = [];
      int tempId = 0;
      // FOR EXPANDABLE UNIT
      for (int i = 0; i < r.data.length; i++) {
        if (r.data[i].type == "unit" || r.data[i].type == "quiz") {
          r.data[i].idParent = tempId;
          listUnit.add(r.data[i]);
        } else {
          tempId++;
          r.data[i].idParent = tempId;
          listTitle.add(r.data[i]);
        }
        tempList.add(r.data[i]);

        if (r.data[i].type == "unit") {
          unitDurations.insert(0, r.data[i].duration);
        }
      }

      for (int i = 0; i < unitDurations.length; i++) {
        duration.value = unitDurations[i];
      }
      penyelesaianKelas.value = Duration(seconds: duration.value).inHours +
          const Duration(minutes: 120).inHours;
      totalUnit.value = unitDurations.length;
      log('TOTAL UNIT $totalUnit');
      log('PENYELESAIAN KELAS $penyelesaianKelas');
      log('DURATION $duration');
      await _changeLoading(false);
      return _curriculum.value = r;
    });
  }

  void _fetchListIdSimiliarClass() async {
    _changeLoadingSimiliar(true);
    final response = await _useCase.getListIdSimiliarClass(
        _detailCourse.value.categories.isEmpty
            ? "0"
            : _detailCourse.value.categories[0].id.toString());
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _fetchSimiliarClass(data),
    );
  }

  void _fetchSimiliarClass(List<String> listId) async {
    final response = await _useCase.getSimiliarClass(listId);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) {
        _similiarClass.value = data;
        _similiarClass
            .removeWhere((e) => e.course.id == _detailCourse.value.id);
      },
    );

    await _changeLoadingSimiliar(false);
  }

  void removeFromFavorite(BuildContext context) async {
    final response = await _useCase.removeFromFavorite(
        detailCourse.value.id.toString(), _token.value);
    response.fold((l) => ExceptionHandle.execute(l), (r) {
      ScaffoldMessenger.of(context).showSnackBar(
          ArkAppDialog.defaultSnackbarWithAction(
              'Berhasil menghapus kelas ${_detailCourseRevamp.value.data[0].course?.name ?? ""} kedalam wishlist',
              'Lihat',
              () {}));
      return isFav.value = r;
    });
  }

  void addToFavorite(BuildContext context) async {
    final response = await _useCase.addToFavorite(
        _detailCourse.value.id.toString(), _token.value);
    response.fold((l) => ExceptionHandle.execute(l), (r) {
      ScaffoldMessenger.of(context).showSnackBar(
          ArkAppDialog.defaultSnackbarWithAction(
              'Berhasil menambahkan kelas ${_detailCourseRevamp.value.data[0].course?.name ?? ""} kedalam wishlist',
              'Lihat',
              () {}));
      return isFav.value = r;
    });
  }

  void onPrevUlasan() {
    _ratingPage.value--;
    fetchUlasan(_ratingPage.value);
  }

  void onNextUlasan() {
    _ratingPage.value++;
    fetchUlasan(_ratingPage.value);
  }
}
