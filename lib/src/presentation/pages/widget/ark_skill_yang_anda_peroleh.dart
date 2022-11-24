import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkSkillYangAndaPerolahRevamp extends StatelessWidget {
  final _arkCC = Get.find<ArkCourseController>();
  ArkSkillYangAndaPerolahRevamp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Text(
        'Skill yang Akan Anda Peroleh',
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13.5),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 22),
        child: Wrap(
          children: [
            for (int i = 0;
                i <
                    _arkCC.detailCourseRevamp.value.data[0].course!
                        .skillYgAkanDiperolehWeb!.length;
                i++)
              Container(
                margin: const EdgeInsets.only(top: 3, bottom: 3, right: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(0xffF0F2F5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  child: Text(
                    _arkCC.detailCourseRevamp.value.data[0].course!
                        .skillYgAkanDiperolehWeb![i],
                    style: const TextStyle(
                      color: kNewBlack2a,
                      fontFamily: 'SourceSansPro',
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
          ],
        ),
      )
    ]);
  }
}
