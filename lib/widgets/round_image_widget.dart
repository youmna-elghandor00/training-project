import 'package:flutter/material.dart';

import '../model/products_model.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.productsModel,

    this.imageUrl,
    this.applyImageRadius = true,
    this.isNetworkImage = false,
    this.onPressed,
    this.width =400,
    this.height = 400,
    this.border,
    this.backgroundColor = Colors.grey,
    this.borderRadius =45,
    this.padding ,

  });
  final ProductsModel? productsModel;
  final double? width, height;
  final String? imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: Border.symmetric(),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius:
          applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: Image(
            image: NetworkImage(imageUrl!),
            fit: BoxFit.contain,
            //alignment: Alignment.centerLeft,
          ),
        ),
      ),
    );
  }
}
