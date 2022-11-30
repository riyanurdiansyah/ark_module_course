import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_color.dart';

class ArkRowWithImageAndDescription extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String? superSubtitle;
  final String? description;
  final bool needSuperSubtitle;
  TextStyle? textStyle;

  ArkRowWithImageAndDescription({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.textStyle,
    this.superSubtitle,
    this.description,
    this.needSuperSubtitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyle ??
              const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imagePath == '' ? '' : imagePath,
              width: 80,
              height: 80,
              errorWidget: (context, error, stackTrace) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/arkademi-icon.png',
                    width: Get.size.width,
                    fit: BoxFit.fill,
                    color: Colors.blue,
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  needSuperSubtitle == false
                      ? const SizedBox(height: 5)
                      : Padding(
                          padding: const EdgeInsets.only(top: 1, bottom: 5),
                          child: Text(
                            superSubtitle!,
                            style: const TextStyle(color: kNewBlack3),
                          ),
                        ),
                  Text(description!),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

// class RowWithImageAndDescriptionList extends StatelessWidget {

//   final String title;

//   RowWithImageAndDescriptionList({
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//         const SizedBox(height: 16),
//         ListView.builder(
//           physics: const ScrollPhysics(),
//           shrinkWrap: true,
//           itemCount:
//               _arkCC.detailClass.value.data![0].course!.instructors!.length,
//           itemBuilder: (context, i) {
//             return Obx(
//               () => Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (_arkCC.detailClass.value.data![0].course!.instructors!
//                       .isNotEmpty)
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Image.network(
//                             _arkCC.detailClass.value.data![0].course!
//                                 .instructors![0].avatar!,
//                             width: 80,
//                             height: 80),
//                       ],
//                     ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(
//                               left: _arkCC.detailClass.value.data![0].course!
//                                       .instructors!.isNotEmpty
//                                   ? 8
//                                   : 0),
//                           child: Text(
//                             _arkCC.detailClass.value.data![0].course!
//                                 .instructors![i].name!,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.w700, fontSize: 15),
//                           ),
//                         ),
//                         //  _arkCC.detailClass.value.data![0].course!.instructors!.isEmpty
//                         //       ? const SizedBox(height: 6)
//                         //       : Padding(
//                         //           padding:
//                         //               const EdgeInsets.only(top: 1, bottom: 5),
//                         //           child: Html(
//                         //             data: _arkCC.detailClass.value.data![0].course!.instructors![i].bio,
//                         //             style: {
//                         //               "html": Style(
//                         //                   color: kNewBlack3,
//                         //                   fontSize: const FontSize(12)),
//                         //             },
//                         //           ),
//                         //         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               left: _arkCC.detailClass.value.data![0].course!
//                                       .instructors!.isNotEmpty
//                                   ? 8
//                                   : 0),
//                           child: Text(
//                               _arkCC.detailClass.value.data![0].course!
//                                   .instructors![i].bio!,
//                               style: const TextStyle(fontSize: 13)),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//         )
//       ],
//     );
//   }
// }
