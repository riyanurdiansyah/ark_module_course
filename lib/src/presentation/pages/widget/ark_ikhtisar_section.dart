import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_card_with_icon_for_description.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_map_with_icon_for_description.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_paket_kelas_section.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_row_with_image_string.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:ark_module_course/utils/app_constanta.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ArkIkhtisarSection extends StatelessWidget {
  ArkIkhtisarSection({Key? key}) : super(key: key);

  final _courseC = Get.find<ArkCourseController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            width: Get.width,
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 25,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(249, 252, 255, 1),
                border: Border.all(width: 2.5, color: kNewBlack5b)),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Peluang Karir",
                  style: TextStyle(
                    color: kNewBlack2a,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                if (_courseC.detailCourseBiasa.value.data[0].course!
                    .peluangKarir!.isNotEmpty)
                  Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: List.generate(
                      _courseC.detailCourseBiasa.value.data[0].course!
                          .peluangKarir!.length,
                      (index) => Card(
                        margin: const EdgeInsets.only(right: 6, bottom: 10),
                        elevation: 5,
                        shadowColor: Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Text(
                            _courseC.detailCourseBiasa.value.data[0].course!
                                .peluangKarir![index],
                            style: const TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 11.5,
                              color: Color(0xFF54565B),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (_courseC
                        .detailCourseBiasa.value.data[0].course!.lowongan!.id !=
                    0)
                  const SizedBox(
                    height: 18,
                  ),
                if (_courseC.detailCourseBiasa.value.data[0].course!.lowongan!
                        .jumlahLowongan !=
                    "")
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFEEF8FE),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/cv.svg',
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Flexible(
                              child: Text(
                                'Terdapat ${_courseC.detailCourseBiasa.value.data[0].course!.lowongan!.jumlahLowongan} lowongan yang dipasang untuk posisi akuntansi dalam ${_courseC.detailCourseBiasa.value.data[0].course!.lowongan!.enddateLowongan.difference(_courseC.detailCourseBiasa.value.data[0].course!.lowongan!.startdateLowongan).inDays} hari',
                                style: const TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 10.5,
                                  height: 1.5,
                                  color: Color(0xFF5A5C60),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/salary.svg',
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Flexible(
                              child: Text(
                                'Rata-rata gaji dengan kriteria tanpa pengalaman berkisar ${NumberFormat.compactSimpleCurrency(
                                  locale: 'id',
                                  decimalDigits: 1,
                                  name: '',
                                ).format(int.parse(_courseC.detailCourse.value.lowongan.gajiMin ?? "0")).replaceAll('jt', 'juta')} - ${NumberFormat.compactSimpleCurrency(
                                  locale: 'id',
                                  decimalDigits: 1,
                                  name: '',
                                ).format(int.parse(_courseC.detailCourse.value.lowongan.gajiMax ?? "0")).replaceAll('jt', 'juta')}',
                                maxLines: 3,
                                style: const TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 10.5,
                                  height: 1.5,
                                  color: Color(0xFF5A5C60),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Sumber:",
                              style: TextStyle(
                                fontSize: 8.5,
                                color: Color(0xFF5A5C60),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Image.asset(
                              'assets/images/${_courseC.detailCourse.value.lowongan.reference}.png',
                              width: 50,
                            )
                          ],
                        ),
                        if (_courseC
                            .detailCourse.value.ygAkanDipelajariWeb.isNotEmpty)
                          ArkCardWithIconForDescription('Yang Akan Dipelajari',
                              _courseC.detailCourse.value.ygAkanDipelajariWeb),
                        //         if (_courseC.
                        //      skillYgAkanDiperolehWeb!.isNotEmpty)
                        // CardForDescription(
                        //     'Skill yang Akan Diperoleh',
                        //     _lcC.detailClass.value.data![0].course!
                        //         .skillYgAkanDiperolehWeb!,
                        //     kNewBlack6)
                        const Padding(
                          padding: EdgeInsets.only(left: 8, top: 15),
                          child: Text(
                            'Ikhtisar',
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              height: 135,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                  _courseC.detailCourseBiasa.value.data[0]
                                      .course!.ikhtisar!,
                                  style: const TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: kNewBlack2b,
                                      height: 1.6)),
                            ),
                            Obx(
                              () => _courseC.isExpanded.value == true
                                  ? Container()
                                  : TextButton.icon(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: () {
                                        _courseC.isExpanded.value =
                                            !_courseC.isExpanded.value;
                                      },
                                      icon: Icon(
                                        _courseC.isExpanded.value == false
                                            ? Icons.expand_more
                                            : Icons.expand_less,
                                        color: kPrimaryColor,
                                        size: 18,
                                      ),
                                      label: Text(
                                        _courseC.isExpanded.value == false
                                            ? 'Selengkapnya'
                                            : 'Sembunyikan',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: kPrimaryColor,
                                            fontSize: 12.5),
                                      ),
                                    ),
                            ),
                            // Obx(
                            //   () => _courseC.isExpanded.value == false ? Container() : IkhtisarBody(),
                            // ),
                            _courseC.isExpanded.value == false
                                ? Container()
                                : Obx(
                                    () => TextButton.icon(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: () => _courseC.isExpanded
                                          .value = !_courseC.isExpanded.value,
                                      icon: Icon(
                                        _courseC.isExpanded.value == false
                                            ? Icons.expand_more
                                            : Icons.expand_less,
                                        color: kPrimaryColor,
                                        size: 18,
                                      ),
                                      label: Text(
                                        _courseC.isExpanded.value == false
                                            ? 'Selengkapnya'
                                            : 'Sembunyikan',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: kPrimaryColor,
                                            fontSize: 12.5),
                                      ),
                                    ),
                                  ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 20,
                                bottom: 25,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color.fromRGBO(249, 252, 255, 1),
                                  border: Border.all(
                                      width: 0.3, color: kNewBlack3)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ArkPaketKelasSection(),
                                  const SizedBox(height: 22),
                                  const ArkMapWithIconForDescription(
                                      'Fitur Pelatihan', fiturKelas, true),
                                  const SizedBox(height: 22),
                                  const Text('E-Sertifikat',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  if (_courseC.detailCourseBiasa.value.data[0]
                                          .course!.sertifikatFrameUrl !=
                                      '')
                                    Column(
                                      children: [
                                        Center(
                                          child: Image.network(
                                            _courseC
                                                .detailCourseBiasa
                                                .value
                                                .data[0]
                                                .course!
                                                .sertifikatFrameUrl!,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const SizedBox();
                                            },
                                          ),
                                        ),
                                        const Center(
                                          child: Text(
                                            'Sertifikat Penyelesaian',
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color.fromRGBO(
                                                  131, 133, 137, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            ArkRowWithImageAndDescription(
                                imagePath: _courseC.detailCourseBiasa.value
                                    .data[0].course!.instructor!.avatar.url,
                                title: 'Fasilitator',
                                subtitle: _courseC.detailCourseBiasa.value
                                    .data[0].course!.instructor!.name,
                                description: _courseC.detailCourseBiasa.value
                                        .data[0].course!.instructor?.sub ??
                                    ""),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
