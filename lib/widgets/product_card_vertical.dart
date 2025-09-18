import 'package:flutter/material.dart';
import 'package:trainig/widgets/round_image_widget.dart';
import 'package:trainig/widgets/rounded_container.dart';



import '../bottom_navigation_bar/details_screen.dart';
import '../model/products_model.dart';


class ProductCardVertical extends StatefulWidget {
  final Product? product;


  const ProductCardVertical({super.key, this.product});

  @override
  State<ProductCardVertical> createState() => _ProductCardVerticalState();
}

class _ProductCardVerticalState extends State<ProductCardVertical> {
  bool isFavourite = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          // بوش بروح لصفحه وو بوب برجع من صفحه
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(),
          ),
        );
      },
      child: Container(
        // width: 200,
        // height: 250,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// thumbnail
            RoundedContainer(
              width: double.infinity,
              // height: 100,
              padding: const EdgeInsets.all(8),
              backgroundColor: Colors.grey.shade200,
              child: SizedBox(
                height: 120,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child:
                      /// Product Image
                      RoundedImage(
                        imageUrl: widget.product?.thumbnail,
                        applyImageRadius: true,
                        productsModel: null,
                      ),
                    ),

                    /// /// Sale Tag
                    Positioned(
                      top: 5,
                      left: 7,
                      child: RoundedContainer(
                        width: 35,
                        height: 22,
                        backgroundColor: Colors.yellow.shade400,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        child: const Text(
                          "25%",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    /// Favourite icon button
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          onPressed: () {
                            isFavourite = !isFavourite;
                            setState(() {});
                          },
                          icon:
                          isFavourite
                              ? Icon(Icons.favorite_border)
                              : Icon(Icons.favorite, color: Colors.red,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 6),

            /// Product Title
            Text(
              widget.product?.title ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            /// Product Brand
            Row(
              children: [
                Flexible(
                  child: Text(
                    widget.product?.brand ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.verified, color: Colors.blue, size: 14),
              ],
            ),
            const SizedBox(height: 6),
            /// Product Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "\$${widget.product?.price}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: const SizedBox(
                    height: 42,
                    width: 38,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
