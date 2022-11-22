import 'package:ark_module_course/services/firebase_analytics.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArkFasilitatorJrcWidget extends StatelessWidget {
  // final _lcC = Get.find<LumenClassController>();
  final String imagePath;
  final String name;
  final String position;
  final String desc;
  final String instagramUrl;
  final String linkedinUrl;

  const ArkFasilitatorJrcWidget({
    required this.imagePath,
    required this.name,
    required this.position,
    required this.desc,
    required this.instagramUrl,
    required this.linkedinUrl,
  });
  //TODO

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fasilitator',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imagePath == ''
                  ? Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                      ),
                      height: 50,
                      width: 50,
                    )
                  : Image.network(imagePath, width: 50, height: 50),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (instagramUrl != '0')
                          GestureDetector(
                            onTap: () {
                              AppFirebaseAnalyticsService()
                                  .addLog('mbl_prj_jrc_p1_click_btn_ig');
                              launchUrl(Uri.parse(instagramUrl));
                            },
                            child: Image.asset(
                              'assets/images/job_ready_course/logo_instagram.png',
                              height: 17,
                              width: 17,
                              fit: BoxFit.fill,
                            ),
                          ),
                        const SizedBox(width: 4),
                        if (linkedinUrl != '')
                          GestureDetector(
                            onTap: () {
                              AppFirebaseAnalyticsService()
                                  .addLog('mbl_prj_jrc_p1_click_btn_linkedin');
                              launchUrl(Uri.parse(linkedinUrl));
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
                    position == ''
                        ? const SizedBox(height: 8)
                        : Padding(
                            padding: const EdgeInsets.only(top: 1, bottom: 5),
                            child: Text(
                              position,
                              style: const TextStyle(
                                  color: kNewBlack3,
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 11.5),
                            ),
                          ),
                    Text(
                      desc,
                      style: const TextStyle(
                          fontFamily: 'SourceSansPro', color: kNewBlack2b),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
