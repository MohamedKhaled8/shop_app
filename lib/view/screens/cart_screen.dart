import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:st/view/widgets/Cart/empty_cart.dart';

import '../../logic/controller/cart_controller.dart';
import '../widgets/Cart/cartTotal.dart';
import '../widgets/Cart/cart_product.dart';

class CartScreen extends GetWidget<CartController> {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("Cart Items"),
            elevation: 0,
            centerTitle: T,
            actions: [
              IconButton(onPressed: () {
                controller.clearAllProducts();
              }, icon: const Icon(Icons.backspace)),
            ]
              
            
          ),
          body: Obx(() {
            if (controller.productsMap.isEmpty){
              return const EmptyCart();
            }else {
               return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 812 * 550 / Get.height,
                    child: ListView.separated(
                        itemBuilder: ((context, index) {
                          return CartProductCard(
                            index: index,
                            prudectsModels:
                                controller.productsMap.keys.toList()[index],
                            number:
                                controller.productsMap.values.toList()[index],
                          );
                        }),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 15,
                            ),
                        itemCount: controller.productsMap.length),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CatTotal(),
                  )
                ],
              ),
            );
            }
           
          })),
    );
  }
}
