import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ArkLowonganKarirTabJrc extends StatelessWidget {
  final int indexCondition;
  final RxInt tabIndex;
  const ArkLowonganKarirTabJrc(
      {Key? key, required this.indexCondition, required this.tabIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tabIndex.value = indexCondition;
      },
      child: Obx(
        () => Container(
          margin: const EdgeInsets.symmetric(horizontal: 26),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: tabIndex.value == indexCondition
                  ? kPrimaryBlue6
                  : Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  width: 0.6,
                  color: tabIndex.value == indexCondition
                      ? const Color.fromRGBO(27, 145, 217, 1)
                      : kNewBlack3)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                FontAwesomeIcons.briefcase,
                color: Color.fromRGBO(27, 145, 217, 1),
                size: 9.5,
              ),
              const SizedBox(width: 5),
              Text(
                'Lowongan Kerja',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Get.size.shortestSide < 600 ? 9.5 : 14,
                  fontWeight: tabIndex.value == indexCondition
                      ? FontWeight.w700
                      : FontWeight.w600,
                  color: tabIndex.value == indexCondition
                      ? kNewBlack2a
                      : kNewBlack2a,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
