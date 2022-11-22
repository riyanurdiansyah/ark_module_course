import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';

class ArkCocokUntukKamu extends StatelessWidget {
  List<String>? listUsed;
  final String title;

  ArkCocokUntukKamu(this.title, this.listUsed);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 14,
          color: kNewBlack2a,
        ),
      ),
      const SizedBox(height: 4),
      for (int i = 0; i < listUsed!.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 1),
                child:
                    Icon(Icons.check_circle, size: 15, color: kPrimaryGreen1),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  listUsed![i],
                  style: const TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: kNewBlack2b,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      const SizedBox(height: 14),
    ]);
  }
}
