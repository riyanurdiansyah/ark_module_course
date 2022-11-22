import 'package:ark_module_course/services/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkTabTitleJrc extends StatelessWidget {
  final int indexCondition;
  final String title;
  final RxInt tabIndex;

  const ArkTabTitleJrc({
    required this.indexCondition,
    required this.title,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tabIndex.value = indexCondition;
        if (tabIndex.value == 1) {
          AppFirebaseAnalyticsService().addLog('mbl_prj_jrc_p1_click_kr_all');
        } else if (tabIndex.value == 3) {
          AppFirebaseAnalyticsService()
              .addLog('mbl_prj_jrc_p1_click_CTA_info_loker');
        }
      },
      child: Obx(
        () => Container(
          padding: const EdgeInsets.only(
            top: 14,
            left: 13,
            right: 13,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: tabIndex.value == indexCondition
                    ? const Color.fromRGBO(8, 114, 199, 1)
                    : Colors.transparent,
              ),
            ),
          ),
          height: 40,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Get.size.shortestSide < 600 ? 9.5 : 14,
              fontWeight: tabIndex.value == indexCondition
                  ? FontWeight.w800
                  : FontWeight.w600,
              color: tabIndex.value == indexCondition
                  ? Colors.black
                  : const Color.fromRGBO(157, 160, 167, 1),
            ),
          ),
        ),
      ),
    );
  }
}
