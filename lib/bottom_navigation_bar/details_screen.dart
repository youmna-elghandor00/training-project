import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../dio/api_provider.dart';
import '../model/products_model.dart';

import 'navigation_menu.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ProductsModel? productsModel;
  bool isFavourite = false;
  bool isLoading = true;
  int quantity = 1;

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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white10,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, -2)),
          ],
        ),
        /// add, num, sum
        child: Row(
          children: [
            //  -
            IconButton(
              onPressed: () {
                setState(() {
                  if (quantity > 1) quantity--;
                });
              },
              icon: Icon(Icons.remove, color: Colors.white,),
              style: IconButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
            ),

            // العدد
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "$quantity",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            //  +
            IconButton(
              onPressed: () {
                setState(() {
                  quantity++;
                });
              },
              icon: Icon(Icons.add, color: Colors.white,),
              style: IconButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
            ),

            const SizedBox(width: 16),

            //  Add to Bag
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.shopping_bag_outlined),
                label: Text(
                  "Add to Bag",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.red))
          :SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Image + Icons
                Stack(
                  children: [
                    /// Image
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade500, width: 0.8),
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey.shade200,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.shade200,
                        //     blurRadius: 8,
                        //      offset: Offset(0, 2), // اتجاه الشادو
                        //   ),
                        // ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          "${productsModel?.products[0].thumbnail}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    /// Icons above image
                    Positioned(
                      top: 16,
                      left: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(onPressed: (){
                          Navigator.push(
                            // بوش بروح لصفحه وو بوب برجع من صفحه
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigationMenu(),
                            ),
                          );
                        },
                            icon: Icon(Icons.arrow_back, color: Colors.black, size: 30,)),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
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

                /// Rating + Share Icon
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width:75 ,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            Icon(MdiIcons.starShooting, color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text("${productsModel?.products[0].rating} ",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                            const Spacer(),

                          ],
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.share, color: Colors.black)),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Price
                      Text(
                        "\$ ${productsModel?.products[0].price}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      /// Title
                      Row(
                        children: [
                          Icon(Icons.trending_up, color: Colors.blue,),
                          SizedBox(width: 5,),
                          Text(
                            "${productsModel?.products[0].title}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      /// Stock
                      // Text(
                      //   "stock: ${productsModel?.products[0].stock}",
                      //   style: TextStyle(
                      //     fontSize: 15,
                      //     //color: Colors.green,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      const SizedBox(height: 4),

                      /// Brand
                      Row(
                        children: [
                          // Icon(Icons.check, color: Colors.blue, size: 18),
                          // const SizedBox(width: 4),
                          Text(
                            "Brand: ${productsModel?.products[0].brand}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.verified, color: Colors.blue, size: 16),
                        ],
                      ),
                      SizedBox(height: 10,),
                      /// Description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Description",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            Text(
                              "${productsModel?.products[0].description}",
                              style: TextStyle(fontSize: 14, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),

                      const Divider(thickness: 1, height: 30),

                      /// Category
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Category",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            Text(
                              "${productsModel?.products[0].category}",
                              style: TextStyle(fontSize: 14, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),

                      const Divider(thickness: 1, height: 30),

                      /// Return Policy
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Return Policy",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            Text(
                              "${productsModel?.products[0].returnPolicy}",
                              style: TextStyle(fontSize: 14, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),

                      const Divider(thickness: 1, height: 30),

                      /// Id
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Product Id",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            Text(
                              "${productsModel?.products[0].id}",
                              style: TextStyle(fontSize: 14, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 100), // علشان يدي مساحة قبل الجزء الثابت


              ],
            ),
          ),
        ),
      ),
    );
  }
}
