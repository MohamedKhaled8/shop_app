import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/pruducts_controller.dart';

class FavoriteScreen extends GetWidget<prudectController> {
  FavoriteScreen({Key? key}) : super(key: key);
  final controller = Get.put(prudectController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (controller.favoritesList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 812 * 100 / Get.height,
                    width: 812 * 100 / Get.width,
                    child: Image.asset("assets/images/heart.png"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "please, Add your favorite proucts....",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return buildFavItems(
                    image: controller.favoritesList[index].image,
                    price: controller.favoritesList[index].price,
                    title: controller.favoritesList[index].title,
                    pruductId: controller.favoritesList[index].id,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
                itemCount: controller.favoritesList.length);
          }
        }),
        //

        //
        //
      ),
    );
  }

  Widget buildFavItems({
    required String image,
    required double price,
    required String title,
    required int pruductId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 812 * 100 / Get.height,
        child: Row(
          children: [
            SizedBox(
              child: SizedBox(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    title,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "\$ $price",
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  controller.manageFavorite(pruductId);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
