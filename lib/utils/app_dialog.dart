import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkAppDialog {
  static dialogJoinClass() {
    Get.defaultDialog(
      onWillPop: () async => false,
      barrierDismissible: false,
      title: "",
      middleText: "",
      content: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Memuat data...",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static defaultSnackbarWithAction(
    String title,
    label,
    VoidCallback onPress,
  ) {
    return SnackBar(
      content: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 2,
      ),
      action: SnackBarAction(
        label: label,
        textColor: Colors.blue,
        onPressed: onPress,
      ),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.grey.shade800,
    );
  }
}
