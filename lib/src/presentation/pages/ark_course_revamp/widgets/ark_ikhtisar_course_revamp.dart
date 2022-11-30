import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_card_for_description.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_paket_kelas_section.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_row_with_image_string.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_skill_yang_anda_peroleh.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:ark_module_course/utils/app_constanta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ArkIkhtisarSectionCourseRevamp extends StatefulWidget {
  const ArkIkhtisarSectionCourseRevamp({Key? key}) : super(key: key);

  @override
  State<ArkIkhtisarSectionCourseRevamp> createState() =>
      _ArkIkhtisarSectionCourseRevampState();
}

class _ArkIkhtisarSectionCourseRevampState
    extends State<ArkIkhtisarSectionCourseRevamp> {
  final _arkCC = Get.put(ArkCourseController());

  @override
  Widget build(BuildContext context) {
    String? substractGaji(String gaji) {
      //kalo satu digit
      if (gaji.length == 7) {
        final a = gaji.replaceRange(2, gaji.length, '');
        //gak ada koma contoh : 8juta
        if (a.contains('0')) {
          final zzz = a.replaceAll('0', '');
          return zzz;
          //ada komanya contoh :4.5 juta
        } else {
          final zz = a.split('');
          return ('${zz[0]}.${zz[1]}');
        }

        //kalo gaji dua digit
      } else if (gaji.length == 8) {
        final a = gaji.replaceRange(3, gaji.length, '');
        //gak ada koma contoh : 12 juta
        if (a.contains('0')) {
          final zzz = a.replaceRange(2, a.length, '');
          return zzz;
          //ada komanya contoh :12.5 juta
        } else {
          final zz = a.split('');
          return ('${zz[0]}${zz[1]}.${zz[2]}');
        }
      } else if (gaji.length == 9) {
        final a = gaji.replaceRange(4, gaji.length, '');
        //gak ada koma contoh : 200 juta
        if (a.contains('0')) {
          final zzz = a.replaceRange(3, a.length, '');
          return zzz;
          //ada komanya contoh :200.5 juta
        } else {
          final zz = a.split('');
          return ('${zz[0]}${zz[1]}.${zz[2]}');
        }
      }
      return null;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 21,
          ),
          const Text(
            'Yang akan Anda Pelajari',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Color(0xff1C1D20)),
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _arkCC.detailCourseRevamp.value.data[0].course!
                  .ygAkanDipelajariWeb!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.zero,
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check,
                        size: 12,
                        color: Color(0xff2BA0E7),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Expanded(
                        child: Text(
                          _arkCC.detailCourseRevamp.value.data[0].course!
                              .ygAkanDipelajariWeb![index],
                          maxLines: 2,
                          style: const TextStyle(
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          ArkSkillYangAndaPerolahRevamp(),
          const SizedBox(
            height: 21,
          ),
          ArkCardForDescription(
            'Peluang Karier',
            _arkCC.courseRevamp.value.data.peluangKarir,
            const Color(0xffE5E6E9),
          ),
          const SizedBox(
            height: 21,
          ),
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 90,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/cream_card.png',
                          height: 90,
                        ),
                        Positioned(
                          left: 13,
                          top: 0,
                          bottom: 0,
                          right: 13,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '> ${_arkCC.courseRevamp.value.data.pekerjaan.lowongan}',
                                style: const TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff1C1D20),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'lowongan tersedia untuk posisi ini dalam 30 hari',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'SourceSansPro',
                                  color: Color(0xff54565B),
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: SizedBox(
                    height: 90,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/green_card.png',
                          height: 90,
                        ),
                        Positioned(
                          left: 13,
                          top: 0,
                          bottom: 0,
                          right: 13,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rp ${substractGaji(_arkCC.courseRevamp.value.data.pekerjaan.gajiRendah)} - ${substractGaji(_arkCC.courseRevamp.value.data.pekerjaan.gajiTinggi)} jt',
                                style: const TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff1C1D20),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'juta rata-rata gaji untuk\nprofesi ini',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'SourceSansPro',
                                  color: Color(0xff54565B),
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => _arkCC.isExpandedCourseRevamp.isTrue
                ? const SizedBox()
                : SizedBox(
                    width: Get.width,
                    child: Html(
                      data: _arkCC.detailCourseRevamp.value.data[0].course!
                          .description!,
                      customImageRenders: <ImageSourceMatcher, ImageRender>{
                        networkSourceMatcher(domains: ['apps.arkademi.com']):
                            (context, attributes, element) {
                          return const SizedBox();
                        },
                      },
                      style: {
                        'h3': Style(
                          fontSize: const FontSize(
                            14.5,
                          ),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SourceSansPro',
                        ),
                        'h2': Style(
                          textAlign: TextAlign.start,
                          fontFamily: 'SourceSansPro',
                        ),
                        'span': Style(
                          textAlign: TextAlign.start,
                          color: const Color(0xffF63C3C),
                          fontFamily: 'SourceSansPro',
                        ),
                        'p': Style(
                          textAlign: TextAlign.start,
                          fontFamily: 'SourceSansPro',
                        ),
                        'li': Style(
                          fontFamily: 'SourceSansPro',
                        ),
                        'ul': Style(
                          fontFamily: 'SourceSansPro',
                        ),
                        'Strong': Style(
                          fontFamily: 'SourceSansPro',
                        ),
                        'hr': Style(
                          color: Colors.white,
                        ),
                      },
                      customRender: {
                        'iframe': (_, __) {
                          return const SizedBox();
                        },
                        'hr': (_, __) {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
          ),
          Obx(() => Container(
                height: 20,
                margin: EdgeInsets.only(
                  top: _arkCC.isExpandedCourseRevamp.value == true ? 10.0 : 0.0,
                ),
                child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      _arkCC.isExpandedCourseRevamp.value =
                          !_arkCC.isExpandedCourseRevamp.value;
                    },
                    child: Text(
                        _arkCC.isExpandedCourseRevamp.value == true
                            ? 'Selengkapnya'
                            : 'Sembunyikan',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SourceSansPro',
                        ))),
              )),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => _arkCC.isLoadingCurriculums.isTrue
                ? const SizedBox()
                : _arkCC.isExpandedCourseRevamp.isTrue
                    ? const SizedBox()
                    : Card(
                        color: kCanvasColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                          side: const BorderSide(
                            color: Color(0xffC9CBCF),
                            width: 0.69,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 17,
                            right: 17,
                            bottom: 21,
                            top: 29,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ArkPaketKelasSection(
                                isCourseRevamp: true,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Text(
                                'Fitur Kelas',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff1C1D20),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Wrap(
                                runSpacing: 9,
                                children: List.generate(
                                  fiturKursus.length,
                                  (index) => Wrap(
                                    children: [
                                      Container(
                                        width: Get.size.width > 400
                                            ? Get.size.width * 0.4
                                            : 141,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: const LinearGradient(
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight,
                                                  colors: [
                                                    Color(0xffEFF1F3),
                                                    Color(0xffFBFCFD),
                                                  ],
                                                ),
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                  fiturKursus[index]['icon']!,
                                                  height: 17,
                                                  width: 18,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 9,
                                            ),
                                            Text(
                                              fiturKursus[index]['title']!,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff45484D),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'e-Certificate',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff1C1D20),
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 12.5),
                              if (_arkCC.detailCourseRevamp.value.data[0]
                                      .course!.sertifikatFrameUrl !=
                                  '')
                                Column(
                                  children: [
                                    Center(
                                      child: Image.network(
                                        _arkCC.detailCourseRevamp.value.data[0]
                                            .course!.sertifikatFrameUrl!,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const SizedBox();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
          ),
          const SizedBox(
            height: 40,
          ),
          ArkRowWithImageAndDescription(
            imagePath: _arkCC.detailCourseRevamp.value.data[0].course!
                .instructor!.avatar.url,
            title: 'Fasilitator',
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xff1C1D20),
            ),
            subtitle: _arkCC
                .detailCourseRevamp.value.data[0].course!.instructor!.name,
            description: _arkCC.detailCourseRevamp.value.data[0].course!
                .fasilitator![0].deskripsi,
          ),
          const SizedBox(
            height: 30,
          ),
          _arkCC.courseRevamp.value.data.instruktur.isEmpty
              ? const SizedBox()
              : ArkRowWithImageAndDescription(
                  imagePath: _arkCC.courseRevamp.value.data.instruktur[0].image,
                  title: 'Instruktur',
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff1C1D20),
                  ),
                  subtitle: _arkCC.courseRevamp.value.data.instruktur[0].nama,
                  description:
                      _arkCC.courseRevamp.value.data.instruktur[0].deskripsi,
                ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
