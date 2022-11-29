import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:ark_module_course/utils/app_constanta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ArkIkhtisarBody extends StatelessWidget {
  final _arkCourseC = Get.find<ArkCourseController>();

  @override
  Widget build(BuildContext context) {
    String data = _arkCourseC.detailCourse.value.description;
    List tempData = data.split('<h1 style="');
    return _arkCourseC.detailCourseBiasa.value.data[0].course!.ikhtisar == ''
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Html(
              data: '<h1 style="${tempData[1]}',
              onLinkTap: (url, __, ___, ____) {
                launchUrl(Uri.parse(url!), mode: LaunchMode.inAppWebView);
              },
              customRender: {
                'li': (_, htmlWidget) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('-'),
                      Expanded(child: htmlWidget),
                    ],
                  );
                },
                'iframe': (_, __) {
                  return Container();
                }
              },
              style: {
                "h3": Style(
                    fontWeight: FontWeight.w800,
                    fontFamily: 'SourceSansPro',
                    fontSize: const FontSize(18)),
              },
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                    parseHtmlString(_arkCourseC
                        .detailCourseBiasa.value.data[0].course!.ikhtisar!),
                    style: const TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: kNewBlack2b,
                        height: 1.6)),
              ),
              const SizedBox(height: 16),
              if (_arkCourseC
                      .detailCourseBiasa.value.data[0].course!.tujuanUmum !=
                  '')
                HeaderandBody(
                    header: "Tujuan Umum",
                    body: _arkCourseC
                        .detailCourseBiasa.value.data[0].course!.tujuanUmum!),
              if (_arkCourseC
                      .detailCourseBiasa.value.data[0].course!.tujuanKhusus! !=
                  '')
                HeaderandBodyHtml(
                    header: "Tujuan Khusus",
                    body: _arkCourseC
                        .detailCourseBiasa.value.data[0].course!.tujuanKhusus!),
              if (_arkCourseC.detailCourseBiasa.value.data[0].course!
                      .sasaranKelompok! !=
                  '')
                HeaderandBody(
                    header: "Sasaran Kelompok Kerja",
                    body: _arkCourseC.detailCourseBiasa.value.data[0].course!
                        .sasaranKelompok!),
              if (_arkCourseC.detailCourseBiasa.value.data[0].course!
                      .sasaranKompetensi! !=
                  '')
                HeaderandBody(
                    header: "Peluang atas kompetensi Pelatihan",
                    body: _arkCourseC.detailCourseBiasa.value.data[0].course!
                        .sasaranKompetensi!),
              if (_arkCourseC.detailCourseBiasa.value.data[0].course!
                  .sertifikatKelulusanDesc!
                  .trim()
                  .isNotEmpty)
                HeaderandBodyHtml(
                  header: "Sertifikat Kelulusan",
                  body: _arkCourseC.detailCourseBiasa.value.data[0].course!
                      .sertifikatKelulusanDesc!,
                ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Metode Ajar',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: const [
                    Text(
                        '- Self-paced Learning dengan Pre-Test pada setiap modul dan Post-Test pada akhir kelas untuk menguji pemahaman materi.\n- Video ajar berdurasi rata-rata 10 menit/video.\n- Slide materi PDF.',
                        style: TextStyle(fontFamily: 'SourceSansPro')),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Evaluasi Pembelajaran',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Pre-test pada setiap modul dan post-test di akhir pelatihan. Dibutuhkan nilai minimal 60 untuk lulus pada pelatihan ini.',
                    style: TextStyle(fontFamily: 'SourceSansPro'),
                  )),
              if (_arkCourseC.detailCourseBiasa.value.data[0].course!
                          .standarKompetensi! !=
                      '' ||
                  _arkCourseC.detailCourseBiasa.value.data[0].course!
                          .standarKompetensi! !=
                      ' ')
                HeaderandBody(
                    header: 'Standar Kompetensi',
                    body: _arkCourseC.detailCourseBiasa.value.data[0].course!
                        .standarKompetensi!),
              if (_arkCourseC.detailCourseBiasa.value.data != null &&
                  _arkCourseC.detailCourseBiasa.value.data[0].course!
                          .courseDurationTime !=
                      "")
                HeaderandBody(
                    isDurasiAkses: true,
                    header: "Durasi Akses",
                    body:
                        'Siswa mendapatkan akses masuk ke kelas ${_arkCourseC.detailCourseBiasa.value.data[0].course!.courseDurationTime!} selama hari'),
            ],
          );
  }
}

class HeaderandBody extends StatelessWidget {
  final String header;
  final String body;
  final bool? isDurasiAkses;

  const HeaderandBody(
      {required this.header, required this.body, this.isDurasiAkses = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            parseHtmlString(header),
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            parseHtmlString(body),
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontWeight:
                  isDurasiAkses == true ? FontWeight.bold : FontWeight.normal,
              color: isDurasiAkses == true ? Colors.red : kNewBlack2a,
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderandBodyHtml extends StatelessWidget {
  final String header;
  final String body;

  const HeaderandBodyHtml({required this.header, required this.body});

  @override
  Widget build(BuildContext context) {
    var htmlRegex = RegExp(r"<[^>]*>");
    final isBodyHtml = htmlRegex.hasMatch(body);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            header,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
        ),
        const SizedBox(height: 16),
        if (isBodyHtml)
          Html(
            data: body,
            customRender: {
              'li': (_, htmlWidget) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('-'),
                    Expanded(child: htmlWidget),
                  ],
                );
              },
              'iframe': (_, __) {
                return const SizedBox();
              }
            },
            style: {
              "body": Style(
                fontFamily: 'SourceSansPro',
                color: kNewBlack2a,
              ),
            },
          ),
        if (isBodyHtml == false)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              parseHtmlString(body),
              style: const TextStyle(
                  fontFamily: 'SourceSansPro', color: kNewBlack2a),
            ),
          ),
      ],
    );
  }
}
