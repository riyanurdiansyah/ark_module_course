import 'package:ark_module_course/src/domain/entities/curriculum_entity.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:ark_module_course/utils/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ArkKurikulumSection extends StatelessWidget {
  const ArkKurikulumSection({
    Key? key,
    required this.isLoading,
    required this.curriculums,
  }) : super(key: key);

  final bool isLoading;
  final List<CurriculumDataEntity> curriculums;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        children: List.generate(
          10,
          (index) => AppShimmer.listTile(),
        ),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: curriculums.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, i) {
        int duration = Duration(seconds: curriculums[i].duration).inMinutes;
        if (curriculums[i].type == "section") {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (i == 0)
                  const SizedBox(
                    height: 6,
                  ),
                Text(
                  curriculums[i].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  "${duration == 0 ? 1 : duration} Menit",
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: kNewBlack3,
                  ),
                ),
              ],
            ),
          );
        }

        if (curriculums[i].type == "quiz") {
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            child: Row(
              children: [
                const Icon(Icons.fact_check_rounded,
                    color: Colors.grey, size: 16),
                const SizedBox(width: 10),
                Expanded(
                  child: Html(
                    data: curriculums[i].title,
                    style: {
                      "html": Style.fromTextStyle(
                        const TextStyle(fontSize: 12),
                      )
                    },
                  ),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
          child: Row(
            children: [
              const Icon(
                Icons.play_circle_fill,
                color: Colors.grey,
                size: 16,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Html(
                      data: curriculums[i].title,
                      style: {
                        "html": Style.fromTextStyle(
                          const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: duration > 50
                          ? const SizedBox()
                          : Text("${duration == 0 ? 1 : duration} Menit",
                              style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: kNewBlack3)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
