import 'package:ark_module_course/utils/app_color.dart';
import 'package:flutter/material.dart';

class ArkCardForDescription extends StatelessWidget {
  final String title;
  final List listOfCard;
  final Color cardColor;

  const ArkCardForDescription(this.title, this.listOfCard, this.cardColor,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13.5),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 22),
        child: Wrap(
          children: [
            for (int i = 1; i <= listOfCard.length; i++)
              Container(
                margin: const EdgeInsets.only(top: 3, bottom: 3, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kNewBlack4,
                    width: 0.6,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  child: Text(
                    listOfCard[i - 1],
                    style: const TextStyle(
                      color: kNewBlack2a,
                      fontFamily: 'SourceSansPro',
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
          ],
        ),
      )
    ]);
  }
}
