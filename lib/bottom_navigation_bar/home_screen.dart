import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../dio/api_provider.dart';
import '../model/products_model.dart';
import '../widgets/product_card_vertical.dart';
import '../widgets/round_image_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsModel? productsModel;
  bool isLoading = true;
  int currentIndex = 0; // علشان نعرف أي نقطة مفعلة

  getProductsFromApiProvider() async {
    productsModel = await ApiProvider().getId();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getProductsFromApiProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home, size: 35),
            color: Colors.white,
          ),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage("assets/images/image4.png"),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good day for shopping",
                  style: TextStyle(color: Colors.grey[400], fontSize: 15),
                ),
                const Text(
                  "Yomna Elghandor,",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none, size: 30,),
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.red))
          : Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// Search bar
              Container(
                width: double.infinity,
                height: 40,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    Icon(Icons.search, color: Colors.grey[500]),
                    const SizedBox(width: 10),
                    const Text(
                      "search",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              /// Popular categories
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Popular Categories ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              /// Slider with dots
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      items: [
                        RoundedImage(
                          productsModel: productsModel,
                          imageUrl:
                          productsModel?.products[3].thumbnail,
                          width: double.infinity,
                        ),
                        RoundedImage(
                          productsModel: productsModel,
                          imageUrl:
                          productsModel?.products[14].thumbnail,
                          width: double.infinity,
                        ),
                        RoundedImage(
                          productsModel: productsModel,
                          imageUrl:
                          productsModel?.products[9].thumbnail,
                          width: double.infinity,
                        ),
                        RoundedImage(
                          productsModel: productsModel,
                          imageUrl:
                          productsModel?.products[7].thumbnail,
                          width: double.infinity,
                        ),
                      ],
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    /// slider dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: currentIndex == index ? 12 : 8,
                          height: currentIndex == index ? 12 : 8,
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? Colors.green
                                : Colors.grey.shade300,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              /// Popular Products + See more
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular Products",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        "See more",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              /// Products Grid
              GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 226,
                ),
                itemBuilder: (context, index) {
                  final product = productsModel!.products[index];
                  return ProductCardVertical(product: product);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
