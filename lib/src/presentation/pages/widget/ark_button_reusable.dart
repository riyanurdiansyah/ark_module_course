import 'package:flutter/material.dart';

class ButtonReusableWidgets extends StatelessWidget {
  final bool isOutlinedButton;
  final VoidCallback onPressed;
  String? title;
  Widget? widget;
  double? width;
  double? height;
  MaterialStateProperty<OutlinedBorder>? shapeOutline;
  List<Color>? colorGradient;
  TextStyle? titleStyle;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  BorderRadiusGeometry? borderRadius;
  OutlinedBorder? shape;
  Color? backgroundColor;
  MaterialStateProperty<Color?>? backgroundColorOutline;
  MaterialStateProperty<EdgeInsetsGeometry?>? paddingOutline;
  MaterialStateProperty<Size?>? minimumSize;
  MaterialStateProperty<Size?>? maximumSize;
  MaterialStateProperty<Size?>? fixedSize;
  MaterialStateProperty<BorderSide?>? borderSide;
  Gradient? isGradient;

  ButtonReusableWidgets({
    Key? key,
    required this.isOutlinedButton,
    required this.onPressed,
    this.widget,
    this.title,
    this.height,
    this.maximumSize,
    this.minimumSize,
    this.fixedSize,
    this.paddingOutline,
    this.shapeOutline,
    this.borderSide,
    this.borderRadius,
    this.margin,
    this.width,
    this.backgroundColorOutline,
    this.colorGradient,
    this.isGradient,
    this.titleStyle,
    this.shape,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOutlinedButton == true
        ? SizedBox(
            width: width,
            height: height,
            child: OutlinedButton(
              style: ButtonStyle(
                shape: shapeOutline,
                backgroundColor: backgroundColorOutline,
                padding: paddingOutline,
                minimumSize: minimumSize,
                maximumSize: maximumSize,
                fixedSize: fixedSize,
                side: borderSide,
              ),
              onPressed: onPressed,
              child: widget ??
                  Center(
                    child: Text(
                      title!,
                      style: titleStyle,
                    ),
                  ),
            ),
          )
        : InkWell(
            onTap: onPressed,
            child: Container(
              width: width,
              height: height,
              padding: padding,
              margin: margin,
              decoration: BoxDecoration(
                color: isGradient == null ? backgroundColor : null,
                borderRadius: borderRadius,
                gradient: isGradient != null
                    ? LinearGradient(
                        //You have be able to inizialized colors as []
                        //Then you can put the colors as you want on property 'colorGradient'
                        colors: colorGradient ??
                            const [
                              Color(0xff0977BE),
                              Color(0xff139DD6),
                            ],
                      )
                    : null,
              ),
              child: widget ??
                  Center(
                    child: Text(
                      title!,
                      style: titleStyle,
                    ),
                  ),
            ),
          );
  }
}
