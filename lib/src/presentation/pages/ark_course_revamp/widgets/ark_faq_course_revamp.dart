import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/utils/app_constanta.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkFaqSectionCourseRevamp extends StatelessWidget {
  final _arkCC = Get.find<ArkCourseController>();
  ArkFaqSectionCourseRevamp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _arkCC.courseRevamp.value.data.isiFaq.isEmpty
          ? SizedBox(
              height: 100,
              width: Get.size.width,
              child: const Center(
                child: Text('Belum Ada Pertanyaan'),
              ),
            )
          : Container(
              margin: const EdgeInsets.only(
                top: 21,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
              ),
              child: Column(
                children: [
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              // AppPrint.debugPrint(index);
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    _arkCC.courseRevamp.value.data.isiFaq[index]
                                        .q!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff1B91D9),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 14,
                                    color: Color(0xff1B91D9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            parseHtmlString(
                              _arkCC.courseRevamp.value.data.isiFaq[index].a!,
                            ),
                            style: const TextStyle(
                              fontSize: 13,
                              fontFamily: 'SourceSansPro',
                              color: Color(0xff5A5C60),
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: _arkCC.courseRevamp.value.data.isiFaq.length,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
    );
  }
}
