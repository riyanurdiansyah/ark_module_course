import 'dart:developer';

import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/services/firebase_analytics.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_revamp/widgets/ark_faq_course_revamp.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_revamp/widgets/ark_ikhtisar_course_revamp.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_revamp/widgets/ark_kurikulum_course_revamp.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_revamp/widgets/ark_ulasan_course_revamp.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_button_reusable.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_mini_app_bar.dart';
import 'package:ark_module_course/utils/app_constanta.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../utils/app_color.dart';

class ArkCourseRevamp extends StatefulWidget {
  final bool isFlashSale;
  final String? slug;
  final bool? useGetBack;
  const ArkCourseRevamp(
      {this.isFlashSale = false,
      this.slug = 'course-revamp',
      this.useGetBack = false,
      Key? key})
      : super(key: key);

  @override
  State<ArkCourseRevamp> createState() => _ArkCourseRevampState();
}

class _ArkCourseRevampState extends State<ArkCourseRevamp>
    with SingleTickerProviderStateMixin {
  final _arkCC = Get.find<ArkCourseController>();
  // final _spfC = Get.put(SpfController());
  late TabController _tabController;
  final key1 = GlobalKey();

  Mixpanel? mixpanel = Mixpanel('da7470a04f3b091c8a1860f0b1f52956');
  YoutubePlayerController? ytController;
  bool playedYoutube = false;

  @override
  void initState() {
    super.initState();
    _arkCC.tabIndexRevamp.value = 0;
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    // FOR GET SISWA
    String getSiswa(int mySiswa) {
      if (mySiswa > 1000) {
        return '> 1,000';
      } else {
        var format = NumberFormat("#,###").format(mySiswa);
        return format;
      }
    }

    // FOR HEMAT PRICE
    int? hematPrice(int price, int regularPrice) {
      log('price is $price && regularPrice is $regularPrice');
      int? tempPrice;
      if (price != regularPrice && price > regularPrice) {
        tempPrice = price - regularPrice;
      } else {
        log('something wrong with price');
      }
      return tempPrice;
    }

    return Obx(
      () {
        if (_arkCC.isLoading.value == true) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (_arkCC.checkVideoOrImage == true) {
            ytController = YoutubePlayerController(
                initialVideoId: _arkCC.splitVid[0],
                params: const YoutubePlayerParams(
                  autoPlay: false,
                  mute: false,
                  showControls: false,
                  showFullscreenButton: false,
                ));

            ytController!.listen((event) {
              if (event.playerState == PlayerState.playing) {
                playedYoutube = true;
                log(event.position.inSeconds.toString());
              }
              if (event.playerState == PlayerState.paused) {
                AppFirebaseAnalyticsService().addLogWithParam(
                    'thumbnail_video_click_duration',
                    {'seconds:': '${event.position.inSeconds}'});
              }
            });
            if (playedYoutube = true) {
              AppFirebaseAnalyticsService().addLog('thumbnail_video_click');
            }
          }
          if (widget.slug == 'resultJobCourseMatch') {
            AppFirebaseAnalyticsService().addCurrentScreen(
                "course_page_jcm_${_arkCC.detailCourseRevamp.value.data[0].course!.name}");
            // } else {
            //   AppFirebaseAnalyticsService().addCurrentScreen(
            //       "course_page_${_arkCC.detailCourseRevamp.value.data[0].course!.name}");
            // }
          }

          // mixpanel
          // mixpanel!.track('Page View', properties: {
          //   'Page Name': 'Course Page',
          //   'Course Name': _arkCC.detailCourseRevamp.value.data[0].course!.name
          // });
          // log('TEST STATUS : ${_arkCC.userStatus.value.userStatus}');
          // log(
          //     'TEST COIN FLAG : ${_arkCC.detailCourseRevamp.value.data![0].course!.coin!.coinFlag}');

          // if (_arkCC.userStatus.value.userStatus == '') {
          //   Future.delayed(Duration.zero, () async {
          //     final _listFlag = await DBHelper.getTablePopUpCoin(
          //       'popup_coin',
          //       [
          //         'id_user',
          //         'tag',
          //       ],
          //     );
          //     log("LIST FLAG : $_listFlag");
          //     log(
          //         'TEST FLAG LENG : ${_listFlag.where((e) => e['tag'] == 'course').toList().length}');
          //     if (_listFlag
          //         .where((e) => e['tag'] == 'course')
          //         .toList()
          //         .isEmpty) {
          //       WidgetsBinding.instance.addPostFrameCallback(
          //         (_) => ArkaShowCaseWidget.of(context)!.startShowCase([key1]),
          //       );
          //     }
          //   });
          // }
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(Get.size.width, 50),
              child: MiniAppBarReusableWidgets(
                isGradient: true,
                padding: const EdgeInsets.only(
                  bottom: 15,
                  top: 15,
                  left: 17.5,
                ),
                onTapBackIcon: () {
                  // if (widget.slug != '' || widget.useGetBack == true) {
                  //   Get.back();
                  // } else {
                  //   Get.offAllNamed(AppRouteName.main);
                  // }
                  Get.back();
                },
                backIcon: Icons.arrow_back_sharp,
                iconColor: Colors.white,
                sizeBackIcon: 14,
                rightIcon: const Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                  size: 17,
                ),
                onTapRigthIcon: () {
                  // Share.share(
                  //     'Ikuti kelas ${_arkCC.detailClassCourseRevamp.value.data![0].course!.name} di Arkademi https://arkademi.com/course/${_arkCC.detailClassCourseRevamp.value.data![0].course!.courseSlug}');
                  // log('right icon');
                },
                gradientColor: const [
                  Color(0xff139DD6),
                  Color(0xff0977BE),
                ],
                beginGradient: Alignment.centerLeft,
                endGradient: Alignment.centerRight,
                title: 'Kursus',
                titleTextStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                isLeading: true,
              ),
            ),
            body: ConnectivityWidgetWrapper(
              offlineCallback: () {
                log('offline boskuuu');
              },
              onlineCallback: () {
                log('online boskuuu');
              },
              child: _arkCC.detailCourseRevamp.value.data.isEmpty
                  ? const Center(
                      child: Text('Oopps.. Something Wrong'),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              log('play');
                            },
                            child: SizedBox(
                              width: Get.size.width,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: Get.size.width,
                                    child: _arkCC.isHaveVideo() == true
                                        ? _arkCC.splitVid.length > 1
                                            ? YoutubePlayerIFrame(
                                                controller: ytController,
                                                aspectRatio: 16 / 9,
                                              )
                                            : CachedNetworkImage(
                                                imageUrl: _arkCC
                                                    .detailCourseRevamp
                                                    .value
                                                    .data[0]
                                                    .course!
                                                    .featuredImage!,
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const SizedBox(),
                                              )
                                        : CachedNetworkImage(
                                            imageUrl: _arkCC
                                                .detailCourseRevamp
                                                .value
                                                .data[0]
                                                .course!
                                                .featuredImage!,
                                            errorWidget:
                                                (context, url, error) =>
                                                    const SizedBox(),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: Get.size.width,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/class_page_background.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 21,
                                    right: 21,
                                    top: 21,
                                    bottom: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          _arkCC.courseRevamp.value.data
                                              .kategoriUtama,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff1B91D9),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        _arkCC.courseRevamp.value.data.judul,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      _arkCC.courseRevamp.value.data.subJudul ==
                                              ""
                                          ? const SizedBox()
                                          : Text(
                                              _arkCC.courseRevamp.value.data
                                                  .subJudul,
                                              style: const TextStyle(
                                                fontSize: 11.5,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffE5F4FD),
                                                height: 1.5,
                                              ),
                                            ),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      _arkCC.courseRevamp.value.data.rating
                                                  .rating ==
                                              ""
                                          ? ArkRowWithWidgetAndString(
                                              leftWidget: RatingBar.builder(
                                                itemSize:
                                                    Get.size.shortestSide < 600
                                                        ? 14.5
                                                        : 20,
                                                ignoreGestures: true,
                                                initialRating: _arkCC
                                                            .detailCourseRevamp
                                                            .value
                                                            .data[0]
                                                            .course!
                                                            .averageRating! ==
                                                        '0'
                                                    ? 4.8
                                                    : double.parse(_arkCC
                                                            .detailCourseRevamp
                                                            .value
                                                            .data[0]
                                                            .course!
                                                            .averageRating!)
                                                        .ceil()
                                                        .toDouble(),
                                                allowHalfRating: true,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0.2),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Color(0xffFFE70E),
                                                ),
                                                onRatingUpdate: (_) {},
                                              ),
                                              rightString: _arkCC
                                                          .detailCourseRevamp
                                                          .value
                                                          .data[0]
                                                          .course!
                                                          .averageRating! ==
                                                      '0'
                                                  ? '5'
                                                  : _arkCC
                                                      .detailCourseRevamp
                                                      .value
                                                      .data[0]
                                                      .course!
                                                      .averageRating!)
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ArkRowWithWidgetAndString(
                                                  leftWidget: RatingBar.builder(
                                                    itemSize:
                                                        Get.size.shortestSide <
                                                                600
                                                            ? 14.5
                                                            : 20,
                                                    ignoreGestures: true,
                                                    initialRating: double.parse(
                                                                _arkCC
                                                                    .courseRevamp
                                                                    .value
                                                                    .data
                                                                    .rating
                                                                    .rating) ==
                                                            double.parse('0')
                                                        ? 5.0
                                                        : double.parse(_arkCC
                                                            .courseRevamp
                                                            .value
                                                            .data
                                                            .rating
                                                            .rating),
                                                    allowHalfRating: true,
                                                    itemPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 0.2),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      color: Color(0xffFFE70E),
                                                    ),
                                                    onRatingUpdate: (_) {},
                                                  ),
                                                  rightString: _arkCC
                                                              .courseRevamp
                                                              .value
                                                              .data
                                                              .rating
                                                              .rating ==
                                                          '0'
                                                      ? '5'
                                                      : _arkCC
                                                          .courseRevamp
                                                          .value
                                                          .data
                                                          .rating
                                                          .rating,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child:
                                                      ArkRowWithWidgetAndString(
                                                          leftWidget: Icon(
                                                            Icons.person,
                                                            color: Colors.white,
                                                            size:
                                                                Get.size.shortestSide <
                                                                        600
                                                                    ? 16
                                                                    : 20,
                                                          ),
                                                          rightString:
                                                              '${getSiswa(int.parse(_arkCC.courseRevamp.value.data.rating.jmlMurid))} siswa'),
                                                ),
                                                _arkCC.courseRevamp.value.data
                                                                .fasilitatorAtas ==
                                                            "" ||
                                                        _arkCC
                                                                .courseRevamp
                                                                .value
                                                                .data
                                                                .fasilitatorAtas ==
                                                            ""
                                                    ? ArkRowWithWidgetAndString(
                                                        expandedRightString:
                                                            true,
                                                        leftWidget: Image.network(
                                                            _arkCC
                                                                .detailCourseRevamp
                                                                .value
                                                                .data[0]
                                                                .course!
                                                                .instructor!
                                                                .avatar
                                                                .url,
                                                            width: 15,
                                                            height: 15),
                                                        rightString: _arkCC
                                                            .detailCourseRevamp
                                                            .value
                                                            .data[0]
                                                            .course!
                                                            .instructor!
                                                            .name,
                                                      )
                                                    : ArkRowWithWidgetAndString(
                                                        expandedRightString:
                                                            false,
                                                        leftWidget: _arkCC
                                                                    .courseRevamp
                                                                    .value
                                                                    .data
                                                                    .fasilitatorAtas ==
                                                                'ARKADEMI'
                                                            ? ClipOval(
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(3),
                                                                  color: Colors
                                                                      .white,
                                                                  child: Image.asset(
                                                                      'assets/images/arkademi-icon.png',
                                                                      width: 15,
                                                                      height:
                                                                          15),
                                                                ),
                                                              )
                                                            : ClipOval(
                                                                child:
                                                                    Container(
                                                                  width: 15,
                                                                  height: 15,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              ),
                                                        rightString: _arkCC
                                                            .courseRevamp
                                                            .value
                                                            .data
                                                            .fasilitatorAtas,
                                                      ),
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.size.width,
                            child: TabBar(
                              onTap: (int index) {
                                _arkCC.tabIndexRevamp.value = index;
                              },
                              controller: _tabController,
                              labelColor: kNewBlack1,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Get.size.width > 411 ? 12 : 10,
                                fontFamily: 'Montserrat',
                                overflow: TextOverflow.fade,
                              ),
                              indicatorWeight: 3,
                              unselectedLabelColor: kNewBlack3,
                              indicatorColor: const Color(0xff0977BE),
                              unselectedLabelStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Get.size.width > 411 ? 12 : 10,
                                overflow: TextOverflow.fade,
                              ),
                              tabs: const [
                                Tab(text: "Ikhtisar"),
                                Tab(text: "Kurikulum"),
                                Tab(text: "Ulasan"),
                                Tab(text: "FAQ"),
                              ],
                            ),
                          ),
                          Container(
                            color: kCanvasColor,
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            width: Get.size.width,
                            child: Obx(() {
                              if (_arkCC.tabIndexRevamp.value == 0) {
                                return const ArkIkhtisarSectionCourseRevamp();
                              } else if (_arkCC.tabIndexRevamp.value == 1) {
                                return ArkKurikulumSectionCourseRevamp();
                              } else if (_arkCC.tabIndexRevamp.value == 2) {
                                return const ArkUlasanSectionCouseRevamp();
                              } else {
                                return ArkFaqSectionCourseRevamp();
                              }
                            }),
                          ),
                          Container(
                            color: kCanvasColor,
                            child: Column(
                              children: const [
                                // TitleWithHorizontalSimiliarClass(
                                //     listOfCard: _arkCC.similiarClass,
                                //     title: 'Kelas Serupa'),
                                // const SizedBox(height: 50)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            bottomNavigationBar: Obx(() {
              if (_arkCC.isLoading.isTrue) {
                return const SizedBox();
              }
              return Container(
                width: Get.size.width,
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 17,
                  left: 17,
                  right: 17,
                ),
                decoration: BoxDecoration(
                  color: kCanvasColor,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff1C1D20).withOpacity(0.1),
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 145,
                          child: Column(
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  name: 'Rp ',
                                  decimalDigits: 0,
                                ).format(int.parse(_arkCC.detailCourseRevamp
                                    .value.data[0].course!.price!)),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff121315),
                                ),
                              ),
                              _arkCC.detailCourseRevamp.value.data[0].course!
                                          .price ==
                                      _arkCC.detailCourseRevamp.value.data[0]
                                          .course!.regularPrice
                                  ? const SizedBox()
                                  : Container(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        NumberFormat.currency(
                                          locale: 'id',
                                          name: 'Rp ',
                                          decimalDigits: 0,
                                        ).format(
                                          int.parse(_arkCC
                                              .detailCourseRevamp
                                              .value
                                              .data[0]
                                              .course!
                                              .regularPrice!),
                                        ),
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffEC173D),
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Color(0xffEC173D),
                                          decorationThickness: 1,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        _arkCC.detailCourseRevamp.value.data[0].course!.price ==
                                _arkCC.detailCourseRevamp.value.data[0].course!
                                    .regularPrice
                            ? const SizedBox()
                            : Row(
                                children: [
                                  Image.asset(
                                    'assets/images/icon-money-and-love.png',
                                    width: 21,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    'Hemat ${currencyFormatter.format(int.parse(hematPrice(int.parse(_arkCC.detailCourseRevamp.value.data[0].course!.regularPrice!), int.parse(_arkCC.detailCourseRevamp.value.data[0].course!.price!)).toString()))}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff388E3C),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Material(
                          child: InkWell(
                            onTap: () {
                              if (_arkCC.isFav.value) {
                                _arkCC.removeFromFavorite(context);
                              } else {
                                log(_arkCC.token.value);
                                _arkCC.addToFavorite(context);
                              }
                              mixpanel!.getPeople().append(
                                  "Wishlist",
                                  _arkCC.detailCourseRevamp.value.data[0]
                                      .course!.id
                                      .toString());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: const Color(0xffD3D4D6),
                                ),
                              ),
                              padding: const EdgeInsets.all(14),
                              child: Center(
                                  child: Obx(() => _arkCC.isFav.value
                                      ? const Icon(
                                          CupertinoIcons.heart_fill,
                                          color: Colors.red,
                                          size: 21,
                                        )
                                      : const Icon(
                                          CupertinoIcons.heart,
                                          size: 21,
                                          color: Color(0xff333539),
                                        ))
                                  // Icon(
                                  //   Icons.favorite_outline,
                                  // size: 21,
                                  // color: Color(0xff333539),
                                  // ),
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6.5,
                        ),
                        Expanded(
                          child: ButtonReusableWidgets(
                            // width: Get.size.width,
                            isOutlinedButton: false,
                            padding: EdgeInsets.symmetric(
                              vertical: 14.5,
                              horizontal: Get.size.height < 600 ? 30 : 59,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            onPressed:
                                // _spfC.isLogin.value == true
                                //     ? () async {
                                //         // if (_arkCC.detailClassCourseRevamp.value.data![0].course!
                                //         //         .status !=
                                //         //     'publish') {
                                //         //   ScaffoldMessenger.of(context).showSnackBar(
                                //         //     AppSnackbar.defaultSnackbar(
                                //         //       'Kelas ini akan segera hadir',
                                //         //     ),
                                //         //   );
                                //         // }
                                //         // else {
                                //         if (widget.slug != '') {
                                //           mixpanel!.track('atc btn gabung coursepage',
                                //               properties: {
                                //                 'tracker number': widget.slug
                                //               });
                                //           await AppFirebaseAnalyticsService().addLog(
                                //               'atc_btnmblclickgabung_${widget.slug}_coursepage');
                                //         }
                                //         _arkCC.joinClass(
                                //             widget.isFlashSale, widget.slug!);
                                //         // Get.defaultDialog(
                                //         //   onWillPop: () async => false,
                                //         //   barrierDismissible: false,
                                //         //   title: "",
                                //         //   middleText: "",
                                //         //   content: Padding(
                                //         //     padding:
                                //         //         const EdgeInsets.only(bottom: 15),
                                //         //     child: Column(
                                //         //       children: [
                                //         //         const CircularProgressIndicator(),
                                //         //         const SizedBox(
                                //         //           height: 25,
                                //         //         ),
                                //         //         AppText.labelW600(
                                //         //           "Memuat data...",
                                //         //           14,
                                //         //           Colors.grey.shade600,
                                //         //         ),
                                //         //       ],
                                //         //     ),
                                //         //   ),
                                //         // );
                                //         // await _arkCC.fetchCourseStatus(_arkCC
                                //         //     .detailClass.value.data![0].course!.id!);
                                //         // final indexFromPrefs =
                                //         //     await _arkCC.getLastKeyUnit(_arkCC.detailClass
                                //         //         .value.data![0].course!.id!);
                                //         // log(
                                //         //     'ini index form prefs $indexFromPrefs');
                                //         // _arkCC.index.value = indexFromPrefs;
                                //         // await _arkCC.fetchCourseItem(int.parse(_arkCC
                                //         //     .courseStatus
                                //         //     .value
                                //         //     .data!
                                //         //     .courseitems![_arkCC.index.value]
                                //         //     .id!));
                                //         // Get.back();
                                //         // Get.to(
                                //         //   () => StartClassPage(),
                                //         //   arguments: {
                                //         //     'route': 'course-revamp',
                                //         //   },
                                //         // );
                                //       }
                                //     : () {
                                //         Get.to(
                                //           () => LoginPage(
                                //             routes:
                                //                 "${AppRouteName.checkout}/${_arkCC.detailClassCourseRevamp.value.data![0].course!.id}",
                                //           ),
                                //         );
                                //       },
                                () {},
                            isGradient: const LinearGradient(
                              end: Alignment.topRight,
                              begin: Alignment.bottomLeft,
                              colors: [
                                Color(0xff159FE0),
                                Color(0xff0977BE),
                              ],
                            ),
                            title:
                                // _arkCC.detailClass.value.data![0].course!
                                //             .status !=
                                //         'publish'
                                //     ? "SEGERA HADIR"
                                //     : _arkCC.isExpired.value == true
                                //         ? "Kadaluarsa"
                                //         : _arkCC.userStatus.value.userStatus == "1"
                                //             ? "Mulai Pelatihan"
                                //             : _arkCC.userStatus.value.userStatus ==
                                //                         "2" &&
                                //                     _arkCC.isExpired.value == false
                                //                 ? "Lanjutkan"
                                //                 : (_arkCC.userStatus.value.userStatus ==
                                //                                 "3" ||
                                //                             _arkCC.userStatus.value
                                //                                     .userStatus ==
                                //                                 "4") &&
                                //                         _arkCC.isExpired.value == false
                                //                     ? "Terselesaikan"
                                //                     : "IKUT SERTIFIKASI",
                                "IKUT SERTIFIKASI",
                            titleStyle: const TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          );
        }
      },
    );
  }
}
