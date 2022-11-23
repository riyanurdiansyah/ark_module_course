import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/services/firebase_analytics.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArkUlasanSectionJrc extends StatelessWidget {
  ArkUlasanSectionJrc({Key? key}) : super(key: key);

  final _arkCourseC = Get.find<ArkCourseController>();
  List reviewUsed = [];

  static const List review18743757 = [
    {
      'image': 'assets/images/job_ready_course/testimoni_1.png',
      'name': 'Hery Irawan',
      'detail':
          'Saya sangat terbantu dengan adanya kursus di Arkademi, saya bisa mengetahui strategi dan skill untuk mendapatkan suatu pekerjaan. Terima kasih!'
    },
    {
      'image': 'assets/images/job_ready_course/testimoni_2.png',
      'name': 'Rusni',
      'detail':
          'Kursus-kursusnya sangat mudah dimengerti. Saya bisa mendapatkan pengetahuan baru dan skill baru untuk bekal saya di dunia kerja.'
    },
    {
      'image': 'assets/images/job_ready_course/testimoni_3.png',
      'name': 'Imam Saputra',
      'detail':
          'Terima kasih banyak, saya mendapatkan banyak pengalaman dan pembelajaran yang luar biasa untuk menambah soft skill pribadi saya dalam perkantoran.'
    },
  ];
  static const List review18758665 = [
    {
      'image': 'assets/images/job_ready_course/testimoni_4.png',
      'name': 'Roberth Susanto',
      'detail':
          'Saya merasa senang karena saya telah mendapatkan ilmu bagaimana cara meningkatkan pertumbuhan bisnis. Sangat berharga sekali bagi saya. Saya juga jadi mengetahui fundamental SEO itu sendiri. Terima kasih Arkademi.'
    },
    {
      'image': 'assets/images/job_ready_course/testimoni_5.png',
      'name': 'Annisa Melati',
      'detail':
          'Kursus ini sangat bagus, dari sini aku bisa belajar mengembangkan bisnis. Sukses selalu Arkademi.'
    },
    {
      'image': 'assets/images/job_ready_course/testimoni_6.png',
      'name': 'Tama Fatra',
      'detail':
          'Saya senang belajar di Arkademi. Saya bisa mendapatkan banyak pengetahuan dengan materi yang berkualitas.'
    },
  ];
  static const List review18762387 = [
    {
      'image': 'assets/images/job_ready_course/testimoni_7.png',
      'name': 'Sarihon Pandiangan',
      'detail':
          'Pelatihanya sangat berguna dan bagus. Terima kasih Arkademi sukses selalu.'
    },
    {
      'image': 'assets/images/job_ready_course/testimoni_8.png',
      'name': 'Siti Maria',
      'detail': 'Bagus dalam penjelasan secara teliti dan lugas.'
    },
    {
      'image': 'assets/images/job_ready_course/testimoni_9.png',
      'name': 'Novitaa',
      'detail':
          'Alhamdulillah dengan adanya pelatihan ini saya dapat ilmu yang sangat bermanfaaț bagi saya dan materinya sangat mudah di pahami.'
    },
  ];
  static const List review18763080 = [
    {
      'image': 'assets/images/job_ready_course/testimoni_10.png',
      'name': 'Josa Samudro',
      'detail':
          'Sangat terbantu dg lembaga ini. Materi belajar mudah dipahami dan simpel.'
    },
    {
      'image': 'assets/images/job_ready_course/testimoni_11.png',
      'name': 'Amir Lutfi',
      'detail':
          'Alhamdulillah akhirnya dapat menyelesaikan semua video, pelajaran yang sangat bermanfaat. Terima kasih.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('id', timeago.IdMessages());
    _arkCourseC.fetchUlasan(1);
    if (_arkCourseC.detailCourse.value.id == 18743757) {
      reviewUsed = review18743757;
    } else if (_arkCourseC.detailCourse.value.id == 18758665) {
      reviewUsed = review18758665;
    } else if (_arkCourseC.detailCourse.value.id == 18762387) {
      reviewUsed = review18762387;
    } else if (_arkCourseC.detailCourse.value.id == 18763080) {
      reviewUsed = review18763080;
    }
    return Obx(
      () => _arkCourseC.ulasan.value.data.data.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 0.6, color: kNewBlack4))),
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 20),
                      child: Row(
                        children: [
                          const Text(
                            '5.0',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingBar.builder(
                                  itemSize: 21,
                                  ignoreGestures: true,
                                  initialRating: 4.8,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  itemPadding:
                                      const EdgeInsets.only(right: 1.5),
                                  itemBuilder: (context, _) => Image.asset(
                                        'assets/images/job_ready_course/star_yellow.png',
                                        fit: BoxFit.fill,
                                        color: const Color.fromARGB(
                                            255, 241, 190, 22),
                                      ),
                                  onRatingUpdate: (_) {}),
                              const SizedBox(height: 5),
                              const Padding(
                                padding: EdgeInsets.only(left: 1.5),
                                child: Text(
                                  'rating dari alumni',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.5),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 6),
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: reviewUsed.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                        reviewUsed[index]['image'],
                                        width: 34,
                                        height: 34,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 13),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: Get.width * 0.3,
                                                  child: Text(
                                                    reviewUsed[index]['name'],
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4),
                                                  child: Text(
                                                    '${index + 1} jam yang lalu',
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            'SourceSansPro',
                                                        fontSize: 10,
                                                        color: kNewBlack3,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            RatingBar.builder(
                                              itemSize: 12,
                                              ignoreGestures: true,
                                              initialRating: 5,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                                  const EdgeInsets.only(
                                                      right: 2),
                                              itemBuilder: (context, _) =>
                                                  Image.asset(
                                                'assets/images/job_ready_course/star_yellow.png',
                                                fit: BoxFit.fill,
                                                color: const Color.fromARGB(
                                                    255, 241, 190, 22),
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                            Container(
                                              width: Get.width * 0.7,
                                              margin: const EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: Text(
                                                reviewUsed[index]['detail'],
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    height: 1.5,
                                                    fontFamily:
                                                        'SourceSansPro'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                        const SizedBox(height: 30),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _arkCourseC.userStatus.value.userExpiry != '' &&
                            _arkCourseC.userStatus.value.userStatus == '4'
                        ? Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0, vertical: 15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      width: 2, color: kPrimaryColor),
                                ),
                              ),
                              onPressed: () {
                                // Get.to(() => AddReviewPage());
                              },
                              child: const Text(
                                "BERIKAN ULASAN KELAS",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 50)
                  ]),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 0.6, color: kNewBlack4))),
                      padding: const EdgeInsets.only(
                          left: 13, right: 13, bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            _arkCourseC.detailCourse.value.averageRating == '0'
                                ? '4.8'
                                : _arkCourseC.detailCourse.value.averageRating,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingBar.builder(
                                  itemSize: 21,
                                  ignoreGestures: true,
                                  initialRating: _arkCourseC.detailCourse.value
                                              .averageRating ==
                                          '0'
                                      ? 4.8
                                      : double.parse(_arkCourseC
                                              .detailCourse.value.averageRating)
                                          .ceil()
                                          .toDouble(),
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  itemPadding:
                                      const EdgeInsets.only(right: 1.5),
                                  itemBuilder: (context, _) => Image.asset(
                                        'assets/images/job_ready_course/star_yellow.png',
                                        fit: BoxFit.fill,
                                        color: const Color.fromARGB(
                                            255, 241, 190, 22),
                                      ),
                                  onRatingUpdate: (_) {}),
                              const SizedBox(height: 5),
                              const Padding(
                                padding: EdgeInsets.only(left: 1.5),
                                child: Text(
                                  'rating dari alumni',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.5),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 6),
                        Obx(
                          () => _arkCourseC.isLoadingUlasan.value == false &&
                                  _arkCourseC.ulasan.value.data.data.isEmpty
                              ? const Text('belum ada review')
                              : _arkCourseC.isLoadingUlasan.value == true
                                  ? SizedBox(
                                      height: 700,
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            CircularProgressIndicator(),
                                            SizedBox(height: 15),
                                            Text('Mohon tunggu...',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                      itemCount: _arkCourseC
                                          .ulasan.value.data.data.length,
                                      itemBuilder: (context, index) {
                                        final now = DateTime.now();
                                        final difference = now.difference(
                                            _arkCourseC.ulasan.value.data
                                                .data[index].commentDate);
                                        final timez = timeago.format(
                                            now.subtract(difference),
                                            locale: 'id');
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: _arkCourseC
                                                            .ulasan
                                                            .value
                                                            .data
                                                            .data[index]
                                                            .avatarAuthor ==
                                                        ''
                                                    ? Image.asset(
                                                        'assets/images/fr_default_face.png',
                                                        fit: BoxFit.fill,
                                                        height: 50,
                                                        width: 50,
                                                      )
                                                    : Image.network(
                                                        _arkCourseC
                                                            .ulasan
                                                            .value
                                                            .data
                                                            .data[index]
                                                            .avatarAuthor,
                                                        width: 34,
                                                        height: 34,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                              const SizedBox(width: 13),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                Get.width * 0.3,
                                                            child: Text(
                                                              _arkCourseC
                                                                  .ulasan
                                                                  .value
                                                                  .data
                                                                  .data[index]
                                                                  .nameAuthor,
                                                              style: const TextStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 4),
                                                            child: Text(
                                                              timez,
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      'SourceSansPro',
                                                                  fontSize: 10,
                                                                  color:
                                                                      kNewBlack3,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(height: 8),
                                                      RatingBar.builder(
                                                        itemSize: 12,
                                                        ignoreGestures: true,
                                                        initialRating: double
                                                            .parse(_arkCourseC
                                                                .ulasan
                                                                .value
                                                                .data
                                                                .data[index]
                                                                .reviewRating),
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                .only(right: 2),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                Image.asset(
                                                          'assets/images/job_ready_course/star_yellow.png',
                                                          fit: BoxFit.fill,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              241, 190, 22),
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {},
                                                      ),
                                                      Container(
                                                        width: Get.width * 0.7,
                                                        margin: const EdgeInsets
                                                            .only(
                                                          top: 10,
                                                        ),
                                                        child: Text(
                                                          _arkCourseC
                                                              .ulasan
                                                              .value
                                                              .data
                                                              .data[index]
                                                              .commentContent,
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              height: 1.5,
                                                              fontFamily:
                                                                  'SourceSansPro'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 16),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                            width: 0.7, color: kNewBlack4)),
                                    child: Obx(() => Text(_arkCourseC
                                        .ratingPage.value
                                        .toString()))),
                                Obx(
                                  () => Text(
                                    '  dari ${_arkCourseC.ulasan.value.data.lastPage}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Obx(
                                  () => SizedBox(
                                    width: 30,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5)),
                                        ),
                                        primary: const Color.fromRGBO(
                                            229, 230, 233, 1),
                                        onSurface: kNewBlack4,
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: _arkCourseC.ratingPage.value ==
                                              1
                                          ? null
                                          : () async {
                                              _arkCourseC.ratingPage.value--;
                                              _arkCourseC.onPrevUlasan();
                                            },
                                      child: Icon(Icons.chevron_left,
                                          color:
                                              _arkCourseC.ratingPage.value == 1
                                                  ? kNewBlack3
                                                  : kNewBlack2b),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => SizedBox(
                                    width: 30,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5)),
                                        ),
                                        primary: const Color.fromRGBO(
                                            229, 230, 233, 1),
                                        onSurface: kNewBlack4,
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: _arkCourseC.ratingPage.value ==
                                              _arkCourseC
                                                  .ulasan.value.data.lastPage
                                          ? null
                                          : () async {
                                              AppFirebaseAnalyticsService().addLog(
                                                  'mbl_prj_jrc_p1_click_btn_next_ulasan');
                                              _arkCourseC.ratingPage.value++;
                                              _arkCourseC.onNextUlasan();
                                            },
                                      child: Icon(Icons.chevron_right,
                                          color: _arkCourseC.ratingPage.value ==
                                                  _arkCourseC.ulasan.value.data
                                                      .lastPage
                                              ? kNewBlack3
                                              : kNewBlack2b),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _arkCourseC.userStatus.value.userExpiry != '' &&
                            _arkCourseC.userStatus.value.userStatus == '4'
                        ? Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0, vertical: 15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      width: 2, color: kPrimaryColor),
                                ),
                              ),
                              onPressed: () {
                                // Get.to(() => AddReviewPage());
                              },
                              child: const Text(
                                "BERIKAN ULASAN KELAS",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 50)
                  ]),
            ),
    );
  }
}
