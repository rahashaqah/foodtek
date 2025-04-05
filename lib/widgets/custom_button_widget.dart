import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPress;
  final Color backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double height;
  final String title;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? padding;
  final TextAlign? textAlign;

  const CustomButton({
    Key? key,
    required this.onPress,
    required this.backgroundColor,
    this.width,
    required this.height,
    required this.title,
    this.borderRadius,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.fontFamily,
    this.padding,
    this.textAlign,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 1),
              spreadRadius: 1.0,
              blurRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        height: height,
        alignment: Alignment.center,
        width: width,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
