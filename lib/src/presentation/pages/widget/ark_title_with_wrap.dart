import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';

class ArkTitleWithWrap extends StatelessWidget {
  const ArkTitleWithWrap({
    Key? key,
    required this.listOfSkill,
    required this.title,
  }) : super(key: key);

  final List? listOfSkill;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.w700,
              fontSize: 13),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 10),
          child: Wrap(
            children: [
              for (int i = 1; i <= listOfSkill!.length; i++)
                Container(
                  margin: const EdgeInsets.only(top: 3, bottom: 3, right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: kNewBlack5a,
                      width: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    child: Text(
                      listOfSkill![i - 1],
                      style: const TextStyle(
                        color: kNewBlack2b,
                        fontFamily: 'SourceSansPro',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
