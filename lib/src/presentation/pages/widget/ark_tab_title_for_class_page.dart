import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkTabTitleClassPage extends StatelessWidget {
  const ArkTabTitleClassPage({
    Key? key,
    required this.indexCondition,
    required this.title,
    required this.tabIndex,
    required this.onTap,
  }) : super(key: key);

  final int indexCondition;
  final String title;
  final int tabIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              width: Get.size.width / 3,
              height: 40,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Get.size.shortestSide < 600 ? 12 : 18,
                  fontWeight: FontWeight.w700,
                  color: tabIndex == indexCondition
                      ? Colors.black
                      : const Color.fromRGBO(157, 160, 167, 1),
                ),
              ),
            ),
            Container(
              width: Get.size.width / 3,
              height: 2.5,
              color: tabIndex == indexCondition
                  ? const Color.fromRGBO(8, 114, 199, 1)
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
