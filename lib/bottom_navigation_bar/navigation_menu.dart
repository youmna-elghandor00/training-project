import 'package:flutter/material.dart';

import '../dio/api_provider.dart';
import '../model/products_model.dart';
import 'account_screen.dart';
import 'categories_screen.dart';
import 'home_screen.dart';



class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentIndex = 0;
  bool isLoading = true;
  ProductsModel? productsModel;
  List<Widget> screens = [
    HomeScreen(),        // index 0
    CategoriesScreen(), // index 1
    AccountScreen(),     // index 2
  ];
  getData () async{
    productsModel= await ApiProvider().getId();
    setState(() {
      isLoading=false;
    });
  }
  @override
  void initState(){
    super.initState();
    ApiProvider().getId();
    getData();

  }

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: isLoading
          ?Center(child: CircularProgressIndicator(color: Colors.red,))
          :screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.deepPurple,
        elevation: 0,
        backgroundColor: Colors.blueGrey[100],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),                             // current index = 0
          BottomNavigationBarItem(icon: Icon(Icons.store_outlined), label: "Categories"), // current index = 1
          BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined), label: "Account"),                   // current index = 2
        ],
      ),
    );
  }
}

// future, async, await
