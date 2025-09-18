import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.width =400,
    this.height=400,
    this.backgroundColor,
    this.radius=400,
    this.padding =0,
    this.margin,
    this.child,
  });

  final double? width, height;
  final Color? backgroundColor;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor
      ),
      child: child,
    );
  }
}
