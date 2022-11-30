import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:ark_module_course/utils/app_constanta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArkInfoKursusBodyJrc extends StatelessWidget {
  final _arkCourseC = Get.find<ArkCourseController>();

  ArkInfoKursusBodyJrc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String data = _arkCourseC.detailCourse.value.description;
    List tempData = data.split('<h1 style="');
    return _arkCourseC.detailCourseJRC.value.data.ikhtisar == ''
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
                child: Text(_arkCourseC.detailCourseJRC.value.data.ikhtisar,
                    style: const TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: kNewBlack2b,
                        height: 1.6)),
              ),
              const SizedBox(height: 16),
              if (_arkCourseC
                      .detailCourseRevamp.value.data[0].course!.tujuanUmum !=
                  '')
                HeaderandBody(
                    header: "Tujuan Umum",
                    body: _arkCourseC
                        .detailCourseRevamp.value.data[0].course!.tujuanUmum!),
              // if (_arkCourseC.detailClass.value.data![0].course!.tujuanKhusus! != '')
              //   HeaderandBodyHtml(
              //       header: "Tujuan Khusus",
              //       body:
              //           _arkCourseC.detailClass.value.data![0].course!.tujuanKhusus!),
              // if (_arkCourseC.detailClass.value.data![0].course!.sasaranKelompok! !=
              //     '')
              //   HeaderandBody(
              //       header: "Sasaran Kelompok Kerja",
              //       body: _arkCourseC
              //           .detailClass.value.data![0].course!.sasaranKelompok!),
              // if (_arkCourseC.detailClass.value.data![0].course!.sasaranKompetensi! !=
              //     '')
              //   HeaderandBody(
              //       header: "Peluang atas kompetensi Pelatihan",
              //       body: _arkCourseC
              //           .detailClass.value.data![0].course!.sasaranKompetensi!),
              if (_arkCourseC.detailCourseRevamp.value.data[0].course!
                          .sertifikatKelulusanDesc! !=
                      '' ||
                  _arkCourseC.detailCourseRevamp.value.data[0].course!
                          .sertifikatKelulusanDesc! !=
                      ' ')
                HeaderandBodyHtml(
                    header: "Sertifikat Kelulusan",
                    body: _arkCourseC.detailCourseRevamp.value.data[0].course!
                        .sertifikatKelulusanDesc!),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Kategori kursus',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  _arkCourseC.detailCourseJRC.value.data.subCategory,
                  style: const TextStyle(
                      fontFamily: 'SourceSansPro',
                      height: 1.5,
                      color: kNewBlack2a),
                ),
              ),

              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Metode Ajar',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                    '- Self-paced Learning dengan Pre-Test pada setiap modul dan Post-Test pada akhir kelas untuk menguji pemahaman materi.\n- Video ajar berdurasi rata-rata 10 menit/video.\n- Slide materi PDF.',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        height: 1.5,
                        color: kNewBlack2a)),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Evaluasi pembelajaran',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Pre-test pada setiap modul dan post-test di akhir pelatihan. Dibutuhkan nilai minimal 60 untuk lulus pada pelatihan ini.',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        height: 1.5,
                        color: kNewBlack2a),
                  )),
              if (_arkCourseC.detailCourseRevamp.value.data[0].course!
                          .standarKompetensi! !=
                      '' ||
                  _arkCourseC.detailCourseRevamp.value.data[0].course!
                          .standarKompetensi! !=
                      ' ')
                HeaderandBody(
                    header: 'Standar kompetensi',
                    body: _arkCourseC.detailCourseRevamp.value.data[0].course!
                        .standarKompetensi!),
              if (_arkCourseC.detailCourseRevamp.value.data.isEmpty &&
                  _arkCourseC.detailCourseRevamp.value.data[0].course!
                          .courseDurationTime !=
                      "")
                HeaderandBody(
                    header: "Durasi akses masuk kursus",
                    body:
                        'Siswa mendapatkan akses masuk ke kelas ${_arkCourseC.detailCourseRevamp.value.data[0].course!.courseDurationTime!} selama hari'),
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          header,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      const SizedBox(height: 12),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(body,
            style: const TextStyle(
              fontFamily: 'SourceSansPro',
              height: 1.5,
              fontWeight: FontWeight.normal,
              color: kNewBlack2a,
            )),
      ),
    ]);
  }
}

class HeaderandBodyHtml extends StatelessWidget {
  final String header;
  final String body;

  const HeaderandBodyHtml({required this.header, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          header,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      const SizedBox(height: 12),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          parseHtmlString(body),
          style: const TextStyle(
              fontFamily: 'SourceSansPro', color: kNewBlack2a, height: 1.5),
        ),
      ),
    ]);
  }
}
