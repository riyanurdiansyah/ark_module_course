import 'package:ark_module_course/ark_module_course.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkJoinClassBtm extends StatelessWidget {
  ArkJoinClassBtm({Key? key}) : super(key: key);

  final _courseC = Get.find<ArkCourseController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_courseC.detailCourse.value.discount.round() != 0)
            Text(
              "Diskon ${_courseC.detailCourse.value.discount.round()}%",
              style: AppStyleText.styleMontserrat(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          // if(_courseC.detailCourse.value.)
          Row(
            children: [
              Text(
                _courseC.detailCourse.value.salePrice != "0"
                    ? currencyFormatter.format(
                        int.parse(
                          _courseC.detailCourse.value.salePrice,
                        ),
                      )
                    : currencyFormatter.format(
                        int.parse(
                          _courseC.detailCourse.value.regularPrice,
                        ),
                      ),
                style: const TextStyle(
                  fontSize: 17.2,
                  fontWeight: FontWeight.w800,
                  color: kNewBlack2a,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              if (_courseC.detailCourse.value.salePrice != "0")
                Text(
                  currencyFormatter.format(
                    int.parse(
                      _courseC.detailCourse.value.regularPrice,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              const Spacer(),
              Image.asset(
                "assets/images/coins.png",
                width: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              RichText(
                text: TextSpan(
                  text: "Cashback ",
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text:
                          "${numberFormat.format(int.parse(_courseC.detailCourse.value.coinCashback))} koin",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    CupertinoIcons.heart,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    primary: const Color.fromRGBO(243, 130, 46, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "GABUNG KE PELATIHAN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
