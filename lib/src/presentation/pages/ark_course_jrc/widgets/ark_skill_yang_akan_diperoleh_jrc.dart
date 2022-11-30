import 'package:ark_module_course/src/presentation/pages/widget/ark_title_with_wrap.dart';
import 'package:flutter/material.dart';

class ArkSkillYangAkanDiperolehJrc extends StatelessWidget {
  final String title;
  final List? listOfHardSkill;
  final List? listOfSoftSkill;
  final Color cardColor;

  const ArkSkillYangAkanDiperolehJrc(
      {required this.title,
      this.listOfHardSkill,
      this.listOfSoftSkill,
      required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Text(
        'Skill yang Akan Diperoleh',
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
      ),
      const SizedBox(height: 10),
      //hard skill
      if (listOfHardSkill!.isNotEmpty)
        ArkTitleWithWrap(title: 'Hard Skill', listOfSkill: listOfHardSkill),
      //softskill
      if (listOfSoftSkill!.isNotEmpty)
        ArkTitleWithWrap(title: 'Soft Skill', listOfSkill: listOfSoftSkill),
    ]);
  }
}
