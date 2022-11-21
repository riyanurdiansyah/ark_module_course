import 'package:ark_module_course/ark_module_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ArkUlasanSectionCouseRevamp extends StatefulWidget {
  const ArkUlasanSectionCouseRevamp({Key? key}) : super(key: key);

  @override
  State<ArkUlasanSectionCouseRevamp> createState() =>
      _ArkUlasanSectionCouseRevampState();
}

class _ArkUlasanSectionCouseRevampState
    extends State<ArkUlasanSectionCouseRevamp> {
  final _arkCC = Get.find<ArkCourseController>();

  @override
  void initState() {
    super.initState();
    _arkCC.fetchUlasan(_arkCC.ratingPage.value);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _arkCC.isLoadingUlasan.isTrue
          ? const SizedBox(
              height: 150,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : _arkCC.ulasan.value.data == null
              ? Container(
                  height: 200,
                  width: Get.size.width,
                  alignment: Alignment.center,
                  child: const Text('Belum ada review'))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _arkCC.courseRevamp.value.data.testimoni.isEmpty
                        ? const SizedBox()
                        : const SizedBox(
                            height: 36,
                          ),
                    _arkCC.courseRevamp.value.data.testimoni.isEmpty
                        ? const SizedBox()
                        : const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                            ),
                            child: Text(
                              'Testimoni Alumni',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                    _arkCC.courseRevamp.value.data.testimoni.isEmpty
                        ? const SizedBox()
                        : const SizedBox(
                            height: 14,
                          ),
                    _arkCC.courseRevamp.value.data.testimoni.isEmpty
                        ? const SizedBox()
                        : SizedBox(
                            height: 300,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                ),
                                itemCount: _arkCC
                                    .courseRevamp.value.data.testimoni.length,
                                itemBuilder: (context, index) {
                                  // var dataUlasan =
                                  //     _arkCC.reviewPerPage.value.data!.data![index];
                                  return Container(
                                    margin: const EdgeInsets.only(right: 11),
                                    width: 279,
                                    height: 300,
                                    child: Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          height: 232,
                                          width: 279,
                                          margin:
                                              const EdgeInsets.only(top: 30),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            border: Border.all(
                                                color: Color(0xffC9CBCF)),
                                          ),
                                        ),
                                        _arkCC
                                                        .courseRevamp
                                                        .value
                                                        .data
                                                        .testimoni[index]
                                                        .image ==
                                                    null ||
                                                _arkCC
                                                        .courseRevamp
                                                        .value
                                                        .data
                                                        .testimoni[index]
                                                        .image ==
                                                    ""
                                            // dataUlasan.avatarAuthor == ''
                                            ? Align(
                                                alignment: Alignment.topCenter,
                                                child: Image.asset(
                                                  'assets/images/fr_default_face.png',
                                                  // fit: BoxFit.fill,
                                                  height: 70,
                                                  width: 70,
                                                ),
                                              )
                                            : Align(
                                                alignment: Alignment.topCenter,
                                                child: ClipOval(
                                                  child: SizedBox(
                                                    width: 70,
                                                    height: 70,
                                                    child: Image.network(_arkCC
                                                        .courseRevamp
                                                        .value
                                                        .data
                                                        .testimoni[index]
                                                        .image!),
                                                  ),
                                                ),
                                              ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 83,
                                              ),
                                              Text(
                                                _arkCC.courseRevamp.value.data
                                                    .testimoni[index].nama!,
                                                // dataUlasan.nameAuthor!,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w800,
                                                  color: Color(0xff1C1D20),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              RatingBar.builder(
                                                  itemSize: 21,
                                                  ignoreGestures: true,
                                                  initialRating: _arkCC
                                                              .courseRevamp
                                                              .value
                                                              .data
                                                              .rating
                                                              .rating
                                                          // dataUlasan.reviewRating
                                                          ==
                                                          '0'
                                                      ? 4.8
                                                      : double.parse(_arkCC
                                                                  .courseRevamp
                                                                  .value
                                                                  .data
                                                                  .rating
                                                                  .rating
                                                              // dataUlasan
                                                              //     .reviewRating!,
                                                              )
                                                          .ceil()
                                                          .toDouble(),
                                                  minRating: 0,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: false,
                                                  itemCount: 5,
                                                  itemPadding:
                                                      const EdgeInsets.only(
                                                          right: 1.5),
                                                  itemBuilder: (context, _) =>
                                                      Image.asset(
                                                        'assets/images/job_ready_course/star_yellow.png',
                                                        fit: BoxFit.fill,
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 241, 190, 22),
                                                      ),
                                                  onRatingUpdate: (_) {}),
                                              const SizedBox(
                                                height: 11,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: Text(
                                                  _arkCC.courseRevamp.value.data
                                                      .testimoni[index].ulasan!,
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff1C1D20),
                                                    fontStyle: FontStyle.italic,
                                                    height: 1.5,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ulasan Alumni',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff1C1D20),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                _arkCC.detailCourseRevamp.value.data[0].course!
                                    .averageRating!,
                                style: const TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff1C1D20),
                                ),
                              ),
                              const SizedBox(
                                width: 13,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RatingBar.builder(
                                      itemSize: 21,
                                      ignoreGestures: true,
                                      initialRating: _arkCC
                                                  .detailCourseRevamp
                                                  .value
                                                  .data[0]
                                                  .course!
                                                  .averageRating! ==
                                              '0'
                                          ? 4.8
                                          : double.parse(_arkCC
                                                  .detailCourseRevamp
                                                  .value
                                                  .data[0]
                                                  .course!
                                                  .averageRating!)
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
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'rating dari alumni',
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff5A5C60),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      _arkCC.ulasan.value.data.data.length,
                                  itemBuilder: (context, index) {
                                    var data =
                                        _arkCC.ulasan.value.data.data[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 22,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // data.avatarAuthor == '' ||
                                          data.avatarAuthor == 'belum upload'
                                              ? Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Image.asset(
                                                    'assets/images/fr_default_face.png',
                                                    // fit: BoxFit.fill,
                                                    height: 34,
                                                    width: 34,
                                                  ),
                                                )
                                              : ClipOval(
                                                  child: Image.network(
                                                    // _arkCC.courseRevamp.value.data!
                                                    //     .testimoni![index].image!,
                                                    data.avatarAuthor,
                                                    width: 34,
                                                    height: 34,
                                                  ),
                                                ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data.nameAuthor,
                                                  style: const TextStyle(
                                                    fontSize: 12.5,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff1C1D20),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 6.39,
                                                ),
                                                RatingBar.builder(
                                                    itemSize: 11,
                                                    ignoreGestures: true,
                                                    initialRating: data
                                                                .reviewRating ==
                                                            '0'
                                                        ? 4.8
                                                        : double.parse(data
                                                                .reviewRating)
                                                            .ceil()
                                                            .toDouble(),
                                                    minRating: 0,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: false,
                                                    itemCount: 5,
                                                    itemPadding:
                                                        const EdgeInsets.only(
                                                            right: 1.5),
                                                    itemBuilder: (context, _) =>
                                                        Image.asset(
                                                          'assets/images/job_ready_course/star_yellow.png',
                                                          fit: BoxFit.fill,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              241, 190, 22),
                                                        ),
                                                    onRatingUpdate: (_) {}),
                                                const SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  data.commentContent,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 21),
                                  alignment: Alignment.topRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 28,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                            color: const Color(0xffC0C2C6),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(_arkCC.ratingPage.value
                                              .toString()),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          'dari ${_arkCC.ulasan.value.data.lastPage}'),
                                      const SizedBox(
                                        width: 9,
                                      ),
                                      InkWell(
                                        onTap: _arkCC.ratingPage.value == 1
                                            ? null
                                            : () {
                                                _arkCC.ratingPage.value--;
                                                _arkCC.fetchUlasan(
                                                    _arkCC.ratingPage.value);
                                              },
                                        child: Container(
                                          height: 28,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(7),
                                              bottomLeft: Radius.circular(7),
                                            ),
                                            color: _arkCC.ratingPage.value == 1
                                                ? const Color(0xffE5E6E9)
                                                : const Color(0xffF1F2F4),
                                          ),
                                          child: const Icon(
                                            Icons.chevron_left,
                                            color: Color(0xffC0C2C6),
                                            size: 14,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: _arkCC.ratingPage.value ==
                                                _arkCC
                                                    .ulasan.value.data.lastPage
                                            ? null
                                            : () {
                                                _arkCC.ratingPage.value++;
                                                _arkCC.fetchUlasan(
                                                    _arkCC.ratingPage.value);
                                              },
                                        child: Container(
                                          height: 28,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(7),
                                              bottomRight: Radius.circular(7),
                                            ),
                                            color: _arkCC.ratingPage.value ==
                                                    _arkCC.ulasan.value.data
                                                        .lastPage
                                                ? const Color(0xffF1F2F4)
                                                : const Color(0xffE5E6E9),
                                          ),
                                          child: const Icon(
                                            Icons.chevron_right,
                                            color: Color(0xffC0C2C6),
                                            size: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                  ],
                ),
    );
  }
}
