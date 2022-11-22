import 'package:ark_module_course/services/firebase_analytics.dart';
import 'package:ark_module_course/src/domain/entities/instruktur_jrc_entity.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArkListOfInstructorJrc extends StatelessWidget {
  final List<InstrukturJrcEntity> listUsed;

  const ArkListOfInstructorJrc({Key? key, required this.listUsed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Instruktur',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              for (int i = 0; i < listUsed.length; i++)
                Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        listUsed[i].avatarInstruktur == ''
                            ? Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kPrimaryColor,
                                ),
                                height: 50,
                                width: 50,
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.network(
                                  listUsed[i].avatarInstruktur!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                              ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    listUsed[i].namaInstruktur!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // if (listUsed[i].instagramInstruktur != '0')
                                  //   GestureDetector(
                                  //     onTap: () {
                                  //       launchUrl(Uri.parse(
                                  //           listUsed[i].instagramInstruktur!));
                                  //     },
                                  //     child: Image.asset(
                                  //       'assets/images/job_ready_course/logo_instagram.png',
                                  //       height: 17,
                                  //       width: 17,
                                  //       fit: BoxFit.fill,
                                  //     ),
                                  //   ),
                                  // const SizedBox(width: 4),
                                  if (listUsed[i].linkedinInstruktur != '')
                                    GestureDetector(
                                      onTap: () {
                                        AppFirebaseAnalyticsService().addLog(
                                            'mbl_prj_jrc_p1_click_btn_linkedin_inst');
                                        launchUrl(Uri.parse(
                                            listUsed[i].linkedinInstruktur!));
                                      },
                                      child: Image.asset(
                                        'assets/images/job_ready_course/logo_linkedin.png',
                                        height: 17,
                                        width: 18,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                ],
                              ),
                              listUsed[i].positionInstruktur == ''
                                  ? const SizedBox(height: 8)
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1, bottom: 5),
                                      child: Text(
                                        listUsed[i].positionInstruktur!,
                                        style: const TextStyle(
                                            color: kNewBlack3,
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 11.5),
                                      ),
                                    ),
                              Text(
                                listUsed[i].descriptionInstruktur!,
                                style: const TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: kNewBlack2b),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
            ],
          )
        ],
      ),
    );
  }
}
