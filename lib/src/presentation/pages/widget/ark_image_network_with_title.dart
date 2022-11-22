import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkImageNetworkWithTitle extends StatelessWidget {
  final String text;
  final String? imageUrl;
  final String messageTooltip;

  const ArkImageNetworkWithTitle({
    Key? key,
    required this.text,
    this.imageUrl,
    required this.messageTooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 6),
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontSize: 12.5,
                    fontFamily: 'SourceSansPro',
                    color: kNewBlack2b),
              ),
              const SizedBox(width: 2),
              Tooltip(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                message: messageTooltip,
                child: const Icon(
                  Icons.info_outline,
                  color: kNewBlack4,
                  size: 15,
                ),
              )
            ],
          ),
        ),
        imageUrl == null ? const SizedBox() : Image.network(imageUrl!),
        const SizedBox(width: 2),
      ],
    );
  }
}
