import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';

class ArkKenapaHarusBelajarDiArkademiJrc extends StatelessWidget {
  final List<Map<String, String>> kenapaHarusArkademi = [
    {
      'image': 'assets/images/job_ready_course/belajar_di_arkademi_0.png',
      'title': 'Lembaga Resmi dan Terpercaya',
      'content':
          'Dipercaya 130 juta tenaga kerja Indonesia dalam meningkatkan skill dan mendapatkan sertifikasi profesional'
    },
    {
      'image': 'assets/images/job_ready_course/belajar_di_arkademi_1.png',
      'title': 'Harga Terjangkau',
      'content': 'Harga kursus yang lebih terjangkau sesuai kebutuhanmu'
    },
    {
      'image': 'assets/images/job_ready_course/belajar_di_arkademi_2.png',
      'title': 'Silabus Lengkap dan Terbaru',
      'content':
          'Materi belajar berkualitas yang dilakukan langsung oleh instruktur profesional di bidangnya'
    },
    {
      'image': 'assets/images/job_ready_course/belajar_di_arkademi_3.png',
      'title': 'Informasi Lowongan Kerja',
      'content': 'Menemukan pilihan karier yang tepat sesuai dengan kemampuanmu'
    }
  ];

  ArkKenapaHarusBelajarDiArkademiJrc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [kCanvasColor, Colors.lightBlue[50]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Kenapa harus belajar di Arkademi?",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
          ),
          const SizedBox(height: 30),
          for (int i = 0; i < 4; i++)
            SizedBox(
              child: Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 17, left: 18, right: 18),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(children: [
                    Image.asset(kenapaHarusArkademi[i]['image']!),
                    const SizedBox(height: 18),
                    Text(
                      kenapaHarusArkademi[i]['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                          color: kNewBlack2a),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      kenapaHarusArkademi[i]['content']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 12,
                          color: kNewBlack2b),
                    ),
                  ]),
                ),
              ),
            ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
