import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String? buttonText;
  final TextStyle? buttonTextStyle;
  final Color? buttonColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Widget? leftSideIcon;
  final Widget? rightSideIcon;
  final BoxShadow? buttonBoxShadow;
  final double? rightPadding;
  final double? leftPadding;
  final double? padding;

  const CustomButton({
    super.key,
    this.onTap,
    this.buttonText,
    this.buttonTextStyle,
    this.buttonColor,
    this.borderRadius,
    this.width,
    this.height,
    this.borderColor,
    this.leftSideIcon,
    this.rightSideIcon,
    this.buttonBoxShadow,
    this.rightPadding,
    this.leftPadding,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding ?? 8),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          // boxShadow: [
          //   buttonBoxShadow ??
          //       const BoxShadow(
          //         color: Colors.white24,
          //         offset: Offset(0, 0),
          //         blurRadius: 5,
          //         spreadRadius: .4,
          //       ),
          //   // BoxShadow(
          //   //   color: Colors.black,
          //   //   offset: Offset(0, 0),
          //   //   blurRadius: 5,
          //   //   spreadRadius: 1,
          //   // ),
          // ],
          border: Border.all(
            color: borderColor ?? AppColors.white,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftSideIcon != null ? leftSideIcon! : const SizedBox(),
              SizedBox(width: rightPadding ?? 9.0),
              Text(buttonText!, style: buttonTextStyle),
              SizedBox(width: leftPadding ?? 9.0),
              rightSideIcon != null ? rightSideIcon! : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
