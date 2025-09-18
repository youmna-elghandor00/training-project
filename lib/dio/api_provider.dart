import 'package:dio/dio.dart';

import '../model/products_model.dart';

class ApiProvider {
  final String apiUrl = 'https://dummyjson.com';
  Future <ProductsModel?> getId() async{
    ProductsModel? productsModel;

    try {
      var response = await Dio().get("$apiUrl/products?select=id,title,description,category,price,thumbnail,returnPolicy,stock,brand,rating");
      // print(response.statusCode);
      // print(response.data["products"][0]["category"]);
      /// parsing data
      productsModel = ProductsModel.fromJson(response.data);
      print(productsModel.products[0].brand);
      return productsModel;
    } catch(e) {
      print(e);
    }
    return null;
  }



  signInEmail({required String email, required String password}) async{
    try {
      FormData formData =
      FormData.fromMap({"email" : email, "password" : password});

      Response response =
      await Dio().post("$apiUrl/products",data: formData);

      print(response.data);
      print(response.data["model"]["tokens"]["accessToken"]);

    } catch(e) {  // to print error
      print(e);
    }
  }
}