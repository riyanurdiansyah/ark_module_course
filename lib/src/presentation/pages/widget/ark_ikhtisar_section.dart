import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/src/domain/entities/lowongan_entity.dart';
import 'package:ark_module_course/utils/app_color.dart';

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
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List.generate(
                    _courseC.detailCourse.value.peluangKarir.length,
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
                          _courseC.detailCourse.value.peluangKarir[index],
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
                if (_courseC.detailCourse.value.lowongan.id != 0)
                  const SizedBox(
                    height: 18,
                  ),
                if (_courseC.detailCourse.value.lowongan !=
                    const LowonganEntity())
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
                                'Terdapat ${_courseC.detailCourse.value.lowongan.jumlahLowongan} lowongan yang dipasang untuk posisi akuntansi dalam ${_courseC.detailCourse.value.lowongan.endDateLowongan!.difference(_courseC.detailCourse.value.lowongan.startDateLowongan!).inDays} hari',
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
                        )
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
