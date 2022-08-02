import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/logic/controller/cart_controller.dart';
import 'package:st/routes/route.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/widgets/text_utils.dart';

class CatTotal extends GetWidget<CartController> {
  CatTotal({Key? key}) : super(key: key);
  final controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const TextUtiles(
                        text: "Total",
                        underline: TextDecoration.none,
                        color: Colors.grey,
                        fontsize: 16,
                        fontWeight: FontWeight.bold),
                    Text(
                      "\$${controller.total}",
                      style: const TextStyle(
                          color: Colors.black, fontSize: 20, height: 1.5),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 812 * 60 / Get.height,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                        primary: mainColor,
                      ),
                      onPressed: () {
                        Get.toNamed(Routs.PaymentScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Check Out",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.shopping_cart)
                        ],
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
