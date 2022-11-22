import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ArkApaYangDidapatkanJrc extends StatelessWidget {
  final List<Map<String, String>> dapatkanList = [
    {
      'image': 'assets/images/job_ready_course/dapatkan_0.png',
      'text': 'Studi Kasus Terbaru',
      'pop-text':
          'Studi kasus terbaru dengan penjelasan materi lengkap yang dilakukan oleh instruktur profesional'
    },
    {
      'image': 'assets/images/job_ready_course/dapatkan_1.png',
      'text': 'Rekomendasi Pekerjaan',
      'pop-text': 'Rekomendasi pekerjaan yang tepat sesuai dengan kemampuanmu'
    },
    {
      'image': 'assets/images/job_ready_course/dapatkan_2.png',
      'text': 'QnA',
      'pop-text':
          'Sesi tanya jawab seputar materi pembelajaran yang akan dijawab langsung oleh Tim Arkademi'
    },
    {
      'image': 'assets/images/job_ready_course/dapatkan_3.png',
      'text': 'Portofolio',
      'pop-text':
          'Memiliki proyek dan hasil karya dari kursus yang telah diikuti'
    },
    {
      'image': 'assets/images/job_ready_course/dapatkan_4.png',
      'text': 'Forum Diskusi',
      'pop-text':
          'Tersedia grup Telegram untuk melakukan diskusi langsung bersama Tim Arkademi'
    }
  ];

  ArkApaYangDidapatkanJrc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Apa yang akan kamu dapatkan\ndi kursus ini?',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
        ),
        const SizedBox(height: 15),
        for (int i = 0; i < 5; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Image.asset(
                  dapatkanList[i]['image']!,
                  fit: BoxFit.fill,
                  height: 35,
                  width: 35,
                ),
                const SizedBox(width: 13),
                Text(
                  dapatkanList[i]['text']!,
                  style: const TextStyle(
                      fontSize: 14.5,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 6),
                Tooltip(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.3),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(6)),
                    triggerMode: TooltipTriggerMode.tap,
                    textStyle: const TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    message: dapatkanList[i]['pop-text']!,
                    child: const Icon(
                      FontAwesomeIcons.circleQuestion,
                      color: kNewBlack4,
                      size: 15,
                    ))
              ],
            ),
          )
      ],
    );
  }
}
