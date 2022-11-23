import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/services/firebase_analytics.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:ark_module_course/utils/app_constanta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArkLowonganKerjaSectionJrc extends StatelessWidget {
  final _arkCourseC = Get.find<ArkCourseController>();
  final isLoading = false.obs;

  ArkLowonganKerjaSectionJrc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Sumber: ',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 13,
                      color: kNewBlack3),
                ),
                Image.asset(
                  'assets/images/job_ready_course/logo_relasio.png',
                  fit: BoxFit.fill,
                  height: 15,
                )
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Relasio adalah situs lowongan kerja dan platform edukasi untuk jaringan kerja profesional.',
              style: TextStyle(
                  fontFamily: 'SourceSansPro', color: kNewBlack2b, height: 1.4),
            ),
            ListView.builder(
                itemCount:
                    _arkCourseC.detailCourseJRC.value.data.daftarLoker.length,
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.only(top: 20),
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () {
                      AppFirebaseAnalyticsService()
                          .addLog('mbl_prj_jrc_p1_click_card_loker1');
                      Get.to(() => SafeArea(
                            child: Stack(
                              children: [
                                WebView(
                                  onPageFinished: (_) {
                                    isLoading.value = false;
                                  },
                                  initialUrl: _arkCourseC.detailCourseJRC.value
                                      .data.daftarLoker[i].urlJobs,
                                  javascriptMode: JavascriptMode.unrestricted,
                                ),
                                Obx(() => isLoading.value == true
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Container())
                              ],
                            ),
                          ));
                    },
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 20),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  height: 50,
                                  width: 50,
                                  child: Obx(
                                    () => Image.network(_arkCourseC
                                        .detailCourseJRC
                                        .value
                                        .data
                                        .daftarLoker[i]
                                        .logoCompany),
                                  )),
                              const SizedBox(width: 7),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Html(
                                      data: _arkCourseC.detailCourseJRC.value
                                          .data.daftarLoker[i].position,
                                      style: {
                                        'html': Style(
                                            margin: EdgeInsets.zero,
                                            padding: EdgeInsets.zero,
                                            color: kNewBlack2a,
                                            fontFamily: 'SourceSansPro',
                                            fontWeight: FontWeight.w700)
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _arkCourseC
                                                .detailCourseJRC
                                                .value
                                                .data
                                                .daftarLoker[i]
                                                .companyName,
                                            style: const TextStyle(
                                              color: kNewBlack2b,
                                              fontSize: 12.5,
                                              fontFamily: 'SourceSansPro',
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/job_ready_course/logo_briefcase.png',
                                                fit: BoxFit.fill,
                                                width: 13,
                                              ),
                                              const SizedBox(width: 5),
                                              const Text(
                                                'Entry Level',
                                                style: TextStyle(
                                                    fontFamily: 'SourceSansPro',
                                                    color: kNewBlack2b,
                                                    fontSize: 12.5,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 3),
                                          if (_arkCourseC
                                                      .detailCourseJRC
                                                      .value
                                                      .data
                                                      .daftarLoker[i]
                                                      .minGaji !=
                                                  '0' ||
                                              _arkCourseC
                                                      .detailCourseJRC
                                                      .value
                                                      .data
                                                      .daftarLoker[i]
                                                      .maxGaji !=
                                                  '0')
                                            Text(
                                              'Rp. ${numberFormat.format(int.parse(_arkCourseC.detailCourseJRC.value.data.daftarLoker[i].minGaji))} - Rp. ${numberFormat.format(int.parse(_arkCourseC.detailCourseJRC.value.data.daftarLoker[i].maxGaji))}',
                                              style: const TextStyle(
                                                  color: kNewBlack2b,
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 14.5,
                                                  fontWeight: FontWeight.w600),
                                            )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ),
                  );
                }),
            SizedBox(height: Get.height * 0.015),
            GestureDetector(
              onTap: () {
                AppFirebaseAnalyticsService()
                    .addLog('mbl_prj_jrc_p1_click_lihat_loker_all');
                Get.to(() => SafeArea(
                      child: Stack(
                        children: [
                          WebView(
                            onPageFinished: (_) {
                              isLoading.value = false;
                            },
                            initialUrl:
                                'https://www.relasio.com/search?page=1&query=${_arkCourseC.detailCourseJRC.value.data.subCategory}',
                            javascriptMode: JavascriptMode.unrestricted,
                          ),
                          Obx(() => isLoading.value == true
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Container())
                        ],
                      ),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lihat lebih banyak lowongan ${_arkCourseC.detailCourseJRC.value.data.subCategory}',
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SourceSansPro',
                      color: kPrimaryColorBrighter,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    FontAwesomeIcons.arrowRight,
                    color: kPrimaryColorBrighter,
                    size: 11.5,
                  )
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.065),
          ],
        ));
  }
}
