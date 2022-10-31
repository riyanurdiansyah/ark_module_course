import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkBeginClassBtm extends StatelessWidget {
  ArkBeginClassBtm({Key? key}) : super(key: key);

  final _courseC = Get.find<ArkCourseController>();

  @override
  Widget build(BuildContext context) {
    final status = _courseC.userStatus.value.userStatus;
    final expired = _courseC.userStatus.value.isExpired;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          primary: _courseC.detailCourse.value.status != "publish"
              ? Colors.grey.shade300
              : !_courseC.isLogin.value && !expired && status == "1"
                  ? kPrimaryGreen1
                  : expired
                      ? Colors.white
                      : status.isNotEmpty && !expired
                          ? kPrimaryColorNew
                          : const Color.fromRGBO(243, 130, 46, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
        child: _courseC.detailCourse.value.status != "publish"
            ? const Text(
                "SEGERA HADIR",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kNewBlack2a),
                textAlign: TextAlign.center,
              )
            : expired
                ? const Text(
                    "Kadaluarsa",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kNewBlack2a),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    status == "1"
                        ? "Mulai Pelatihan"
                        : status == "2" && !expired
                            ? "Lanjutkan"
                            : (status == "3" || status == "4") && !expired
                                ? "Terselesaikan"
                                : "GABUNG KE PELATIHAN",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
      ),
    );
  }
}
