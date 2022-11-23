import 'package:ark_module_course/ark_module_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ArkPaketKelasSection extends StatelessWidget {
  final _arkCourseC = Get.find<ArkCourseController>();

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> paketKelas = [
      {
        'icon': 'assets/images/icon-durasi-materi.svg',
        'title': _arkCourseC.duration.value <= 3600
            ? 'Durasi materi ${_arkCourseC.duration.value} menit'
            : 'Durasi materi ${_arkCourseC.duration.value} jam'
      },
      {
        'icon': 'assets/images/icon-durasi-materi.svg',
        'title':
            'Rata-rata penyelesaian ${_arkCourseC.penyelesaianKelas.value} jam'
      },
      {
        'icon': 'assets/images/icon-durasi-kelas.svg',
        'title':
            '${_arkCourseC.detailCourseBiasa.value.data[0].course?.courseDurationTime ?? ""} hari akses kelas',
      },
      {
        'icon': 'assets/images/icon-jumlah-video-ajar.svg',
        'title': '${_arkCourseC.totalUnit} Video ajar'
      },
      {
        'icon': 'assets/images/icon-jumlah-kuis.svg',
        'title': '${_arkCourseC.totalKuis} kuis'
      },
      {'icon': 'assets/images/icon-materi-pdf.svg', 'title': 'Materi PDF'},
      {
        'icon': 'assets/images/icon-sertifikat.svg',
        'title': 'Sertifikat elektronik'
      },
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Paket Pelatihan",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      for (int i = 0; i < paketKelas.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              SvgPicture.asset(paketKelas[i]['icon']!, width: 14, height: 14),
              const SizedBox(width: 8),
              Text(paketKelas[i]['title']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12))
            ],
          ),
        ),
    ]);
  }
}
