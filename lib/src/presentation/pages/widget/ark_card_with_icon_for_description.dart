import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';

class ArkCardWithIconForDescription extends StatelessWidget {
  // final _lcC = Get.find<LumenClassController>();
  final List<String>? listUsed;

  final String title;

  ArkCardWithIconForDescription(this.title, this.listUsed, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 13.5,
          color: kNewBlack2a,
        ),
      ),
      const SizedBox(height: 10),
      for (int i = 0; i < listUsed!.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check, size: 16, color: kPrimaryColor),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  listUsed![i],
                  style: const TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
    ]);
  }
}
