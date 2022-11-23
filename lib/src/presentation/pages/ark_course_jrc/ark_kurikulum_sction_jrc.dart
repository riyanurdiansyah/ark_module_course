import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ArkKurikulumSectionJrc extends StatelessWidget {
  final _arkCourseC = Get.find<ArkCourseController>();

  ArkKurikulumSectionJrc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: _arkCourseC.curriculum.value.data.length,
            itemBuilder: (context, index) {
              int duration = Duration(
                      seconds:
                          _arkCourseC.curriculum.value.data[index].duration)
                  .inMinutes;
              if (_arkCourseC.curriculum.value.data[index].type == "section") {
                return Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 0.5, color: kNewBlack4),
                          top: BorderSide(width: 0.5, color: kNewBlack4)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            kNewBlack6,
                            kNewBlack5b,
                          ])),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.65,
                        child: Text(
                          _arkCourseC.curriculum.value.data[index].title,
                          style: const TextStyle(
                              height: 1.4,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.5),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${duration == 0 ? 1 : duration} Menit",
                        style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 10.5,
                            color: kNewBlack3),
                      ),
                    ],
                  ),
                );
              } else if (_arkCourseC.curriculum.value.data[index].type ==
                  "quiz") {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 3),
                  child: Row(children: [
                    Image.asset(
                      'assets/images/job_ready_course/quiz_logo_new.png',
                      height: 15,
                      width: 15,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Html(
                          data: _arkCourseC.curriculum.value.data[index].title,
                          style: {
                            "html": Style.fromTextStyle(const TextStyle(
                                fontSize: 11, fontFamily: 'SourceSansPro'))
                          }),
                    ),
                  ]),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 6),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.play_circle_fill,
                        color: kNewBlack4,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      SizedBox(
                        width: Get.width * 0.6,
                        child: Html(
                          data: _arkCourseC.curriculum.value.data[index].title,
                          style: {
                            "html": Style.fromTextStyle(const TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 11,
                                fontWeight: FontWeight.w500))
                          },
                        ),
                      ),
                      const Spacer(),
                      duration > 50
                          ? const SizedBox()
                          : Text(
                              "Video : ${duration == 0 ? 1 : duration} Menit",
                              style: const TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w500,
                                  color: kNewBlack3))
                    ],
                  ),
                );
              }
            }),
        const SizedBox(height: 50),
      ],
    );
  }
}
