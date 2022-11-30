//IMPLEMENT THIS REUSABLE WIDGETS
//USING PREFERED SIZE ON APP BAR
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiniAppBarReusableWidgets extends StatelessWidget {
  final bool isGradient;
  final String title;
  final bool isLeading;
  final EdgeInsetsGeometry? padding;
  VoidCallback? onTapLeftIcon;
  VoidCallback? onTapRigthIcon;
  VoidCallback? onTapBackIcon;
  bool? isShadow;
  List<BoxShadow>? boxShadow;
  double? spaceBackIcon;
  double? sizeBackIcon;
  IconData? leftIcon;
  Widget? rightIcon;
  IconData? backIcon;
  Color? iconColor;
  Color? backgrounColor;
  List<Color>? gradientColor;
  AlignmentGeometry? beginGradient;
  AlignmentGeometry? endGradient;
  TextStyle? titleTextStyle;

  MiniAppBarReusableWidgets({
    Key? key,
    required this.isGradient,
    required this.title,
    required this.isLeading,
    this.spaceBackIcon = 20,
    this.sizeBackIcon = 13,
    this.titleTextStyle,
    this.isShadow,
    this.boxShadow,
    this.padding,
    this.backIcon,
    this.backgrounColor,
    this.onTapLeftIcon,
    this.onTapRigthIcon,
    this.onTapBackIcon,
    this.leftIcon,
    this.rightIcon,
    this.iconColor,
    this.beginGradient,
    this.endGradient,
    this.gradientColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: padding ??
          const EdgeInsets.only(
            left: 15,
            top: 15,
            bottom: 15,
          ),
      decoration: isGradient == true
          ? BoxDecoration(
              boxShadow: isShadow == true
                  ? boxShadow != []
                      ? boxShadow
                      : [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 10,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 7), // changes position of shadow
                          ),
                        ]
                  : [],
              gradient: LinearGradient(
                begin:
                    beginGradient != null ? beginGradient! : Alignment.topLeft,
                end: endGradient != null ? endGradient! : Alignment.bottomRight,
                colors: gradientColor != null
                    ? gradientColor!
                    : [
                        const Color(0xFF139DD6),
                        const Color(0xFF0977BE),
                      ],
              ),
            )
          : BoxDecoration(
              color: backgrounColor,
            ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backIcon != null
                ? InkWell(
                    onTap: onTapBackIcon,
                    child: Icon(
                      backIcon,
                      color: iconColor,
                      size: sizeBackIcon,
                    ),
                  )
                : SizedBox(
                    width: backIcon == null ? 20 : 0,
                  ),
            SizedBox(
              width: backIcon != null ? 5 : 0,
            ),
            Expanded(
              child: Text(
                title,
                style: titleTextStyle ??
                    TextStyle(
                      color: Colors.white,
                      fontSize: Get.size.shortestSide < 600 ? 15 : 20,
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.ellipsis,
                    ),
                maxLines: 1,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            // const Spacer(),
            isLeading == true
                ? Row(
                    children: [
                      leftIcon != null
                          ? InkWell(
                              onTap: onTapLeftIcon,
                              child: Icon(
                                leftIcon,
                                color: iconColor,
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(
                        width: 20,
                      ),
                      rightIcon != null
                          ? InkWell(
                              onTap: onTapRigthIcon,
                              child: rightIcon,
                            )
                          : const SizedBox()
                    ],
                  )
                : const SizedBox(),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
