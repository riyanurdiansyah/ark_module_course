import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:ark_module_setup/utils/app_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArkUlasanSection extends StatelessWidget {
  const ArkUlasanSection({
    Key? key,
    required this.isLoading,
    required this.ulasan,
    required this.course,
    required this.ratingPage,
    required this.onPrevPage,
    required this.onNextPage,
    required this.userStatus,
  }) : super(key: key);

  final bool isLoading;
  final UlasanEntity ulasan;
  final CourseDataEntity course;
  final int ratingPage;
  final VoidCallback onPrevPage;
  final VoidCallback onNextPage;
  final UserStatusEntity userStatus;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        child: Column(
          children: List.generate(
            5,
            (index) => AppShimmer.listTile(height: 80),
          ),
        ),
      );
    }

    ///IF REVIEW IS EMPTY
    if (ulasan.data.data.isEmpty) {
      return SizedBox(
        height: 200,
        child: Text(
          "Belum ada review",
          style: AppStyleText.styleMontserrat(
            fontSize: 12,
            color: Colors.grey.shade400,
          ),
        ),
      );
    }

    ///IF CLASS HAVE REVIEW
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review (${course.ratingCount})',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                course.averageRating,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              RatingBar.builder(
                itemSize: 20,
                ignoreGestures: true,
                initialRating: course.averageRating.isEmpty
                    ? 5.0
                    : double.parse(course.averageRating),
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (_) {},
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          ListView.separated(
            itemCount: ulasan.data.data.length,
            separatorBuilder: (context, _) {
              return const Divider();
            },
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (_, i) {
              final data = ulasan.data.data[i];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: data.avatarAuthor.isEmpty
                            ? Image.asset(
                                'assets/images/fr_default_face.png',
                                fit: BoxFit.fill,
                                height: 50,
                                width: 50,
                              )
                            : CachedNetworkImage(
                                imageUrl: data.avatarAuthor,
                                width: 34,
                                height: 34,
                                fit: BoxFit.cover,
                                errorWidget: (_, __, ___) => Image.asset(
                                  'assets/images/fr_default_face.png',
                                  fit: BoxFit.fill,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              data.nameAuthor,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(height: 3),
                          RatingBar.builder(
                            itemSize: 13,
                            ignoreGestures: true,
                            initialRating: double.parse(data.reviewRating),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.commentContent,
                    style: const TextStyle(
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text('$ratingPage dari ${ulasan.data.lastPage}'),
            const SizedBox(width: 10),
            SizedBox(
              width: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  primary: Colors.white54,
                  onSurface: kNewBlack4,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  if (ratingPage != 1) {
                    onPrevPage();
                  }
                },
                child: Icon(
                  Icons.chevron_left,
                  color: ratingPage == 1 ? kNewBlack3 : kNewBlack2a,
                ),
              ),
            ),
            SizedBox(
              width: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  primary: Colors.white60,
                  onSurface: kNewBlack4,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  if (ratingPage != ulasan.data.lastPage) {
                    onNextPage();
                  }
                },
                child: Icon(
                  Icons.chevron_right,
                  color: ratingPage == ulasan.data.lastPage
                      ? kNewBlack3
                      : kNewBlack2a,
                ),
              ),
            ),
          ]),
          if (userStatus.userExpiry != "" && userStatus.userStatus == "4")
            const SizedBox(height: 20),
          if (userStatus.userExpiry != "" && userStatus.userStatus == "4")
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(width: 2, color: kPrimaryColor),
                  ),
                ),
                onPressed: () {
                  // Get.to(() => AddReviewPage());
                },
                child: const Text(
                  "BERIKAN ULASAN KELAS",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w500),
                ),
              ),
            )
        ],
      ),
    );
  }
}
