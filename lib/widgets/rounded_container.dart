import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = 16,
    this.padding,
    this.margin,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white,
    this.showBorder = false,
    this.child,
  });

  final double? width, height;
  final Color backgroundColor;
  final Color borderColor;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: backgroundColor) : null,
      ),
      child: child,
    );
  }
}
