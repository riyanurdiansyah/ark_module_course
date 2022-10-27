import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ArkCourseController extends GetxController {
  final ArkCourseUseCase _useCase = ArkCourseUseCase(
      ArkCourseRepositoryImpl(ArkCourseRemoteDataSourceImpl()));
  final Rx<CourseDataEntity> _detailCourse = CourseDataEntity(
      status: "",
      averageRating: "",
      courseSlug: "",
      description: "",
      descriptionInstruktur: "",
      enableFaceRecog: 0,
      featuredImage: "",
      id: 0,
      iosPrice: "0",
      name: "",
      price: "0",
      regularPrice: "0",
      salePrice: "0",
      totalStudents: 0,
      instructor: const InstructorEntity(
          id: "", name: "", avatar: AvatarEntity(url: ""), sub: ""),
      coinCashback: "0",
      discount: 0.0,
      courseFlag: CourseFlagEntity(
          whatsapp: "", prakerja: "", revamp: "", jrc: "", group: ""),
      mpLinks: const [],
      peluangKarir: const []).obs;
  Rx<CourseDataEntity> get detailCourse => _detailCourse;

  final Rx<bool> _isLoading = true.obs;
  Rx<bool> get isLoading => _isLoading;

  final Rx<bool> _isLoadingUserStatus = true.obs;
  Rx<bool> get isLoadingUserStatus => _isLoadingUserStatus;

  final Rx<bool> _isLoadingCurriculums = true.obs;
  Rx<bool> get isLoadingCurriculums => _isLoadingCurriculums;

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

  final Rx<CourseJrcEntity> _detailCourseJRC = CourseJrcEntity(
    success: false,
    data: CourseJrcDataEntity(
      courseId: "",
      subCategory: "",
      subjudul: "",
      sasaran: [],
      hardSkill: [],
      softSkill: [],
      sertiPenyelesaian: "",
      sertiKelulusan: "",
      totalLowongan: 0,
      maxGaji: "0",
      minGaji: "0",
      fasilitator: FasilitatorJrcEntity(
        userId: "",
        name: "",
        avatar: "",
        namaPerusahaan: "",
        deskripsi: "",
        instagram: "",
        linkedin: "",
      ),
      instruktur: [],
      daftarLoker: [],
    ),
  ).obs;

  final Rx<int> _indexTabCourse = 0.obs;
  Rx<int> get indexTabCourse => _indexTabCourse;

  final Rx<CurriculumEntity> _curriculum =
      CurriculumEntity(success: false, data: []).obs;
  Rx<CurriculumEntity> get curriculum => _curriculum;

  final Rx<UserStatusEntity> _userStatus = UserStatusEntity(
          userId: 0, userStatus: "", userExpiry: "", isExpired: false)
      .obs;
  Rx<UserStatusEntity> get userStatus => _userStatus;

  late YoutubePlayerController ytController;

  @override
  void onInit() async {
    await _setup();
    if (_detailCourse.value.courseFlag.jrc == "1") {
      _getCourseDetailJRC();
    }
    fetchUserStatus();
    fetchCurriculums();
    await _changeLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    ytController.close();
    super.onClose();
  }

  Future _getCourseDetailJRC() async {
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
    _prefs = await SharedPreferences.getInstance();
    _token.value = _prefs.getString('token_access') ?? '';
    _isLogin.value = _prefs.getBool('user_login') ?? false;
    if (Get.arguments != null) {
      _detailCourse.value = Get.arguments;
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

  Future _changeLoading(bool val) async {
    _isLoading.value = val;
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
      (data) => _userStatus.value = data,
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
      (data) => _curriculum.value = data,
    );
    await _changeLoadingCurriculum(false);
  }
}
