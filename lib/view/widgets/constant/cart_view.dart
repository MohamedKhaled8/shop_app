import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/screens/product_details_screen.dart';
import 'package:st/view/widgets/text_utils.dart';
import '../../../logic/controller/cart_controller.dart';
import '../../../logic/controller/pruducts_controller.dart';
import '../../../model/models_prudects.dart';

class CartView extends GetWidget<prudectController> {
  CartView({Key? key}) : super(key: key);
  // ignore: annotate_overrides
  final controller = Get.put(prudectController());

  @override
  Widget build(BuildContext context) {
    return Obx((() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Expanded(
            child: 
                 GridView.builder(
                    itemCount: controller.SearchList.isEmpty
                        ? controller.prudectList.length
                        : controller.SearchList.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150 * 812 / Get.width,
                        mainAxisExtent: 300 * 812 / Get.height,
                        crossAxisSpacing: 9,
                        mainAxisSpacing: 9,
                        childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      if (controller.SearchList.isEmpty) {
                        return buildCrdItems(
                            image: controller.prudectList[index].image,
                            price: controller.prudectList[index].price,
                            description:
                                controller.prudectList[index].description,
                            rate: controller.prudectList[index].rating.rate,
                            pruductId: controller.prudectList[index].id,
                            prudectsModels: controller.prudectList[index],
                            onTap: () {
                              Get.to(ProuductDetailesScreen(
                                prudectsModels: controller.prudectList[index],
                              ));
                            });
                      } else {
                        return buildCrdItems(
                            image: controller.SearchList[index].image,
                            price: controller.SearchList[index].price,
                            description:
                                controller.SearchList[index].description,
                            rate: controller.SearchList[index].rating.rate,
                            pruductId: controller.SearchList[index].id,
                            prudectsModels: controller.SearchList[index],
                            onTap: () {
                              Get.to(ProuductDetailesScreen(
                                prudectsModels: controller.SearchList[index],
                              ));
                            });
                      }
                    }));
      }
    }));
  }

  Widget buildCrdItems({
    required String image,
    required double price,
    required double rate,
    required String description,
    required int pruductId,
    required PrudectsModels prudectsModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx((() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.manageFavorite(pruductId);
                          },
                          icon: controller.isFavorites(pruductId)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.black,
                                )),
                      IconButton(
                          onPressed: () {
                            final cont = Get.put(CartController());

                            cont.addProductToCart(prudectsModels);
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          )),
                    ],
                  ))),
              Container(
                width: double.infinity,
                height: 812 * 200 / Get.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 55,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            TextUtiles(
                                text: "\$rate",
                                underline: TextDecoration.none,
                                color: Colors.white,
                                fontsize: 12,
                                fontWeight: FontWeight.bold),
                            Icon(
                              Icons.star,
                              size: 11,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
