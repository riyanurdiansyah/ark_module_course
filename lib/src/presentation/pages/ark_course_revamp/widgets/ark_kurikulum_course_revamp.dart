import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/utils/app_constanta.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ArkKurikulumSectionCourseRevamp extends StatelessWidget {
  ArkKurikulumSectionCourseRevamp({Key? key}) : super(key: key);
  final _arkCC = Get.put(ArkCourseController());

  @override
  Widget build(BuildContext context) {
    // String? substractGaji(String gaji) {
    //   //kalo satu digit
    //   if (gaji.length == 7) {
    //     final a = gaji.replaceRange(2, gaji.length, '');
    //     //gak ada koma contoh : 8juta
    //     if (a.contains('0')) {
    //       final zzz = a.replaceAll('0', '');
    //       return zzz;
    //       //ada komanya contoh :4.5 juta
    //     } else {
    //       final zz = a.split('');
    //       return ('${zz[0]}.${zz[1]}');
    //     }

    //     //kalo gaji dua digit
    //   } else if (gaji.length == 8) {
    //     final a = gaji.replaceRange(3, gaji.length, '');
    //     //gak ada koma contoh : 12 juta
    //     if (a.contains('0')) {
    //       final zzz = a.replaceRange(2, a.length, '');
    //       return zzz;
    //       //ada komanya contoh :12.5 juta
    //     } else {
    //       final zz = a.split('');
    //       return ('${zz[0]}${zz[1]}.${zz[2]}');
    //     }
    //   } else if (gaji.length == 9) {
    //     final a = gaji.replaceRange(4, gaji.length, '');
    //     //gak ada koma contoh : 200 juta
    //     if (a.contains('0')) {
    //       final zzz = a.replaceRange(3, a.length, '');
    //       return zzz;
    //       //ada komanya contoh :200.5 juta
    //     } else {
    //       final zz = a.split('');
    //       return ('${zz[0]}${zz[1]}.${zz[2]}');
    //     }
    //   }
    //   return null;
    // }

    return Column(
      children: List.generate(
        _arkCC.listTitle.length,
        (i) {
          var duration =
              Duration(seconds: _arkCC.listTitle[i].duration).inMinutes;
          final listUnit = _arkCC.listUnit.where((e) {
            return e.idParent == _arkCC.listTitle[i].idParent;
          }).toList();

          return ExpandableNotifier(
            child: ScrollOnExpand(
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  bodyAlignment: ExpandablePanelBodyAlignment.center,
                  hasIcon: false,
                ),
                collapsed: Container(
                  height: 3,
                  color: Colors.white,
                ),
                header: Container(
                  padding: const EdgeInsets.only(
                    left: 17,
                    right: 17,
                    bottom: 15,
                    top: 15,
                  ),
                  color: const Color(0xffF4F6F9),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _arkCC.listTitle[i].title,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        duration < 1 ? "" : "$duration menit",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff838589),
                        ),
                      ),
                    ],
                  ),
                ),
                expanded: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        _arkCC.listUnit
                            .where((e) =>
                                e.idParent == _arkCC.listTitle[i].idParent)
                            .toList()
                            .length,
                        (innerIndex) {
                          int durationUnit = Duration(
                                  seconds: _arkCC.listUnit[innerIndex].duration)
                              .inMinutes;
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 17,
                            ),
                            child: Material(
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    listUnit[innerIndex].type == "quiz"
                                        ? SvgPicture.asset(
                                            'assets/images/jumlah-soal.svg',
                                            fit: BoxFit.cover,
                                          )
                                        : ClipOval(
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              color: const Color(0xffC0C2C6),
                                              child: const Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                                size: 8,
                                              ),
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 205,
                                      child: Text(
                                        parseHtmlString(
                                          listUnit[innerIndex].title,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 10.5,
                                          fontFamily: "SourceSansPro",
                                          color: Color(0xff333539),
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Spacer(),
                                    Container(
                                      alignment: Alignment.topRight,
                                      width: Get.size.height < 600 ? 80 : 90,
                                      child: listUnit[innerIndex].type == "quiz"
                                          ? const SizedBox()
                                          : durationUnit >= 9999
                                              ? const Text(
                                                  'Tak Terbatas',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff838589),
                                                  ),
                                                )
                                              : Text(
                                                  'Video: $durationUnit menit',
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff838589),
                                                  ),
                                                ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
