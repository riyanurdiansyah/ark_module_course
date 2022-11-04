import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_begin_class_btm.dart';
import 'package:ark_module_course/src/presentation/pages/widget/ark_join_class_btm.dart';
import 'package:ark_module_course/utils/app_color.dart';
import 'package:ark_module_course/utils/app_constanta.dart';
import 'package:ark_module_course/utils/app_shimmer.dart';
import 'package:ark_module_course/widgets/ark_class_card.dart';
import 'package:ark_module_course/widgets/error_image_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ArkCoursePage extends StatelessWidget {
  ArkCoursePage({Key? key}) : super(key: key);

  final _courseC = Get.find<ArkCourseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kNewBlack2a,
        ),
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Kelas",
          style: TextStyle(
            color: kNewBlack2a,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ConnectivityWidgetWrapper(
        offlineCallback: () {},
        onlineCallback: () {},
        child: Obx(
          () => ListView(
            controller: _courseC.scrollControllerPage,
            shrinkWrap: true,
            children: [
              Obx(
                () => _courseC.isLoading.value
                    ? AppShimmer.loadImage(Get.width, 200)
                    : _courseC.isHaveVideo.value && _courseC.splitVid.length > 1
                        ? YoutubePlayerIFrame(
                            controller: _courseC.ytController,
                            aspectRatio: 16 / 9,
                          )
                        : CachedNetworkImage(
                            imageUrl: _courseC.detailCourse.value.featuredImage,
                            width: Get.width,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>
                                const ErrorImageWidget(
                              isImage: false,
                              height: 200,
                            ),
                          ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        AssetImage('assets/images/class_page_background.png'),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          _courseC.detailCourse.value.name,
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: Get.size.shortestSide < 600 ? 16 : 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ArkRowWithWidgetAndString(
                              leftWidget: RatingBar.builder(
                                itemSize:
                                    Get.size.shortestSide < 600 ? 14.5 : 20,
                                ignoreGestures: true,
                                initialRating: _courseC.detailCourse.value
                                        .averageRating.isEmpty
                                    ? 5
                                    : double.parse(_courseC
                                        .detailCourse.value.averageRating),
                                allowHalfRating: true,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 0.2),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (_) {},
                              ),
                              rightString:
                                  _courseC.detailCourse.value.averageRating,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ArkRowWithWidgetAndString(
                                leftWidget: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: Get.size.shortestSide < 600 ? 16 : 20,
                                ),
                                rightString: _courseC
                                    .detailCourse.value.totalStudents
                                    .toString(),
                              ),
                            ),
                            ArkRowWithWidgetAndString(
                              expandedRightString: true,
                              leftWidget: CachedNetworkImage(
                                imageUrl: _courseC
                                    .detailCourse.value.instructor.avatar.url,
                                width: 15,
                                height: 15,
                                errorWidget: (_, __, ___) => const SizedBox(),
                              ),
                              rightString:
                                  _courseC.detailCourse.value.instructor.name,
                            )
                          ],
                        ),
                      ),
                      if (_courseC.detailCourse.value.mpLinks.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            const Text(
                              'Tersedia juga di ',
                              style: TextStyle(
                                fontSize: 10,
                                color: kNewBlack6,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              children: List.generate(
                                _courseC.detailCourse.value.mpLinks.length,
                                (i) => InkWell(
                                  child: Card(
                                    margin: const EdgeInsets.only(
                                        top: 3, bottom: 3, right: 5),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: CachedNetworkImage(
                                        imageUrl: _courseC.detailCourse.value
                                            .mpLinks[i].mpLogo,
                                        height: 35,
                                        errorWidget: (context, url, error) {
                                          return Image.asset(
                                              'assets/images/logo_pintar_prakerja.png');
                                        },
                                        width: Get.size.width > width360Pixel
                                            ? 81
                                            : Get.size.width > width320Pixel
                                                ? 65
                                                : 50,
                                        placeholder: (context, url) {
                                          return SizedBox(
                                            height: 35,
                                            width: Get.size.width >
                                                    width360Pixel
                                                ? 70
                                                : Get.size.width > width320Pixel
                                                    ? 55
                                                    : 40,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  onTap: () => _courseC.onTapMplinks(i),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Container(
                  width: Get.size.width,
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ArkTabTitleClassPage(
                        tabIndex: _courseC.indexTabCourse.value,
                        indexCondition: 0,
                        title: 'Ikhtisar',
                        onTap: () => _courseC.onChangeTab(0),
                      ),
                      ArkTabTitleClassPage(
                        tabIndex: _courseC.indexTabCourse.value,
                        indexCondition: 1,
                        title: 'Kurikulum',
                        onTap: () => _courseC.onChangeTab(1),
                      ),
                      ArkTabTitleClassPage(
                        tabIndex: _courseC.indexTabCourse.value,
                        indexCondition: 2,
                        title: 'Ulasan',
                        onTap: () => _courseC.onChangeTab(2),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (_courseC.indexTabCourse.value == 0) {
                  return ArkIkhtisarSection();
                }

                if (_courseC.indexTabCourse.value == 1) {
                  return ArkKurikulumSection(
                    curriculums: _courseC.curriculum.value.data,
                    isLoading: _courseC.isLoadingCurriculums.value,
                  );
                }

                return ArkUlasanSection(
                  isLoading: _courseC.isLoadingUlasan.value,
                  course: _courseC.detailCourse.value,
                  ulasan: _courseC.ulasan.value,
                  ratingPage: _courseC.ratingPage.value,
                  onPrevPage: () => _courseC.onPrevUlasan(),
                  onNextPage: () => _courseC.onNextUlasan(),
                  userStatus: _courseC.userStatus.value,
                );
              }),
              Obx(() {
                if (_courseC.isLoadingSimiliar.value) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Kelas Serupa",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            children: List.generate(
                              5,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: AppShimmer.loadImage(
                                  Get.size.width * 0.44,
                                  200,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  );
                }
                if (_courseC.similiarClass.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Kelas Serupa",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            children: List.generate(
                              _courseC.similiarClass.length < 6
                                  ? _courseC.similiarClass.length
                                  : 6,
                              (index) => ArkClassCard(
                                course: _courseC.similiarClass[index].course,
                                onTapClass: () => _courseC.changeSourceCourse(
                                    _courseC.similiarClass[index]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  );
                }
                return const SizedBox(
                  height: 25,
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 6,
        child: Obx(() {
          if (_courseC.isLoadingUserStatus.value) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: AppShimmer.loadImage(Get.width, 50),
            );
          }

          if (_courseC.userStatus.value.userStatus.isEmpty) {
            return ArkJoinClassBtm();
          }

          return ArkBeginClassBtm();
        }),
      ),
    );
  }
}
