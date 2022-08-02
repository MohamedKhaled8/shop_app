import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/routes/route.dart';
import 'package:st/utils/thems.dart';

import '../../logic/controller/cart_controller.dart';
import '../../logic/controller/main_controller.dart';

class mainScreen extends GetWidget<MainController> {
  mainScreen({Key? key}) : super(key: key);
  final controller = Get.put(MainController());
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx((() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          elevation: 0,
          actions: [
            Obx(
              
              () => Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  controller.Number().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routs.CartScreen);
                  },
                  icon: Image.asset("assets/images/shop.png"),
                ),
              ),
            ),
          ],
          title: Text(controller.titlePage[controller.currentIndex.value]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                icon: Icon(
                  Icons.home,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Colors.black,
                ),
                icon: Icon(
                  Icons.category,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
                icon: Icon(
                  Icons.favorite,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                icon: Icon(
                  Icons.settings,
                ),
                label: ''),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          // ignore: invalid_use_of_protected_member
          children: controller.Navigate.value,
        ),
      );
    })));
  }
}
