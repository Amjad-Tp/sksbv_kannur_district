import 'package:flutter/material.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxDecoration? decoration;
  final Alignment? alignment;
  const CustomContainer({
    super.key,
    this.height,
    this.width,
    this.child,
    this.padding,
    this.margin,
    this.decoration,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(10),
      decoration:
          decoration ??
          BoxDecoration(color: whiteColor, borderRadius: borderRadius),
      child: child,
    );
  }
}
