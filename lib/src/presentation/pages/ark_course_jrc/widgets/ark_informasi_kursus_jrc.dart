import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ArkInformasiKursusJrc extends StatelessWidget {
  final _arkCourseC = Get.find<ArkCourseController>();

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> paketKelas = [
      {
        'icon': 'assets/images/icon-durasi-materi.svg',
        'title': _arkCourseC.duration.value <= 3600
            ? 'Durasi kursus ${_arkCourseC.duration.value} menit'
            : 'Durasi kursus ${_arkCourseC.duration.value} jam'
      },
      // {
      //   'icon': 'assets/images/icon-durasi-materi.svg',
      //   'title': 'Rata-rata penyelesaian ${_lCC.penyelesaianKelas.value} jam'
      // },
      {
        'icon': 'assets/images/icon-jumlah-video-ajar.svg',
        'title':
            // '${_arkCourseC.detailCourseJRC.value.data.courseDurationTime!} hari akses kursus',
            // TODO
            '99999'
      },
      {
        'icon': 'assets/images/icon-durasi-kelas.svg',
        'title': '${_arkCourseC.totalUnit} video ajar'
      },
      {
        'icon': 'assets/images/icon-jumlah-kuis.svg',
        'title': '${_arkCourseC.totalKuis} kuis latihan'
      },
      {'icon': 'assets/images/icon-materi-pdf.svg', 'title': 'Materi PDF'},
      {
        'icon': 'assets/images/icon-sertifikat.svg',
        'title': 'Sertifikat elektronik'
      },
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Informasi Kursus",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        const SizedBox(height: 10),
        for (int i = 0; i < paketKelas.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                SvgPicture.asset(paketKelas[i]['icon']!, width: 15, height: 15),
                const SizedBox(width: 9),
                Text(paketKelas[i]['title']!,
                    style: const TextStyle(
                        letterSpacing: 0.1,
                        color: kNewBlack2a,
                        fontFamily: 'SourceSansPro',
                        fontSize: 13.5))
              ],
            ),
          ),
      ]),
    );
  }
}
