import 'dart:developer';

import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/ark_kurikulum_sction_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/ark_lowongan_kerja_section_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/ark_ulasan_section_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/ark_info_kursus_section_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_lowongan_karir_tab_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_tab_title_jrc.dart';
import 'package:ark_module_course/utils/app_color.dart';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ArkCourseJrcPage extends StatelessWidget {
  ArkCourseJrcPage({Key? key}) : super(key: key);

  final _courseC = Get.find<ArkCourseController>();

  @override
  Widget build(BuildContext context) {
    // FOR SUBSTRACT GAJI
    String? substractGaji(String gaji) {
      //kalo satu digit
      if (gaji.length == 7) {
        final a = gaji.replaceRange(2, gaji.length, '');
        //gak ada koma contoh : 8juta
        if (a.contains('0')) {
          final zzz = a.replaceAll('0', '');
          return zzz;
          //ada komanya contoh :4.5 juta
        } else {
          final zz = a.split('');
          return ('${zz[0]}.${zz[1]}');
        }

        //kalo gaji dua digit
      } else if (gaji.length == 8) {
        final a = gaji.replaceRange(3, gaji.length, '');
        //gak ada koma contoh : 12 juta
        if (a.contains('0')) {
          final zzz = a.replaceRange(2, a.length, '');
          return zzz;
          //ada komanya contoh :12.5 juta
        } else {
          final zz = a.split('');
          return ('${zz[0]}${zz[1]}.${zz[2]}');
        }
      } else if (gaji.length == 9) {
        final a = gaji.replaceRange(4, gaji.length, '');
        //gak ada koma contoh : 200 juta
        if (a.contains('0')) {
          final zzz = a.replaceRange(3, a.length, '');
          return zzz;
          //ada komanya contoh :200.5 juta
        } else {
          final zz = a.split('');
          return ('${zz[0]}${zz[1]}.${zz[2]}');
        }
      }
      return '0';
    }

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          'Kelas',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.centerRight,
              begin: Alignment.centerLeft,
              colors: [
                Color(0xFF139DD6),
                Color(0xFF0977BE),
              ],
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Share.share(
                  'Ikuti kelas ${_courseC.detailCourse.value.name} di Arkademi https://arkademi.com/course/${_courseC.detailCourse.value.courseSlug}');
            },
            child: Image.asset(
              'assets/images/job_ready_course/share.png',
              height: 20,
              width: 20,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          InkWell(
            onTap: () {
              if (_courseC.isFav.value) {
                _courseC.removeFromFavorite(context);
              } else {
                log(_courseC.token.value);
                _courseC.addToFavorite(context);
              }
              // mixpanel!.getPeople().append(
              //     "Wishlist",
              //     _courseC.detailCourseRevamp.value.data[0].course!.id
              //         .toString());
              // if (_lcC.isFav.value) {
              //   _lcC.removeFromWishlist(
              //       _courseC.detailCourse.value.id
              //           .toString(),
              //       context);
              // } else {
              //   _lcC.addToWishlist(
              //       _courseC.detailCourse.value.id
              //           .toString(),
              //       context);
              // }
              // mixpanel!.getPeople().append(
              //     "Wishlist",
              //     _courseC.detailCourse.value.id
              //         .toString());
            },
            child: const Icon(
              CupertinoIcons.heart,
              color: Colors.white,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: ConnectivityWidgetWrapper(
        offlineCallback: () {},
        onlineCallback: () {},
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Obx(
                () => Column(
                  children: [
                    _courseC.isHaveVideo.value && _courseC.splitVid.length > 1
                        ? YoutubePlayerIFrame(
                            controller: _courseC.ytController,
                            aspectRatio: 16 / 9,
                          )
                        : Image.network(
                            _courseC.detailCourse.value.featuredImage,
                            width: Get.size.width,
                            fit: BoxFit.fitWidth,
                          ),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/job_ready_course/class_page_background_long.png'),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 3, bottom: 4, left: 7.5, right: 7.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 206, 164, 57),
                                    Color(0xFFEEE4AA),
                                    Color(0xFFFAF7C9),
                                    Color.fromARGB(255, 206, 164, 57),
                                  ],
                                ),
                              ),
                              child: const Text(
                                'JOB READY COURSE',
                                style: TextStyle(
                                  letterSpacing: 0.1,
                                  fontSize: 9.3,
                                  fontWeight: FontWeight.bold,
                                  color: kNewBlack1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _courseC.detailCourse.value.name,
                              maxLines: 3,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              style: TextStyle(
                                  height: 1.3,
                                  fontSize:
                                      Get.size.shortestSide < 600 ? 16 : 19,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  ArkRowWithWidgetAndString(
                                    leftWidget: Padding(
                                      padding: const EdgeInsets.only(bottom: 1),
                                      child: RatingBar.builder(
                                        itemSize: Get.size.shortestSide < 600
                                            ? 12.5
                                            : 18,
                                        ignoreGestures: true,
                                        initialRating: 5,
                                        // _courseC.detailCourse
                                        //             .value.averageRating ==
                                        //         '0'
                                        //     ? 5.0
                                        // : double.parse(_courseC.detailCourse
                                        //     .value.averageRating),
                                        allowHalfRating: true,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 0.8),
                                        itemBuilder: (context, _) =>
                                            Image.asset(
                                          'assets/images/job_ready_course/star_yellow.png',
                                          fit: BoxFit.fill,
                                        ),
                                        onRatingUpdate: (_) {},
                                      ),
                                    ),
                                    rightString: _courseC.detailCourse.value
                                                .averageRating ==
                                            '0'
                                        ? '5'
                                        : _courseC
                                            .detailCourse.value.averageRating,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: ArkRowWithWidgetAndString(
                                      leftWidget: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: Get.size.shortestSide < 600
                                            ? 16
                                            : 20,
                                      ),
                                      rightString: _courseC.detailCourse.value
                                                  .totalStudents <
                                              4
                                          ? '3 siswa'
                                          : '${_courseC.detailCourse.value.totalStudents} siswa',
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.35,
                                    child: ArkRowWithWidgetAndString(
                                      expandedRightString: false,
                                      leftWidget: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                            _courseC.detailCourse.value
                                                .instructor.avatar.url,
                                            width: 15,
                                            height: 15),
                                      ),
                                      rightString: _courseC
                                          .detailCourse.value.instructor.name,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // _courseC.detailCourse.value
                            //         .peluangKarir!.isEmpty
                            //     ? const SizedBox()
                            //     :
                            Card(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Level: Pemula',
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromRGBO(
                                                131, 133, 137, 1)),
                                      ),
                                      const SizedBox(height: 10),

                                      // if (_lcC.detailClass.value.data![0]
                                      //     .course!.peluangKarir!.isNotEmpty)
                                      //   PeluangKarirJrc(
                                      //     listUsed: _lcC.detailClass.value
                                      //         .data![0].course!.peluangKarir!,
                                      //   ),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: SvgPicture.asset(
                                                  'assets/svg/cv.svg',
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Expanded(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${_courseC.detailCourseJRC.value.data.totalLowongan} Lowongan',
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color:
                                                              Color(0xff121315),
                                                          fontFamily:
                                                              'SourceSansPro',
                                                          height: 1.5,
                                                        ),
                                                        maxLines: 3,
                                                      ),
                                                      Text(
                                                        'Lowongan yang tersedia untuk posisi ${_courseC.detailCourseJRC.value.data.subCategory} dalam 3 hari',
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              'SourceSansPro',
                                                          fontSize: 11,
                                                          color:
                                                              Color(0xFF5A5C60),
                                                          height: 1.5,
                                                        ),
                                                        maxLines: 3,
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: SvgPicture.asset(
                                                  'assets/svg/salary.svg',
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Rp${substractGaji(_courseC.detailCourseJRC.value.data.minGaji)} - ${substractGaji(_courseC.detailCourseJRC.value.data.maxGaji)} juta',
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              'SourceSansPro',
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: kNewBlack1,
                                                          height: 1.5,
                                                        ),
                                                        maxLines: 3,
                                                      ),
                                                      Text(
                                                        'Rata-rata gaji sebagai ${_courseC.detailCourseJRC.value.data.subCategory}',
                                                        style: const TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xFF5A5C60),
                                                          height: 1.5,
                                                        ),
                                                        maxLines: 3,
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                        ],
                                      ),

                                      ///TODO: BELUM DI HANDLE
                                      // if (_courseC.detailCourse.value
                                      //     .peluangKarir.isNotEmpty)
                                      //   PeluangKarirJrc(
                                      //     listUsed: _lcC.detailClass.value
                                      //         .data![0].course!.peluangKarir!,
                                      //   ),

                                      // Column(
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.start,
                                      //   children: [
                                      //     Row(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.start,
                                      //       children: [
                                      //         Padding(
                                      //           padding: const EdgeInsets.only(
                                      //               top: 7),
                                      //           child: SvgPicture.asset(
                                      //             'assets/svg/cv.svg',
                                      //           ),
                                      //         ),
                                      //         const SizedBox(
                                      //           width: 12,
                                      //         ),
                                      //         Expanded(
                                      //           child: Column(
                                      //               crossAxisAlignment:
                                      //                   CrossAxisAlignment
                                      //                       .start,
                                      //               children: const [
                                      //                 ///TODO: BELUM DIHANDLE
                                      //                 // AppText.labelW700(
                                      //                 //   '${_lcC.jrc.value.data!.totalLowongan} Lowongan',
                                      //                 //   familiy:
                                      //                 //       'SourceSansPro',
                                      //                 //   13,
                                      //                 //   kNewBlack1,
                                      //                 //   maxLines: 3,
                                      //                 //   height: 1.5,
                                      //                 // ),
                                      //                 // AppText.labelW400(
                                      //                 //   'Lowongan yang tersedia untuk posisi ${_lcC.jrc.value.data!.subCategory} dalam 3 hari',
                                      //                 //   familiy:
                                      //                 //       'SourceSansPro',
                                      //                 //   11,
                                      //                 //   const Color(0xFF5A5C60),
                                      //                 //   maxLines: 3,
                                      //                 //   height: 1.5,
                                      //                 // ),
                                      //               ]),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     const SizedBox(
                                      //       height: 8,
                                      //     ),
                                      //     Row(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.start,
                                      //       children: [
                                      //         Padding(
                                      //           padding: const EdgeInsets.only(
                                      //               top: 7),
                                      //           child: SvgPicture.asset(
                                      //             'assets/svg/salary.svg',
                                      //           ),
                                      //         ),
                                      //         const SizedBox(
                                      //           width: 10,
                                      //         ),
                                      //         Expanded(
                                      //           child: Column(
                                      //               crossAxisAlignment:
                                      //                   CrossAxisAlignment
                                      //                       .start,
                                      //               children: const [
                                      //                 ///TODO: BELUM DIHANDLE
                                      //                 // AppText.labelW700(
                                      //                 //   'Rp${substractGaji(_lcC.jrc.value.data!.minGaji!)} - ${substractGaji(_lcC.jrc.value.data!.maxGaji!)} juta',
                                      //                 //   familiy:
                                      //                 //       'SourceSansPro',
                                      //                 //   13,
                                      //                 //   kNewBlack1,
                                      //                 //   maxLines: 3,
                                      //                 //   height: 1.5,
                                      //                 // ),
                                      //                 // AppText.labelW400(
                                      //                 //   'Rata-rata gaji sebagai ${_lcC.jrc.value.data!.subCategory}',
                                      //                 //   familiy:
                                      //                 //       'SourceSansPro',
                                      //                 //   11,
                                      //                 //   const Color(0xFF5A5C60),
                                      //                 //   maxLines: 3,
                                      //                 //   height: 1.5,
                                      //                 // ),
                                      //               ]),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     const SizedBox(
                                      //       height: 12,
                                      //     ),
                                      //   ],
                                      // ),

                                      // if (_courseC.detailCourse.value
                                      //     .ygAkanDipelajariWeb!.isNotEmpty)
                                      //   CardWithIconForDescription(
                                      //       'Yang Akan Dipelajari',
                                      //       _courseC.detailCourse.value
                                      //           .ygAkanDipelajariWeb),
                                      // const SizedBox(height: 22),
                                      // if (_courseC.detailCourse.value
                                      //     .skillYgAkanDiperolehWeb!.isNotEmpty)
                                      //   CardForDescription(
                                      //       'Skill yang Akan Diperoleh',
                                      //       _courseC.detailCourse.value
                                      //           .skillYgAkanDiperolehWeb!,
                                      //       kNewBlack6)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverStickyHeader(
              header: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                margin: EdgeInsets.zero,
                elevation: 2,
                child: Row(children: [
                  ArkTabTitleJrc(
                    tabIndex: _courseC.tabIndexJrc,
                    indexCondition: 0,
                    title: 'Info Kursus',
                  ),
                  ArkTabTitleJrc(
                    tabIndex: _courseC.tabIndexJrc,
                    indexCondition: 1,
                    title: 'Kurikulum',
                  ),
                  ArkTabTitleJrc(
                    tabIndex: _courseC.tabIndexJrc,
                    indexCondition: 2,
                    title: 'Ulasan',
                  ),
                  Expanded(
                    child: ArkLowonganKarirTabJrc(
                      indexCondition: 3,
                      tabIndex: _courseC.tabIndexJrc,
                    ),
                  )
                ]),
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  color: kCanvasColor,
                  // padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: Get.width,
                  child: Obx(() {
                    if (_courseC.tabIndexJrc.value == 0) {
                      return ArkInfoKursusSectionJrc();
                    } else if (_courseC.tabIndexJrc.value == 1) {
                      return ArkKurikulumSectionJrc();
                      // return Center(
                      //   child: Text('KURIKULUM SECTION'),
                      // );
                    } else if (_courseC.tabIndexJrc.value == 2) {
                      return ArkUlasanSectionJrc();
                      // return Center(
                      //   child: Text('ULASAN SECTION'),
                      // );
                    } else {
                      return ArkLowonganKerjaSectionJrc();
                      // return Center(
                      //   child: Text('LOWONGAN SECTION'),
                      // );
                    }
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
