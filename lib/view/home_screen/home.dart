import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/consts/consts.dart';
import 'package:shop_now/controller/home_controller.dart';
import 'package:shop_now/view/cart_screen/cart_screen.dart';
import 'package:shop_now/view/catogeries_screen/categories_screen.dart';
import 'package:shop_now/view/home_screen/home_screen.dart';
import 'package:shop_now/view/profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());

    var navBottomItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26,), label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26,), label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26,), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26,), label: account)
    ];

    var navBody = [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      ProfileScreen()
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(
            ()=> Expanded(
                child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        ()=> BottomNavigationBar(
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold,),
          items: navBottomItem,
          currentIndex: controller.currentNavIndex.value,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
          ),
      ),
    );
  }
}