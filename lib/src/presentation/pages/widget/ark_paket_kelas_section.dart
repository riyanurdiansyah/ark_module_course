import 'package:ark_module_course/ark_module_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ArkPaketKelasSection extends StatelessWidget {
  final bool isCourseRevamp;
  final _arkCourseC = Get.find<ArkCourseController>();

  ArkPaketKelasSection({
    Key? key,
    this.isCourseRevamp = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FOR COURSE REVAMP
    RxList<Map<String, String>> yangAndaDapat = [
      {
        'icon': 'assets/images/icon-kursus-sertifikasi.svg',
        'title': 'Kursus sertifikasi 100% full online'
      },
      {
        'icon': 'assets/images/icon-durasi-materi.svg',
        'title':
            'Rata-rata penyelesaian ${_arkCourseC.penyelesaianKelas.value} jam'
      },
      {
        'icon': 'assets/images/icon-durasi-kelas.svg',
        'title': '${_arkCourseC.totalUnit.value} Video ajar'
      },
      {
        'icon': 'assets/images/icon-jumlah-video-ajar.svg',
        'title':
            '${_arkCourseC.detailCourseRevamp.value.data[0].course!.courseDurationTime} hari akses kelas',
      },
      {
        'icon': 'assets/images/icon-jumlah-kuis.svg',
        'title': '${_arkCourseC.totalKuis} kuis latihan',
      },
      {
        'icon': 'assets/images/icon-materi-pdf.svg',
        'title': 'Materi PDF',
      },
      {
        'icon': 'assets/images/icon-sertifikat.svg',
        'title':
            'Sertifikat elektronik ${_arkCourseC.detailCourseRevamp.value.data[0].course!.name}'
      },
    ].obs;

// FOR COURSE BIASA
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
    ].obs;
    return Obx(
      () => isCourseRevamp == true
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Yang Anda Dapat',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff1C1D20),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                for (int i = 0; i < yangAndaDapat.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(yangAndaDapat[i]['icon']!,
                            color: const Color(0xff45474A),
                            width: 14,
                            height: 14),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            yangAndaDapat[i]['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        SvgPicture.asset(paketKelas[i]['icon']!,
                            width: 14, height: 14),
                        const SizedBox(width: 8),
                        Text(paketKelas[i]['title']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12))
                      ],
                    ),
                  ),
              ],
            ),
    );
  }
}
