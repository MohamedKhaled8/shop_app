import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/logic/controller/cart_controller.dart';

import '../../../model/models_prudects.dart';

class CartProductCard extends GetWidget<CartController> {
  final PrudectsModels prudectsModels;
  final int index;
  final int number;
 
  CartProductCard({
    Key? key,
    required this.prudectsModels,
    required this.index,
    required this.number,
    
  }) : super(key: key);
  final cintroller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 7),
      height: 812 * 130 / Get.height,
      width: 812 * 100 / Get.width,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 812 * 120 / Get.height,
            width: 375 * 100 / Get.width,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(prudectsModels.image), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prudectsModels.title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "\$ ${controller.prouductSubTotal[index].toStringAsFixed(2)}",
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.removeOneProuuct(prudectsModels);
                      },
                      icon: const Icon(Icons.remove_circle)),
                  Text(
                    "\$ ${controller.Number()}",
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  IconButton(
                      onPressed: () {

                        controller.addProductToCart(prudectsModels);
                      },
                      icon: const Icon(Icons.add_circle)),
                ],
              ),
              IconButton(
                  onPressed: () {
                    controller.clearAllProducts();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
