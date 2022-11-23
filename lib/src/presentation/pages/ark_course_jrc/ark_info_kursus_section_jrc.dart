import 'dart:developer';

import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/services/firebase_analytics.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_apa_yang_didapatkan_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_cocok_untuk_kamu_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_fasilitator_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_info_kursus_body_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_informasi_kursus_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_instructor_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_kenapa_harus_belajar_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_list_of_intructor_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_sertifikat_jrc.dart';
import 'package:ark_module_course/src/presentation/pages/ark_course_jrc/widgets/ark_skill_yang_akan_diperoleh_jrc.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkInfoKursusSectionJrc extends StatelessWidget {
  final _arkCourseC = Get.find<ArkCourseController>();

  @override
  Widget build(BuildContext context) {
    log('IKHTISAR ${_arkCourseC.detailCourseRevamp.value.data[0].course!.ikhtisar!}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //yang dikotakin
        Container(
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 25,
              left: 18,
              right: 18,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(249, 252, 255, 1),
                border: Border.all(width: 0.9, color: kNewBlack5a)),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //cocok untuk kamu
                ArkCocokUntukKamu('Cocok untuk kamu',
                    _arkCourseC.detailCourseJRC.value.data.sasaran),
                const SizedBox(height: 10),

                // if (_lcC.detailClass.value.data![0].course!.peluangKarir!
                //     .isNotEmpty)
                //   PeluangKarir(
                //     peluangKarir:
                //         _lcC.detailClass.value.data![0].course!.peluangKarir!,
                //     lowongan: _lcC.detailClass.value.data![0].course!.lowongan!,
                //   ),
                // if (_lcC.detailClass.value.data![0].course!.ygAkanDipelajariWeb!
                //     .isNotEmpty)
                //   CardWithIconForDescription(
                //       'Yang Akan Dipelajari',
                //       _lcC.detailClass.value.data![0].course!
                //           .ygAkanDipelajariWeb),
                // const SizedBox(height: 22),
                if (_arkCourseC
                        .detailCourseJRC.value.data.hardSkill.isNotEmpty ||
                    _arkCourseC.detailCourseJRC.value.data.softSkill.isNotEmpty)
                  ArkSkillYangAkanDiperolehJrc(
                      title: 'Skill yang Akan Diperoleh',
                      listOfHardSkill:
                          _arkCourseC.detailCourseJRC.value.data.hardSkill,
                      listOfSoftSkill:
                          _arkCourseC.detailCourseJRC.value.data.softSkill,
                      cardColor: kNewBlack6),
                const SizedBox(height: 15),
                ArkApaYangDidapatkanJrc(),
                const SizedBox(height: 20),
                if (_arkCourseC
                        .detailCourseJRC.value.data.sertiKelulusan.isNotEmpty ||
                    _arkCourseC.detailCourseJRC.value.data.sertiPenyelesaian
                        .isNotEmpty)
                  ArkSertifikatJrc(
                    imageKompetensiUrl:
                        _arkCourseC.detailCourseJRC.value.data.sertiKelulusan,
                    imagePenyelesaianUrl: _arkCourseC
                        .detailCourseJRC.value.data.sertiPenyelesaian,
                  ),
              ],
            )),
        ArkKenapaHarusBelajarDiArkademiJrc(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArkInformasiKursusJrc(),
              const Padding(
                padding: EdgeInsets.only(left: 8, top: 20),
                child: Text(
                  'Ikhtisar',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
              ),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    _arkCourseC.isExpanded.value == true
                        ? Container()
                        : Stack(
                            children: [
                              Container(
                                height: 135,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                    _arkCourseC.detailCourseRevamp.value.data[0]
                                        .course!.ikhtisar!,
                                    style: const TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        color: kNewBlack2b,
                                        height: 1.6)),
                              ),
                              //gradient effect
                              Container(
                                height: 135,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      Colors.white12,
                                      kCanvasColor
                                    ])),
                              ),
                            ],
                          ),
                    _arkCourseC.isExpanded.value == true
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
                            child: GestureDetector(
                              onTap: () {
                                _arkCourseC.isExpanded.value = true;
                                AppFirebaseAnalyticsService()
                                    .addLog('mbl_prj_jrc_p1_click_baca_desc');
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    'Baca selengkapnya',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: kPrimaryColorBrighter,
                                        fontSize: 12.5),
                                  ),
                                  Icon(
                                    Icons.expand_more,
                                    color: kPrimaryColorBrighter,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                    _arkCourseC.isExpanded.value == false
                        ? Container()
                        : ArkInfoKursusBodyJrc(),
                    _arkCourseC.isExpanded.value == false
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
                            child: GestureDetector(
                              onTap: () => _arkCourseC.isExpanded.value = false,
                              child: Row(
                                children: const [
                                  Text(
                                    'Sembunyikan',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: kPrimaryColorBrighter,
                                        fontSize: 12.5),
                                  ),
                                  Icon(
                                    Icons.expand_less,
                                    color: kPrimaryColorBrighter,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ArkFasilitatorJrcWidget(
                imagePath:
                    _arkCourseC.detailCourseJRC.value.data.fasilitator.avatar,
                name: _arkCourseC.detailCourseJRC.value.data.fasilitator.name,
                position: _arkCourseC
                    .detailCourseJRC.value.data.fasilitator.namaPerusahaan,
                desc: _arkCourseC
                    .detailCourseJRC.value.data.fasilitator.deskripsi,
                instagramUrl: _arkCourseC
                    .detailCourseJRC.value.data.fasilitator.instagram,
                linkedinUrl:
                    _arkCourseC.detailCourseJRC.value.data.fasilitator.linkedin,
              ),
              const SizedBox(height: 10),
              _arkCourseC.detailCourseJRC.value.data.instruktur.length > 1
                  ? Column(
                      children: [
                        Obx(
                          () => _arkCourseC.isExpandedInstructor.value == true
                              ? ArkListOfInstructorJrc(
                                  listUsed: _arkCourseC
                                      .detailCourseJRC.value.data.instruktur)
                              : ArkInstructorJrcWidget(
                                  desc: _arkCourseC.detailCourseJRC.value.data
                                      .instruktur[0].descriptionInstruktur,
                                  instagramUrl: _arkCourseC
                                      .detailCourseJRC
                                      .value
                                      .data
                                      .instruktur[0]
                                      .instagramInstruktur,
                                  linkedinUrl: _arkCourseC.detailCourseJRC.value
                                      .data.instruktur[0].linkedinInstruktur,
                                  position: _arkCourseC.detailCourseJRC.value
                                      .data.instruktur[0].positionInstruktur,
                                  imagePath: _arkCourseC.detailCourseJRC.value
                                      .data.instruktur[0].avatarInstruktur,
                                  name: _arkCourseC.detailCourseJRC.value.data
                                      .instruktur[0].namaInstruktur,
                                ),
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () =>
                                _arkCourseC.isExpandedInstructor.value =
                                    !_arkCourseC.isExpandedInstructor.value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    _arkCourseC.isExpandedInstructor.value ==
                                            false
                                        ? 'Lihat selengkapnya'
                                        : 'Sembunyikan',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: kPrimaryColorBrighter,
                                        fontSize: 12.5),
                                  ),
                                  Icon(
                                    _arkCourseC.isExpandedInstructor.value ==
                                            false
                                        ? Icons.expand_more
                                        : Icons.expand_less,
                                    color: kPrimaryColorBrighter,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : _arkCourseC.detailCourseJRC.value.data.instruktur.length ==
                          1
                      ? ArkInstructorJrcWidget(
                          desc: _arkCourseC.detailCourseJRC.value.data
                              .instruktur[0].descriptionInstruktur,
                          instagramUrl: _arkCourseC.detailCourseJRC.value.data
                              .instruktur[0].instagramInstruktur,
                          linkedinUrl: _arkCourseC.detailCourseJRC.value.data
                              .instruktur[0].linkedinInstruktur,
                          position: _arkCourseC.detailCourseJRC.value.data
                              .instruktur[0].positionInstruktur,
                          imagePath: _arkCourseC.detailCourseJRC.value.data
                              .instruktur[0].avatarInstruktur,
                          name: _arkCourseC.detailCourseJRC.value.data
                              .instruktur[0].namaInstruktur,
                        )
                      : const SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}
