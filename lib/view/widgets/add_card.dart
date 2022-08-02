import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/logic/controller/cart_controller.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/widgets/text_utils.dart';

import '../../model/models_prudects.dart';

class AddCart extends StatelessWidget {
  final double price;
  final PrudectsModels prudectsmodels;
   AddCart({
    Key? key,
    required this.price,
    required this.prudectsmodels,
  }) : super(key: key);


final controller =  Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtiles(
                  text: "price",
                  underline: TextDecoration.underline,
                  color: Colors.grey,
                  fontsize: 16,
                  fontWeight: FontWeight.bold),
              Text(
                "$price",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
            ],
          ),
        const   SizedBox(
            width: 20,
          ),
          Expanded(
              child: SizedBox(
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                primary: mainColor,
              ),
                onPressed: () {
                  controller.addProductToCart(prudectsmodels);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:const [
                    Text("Add to Cart " , style: TextStyle(
                      color: Colors.white, 
                      fontSize: 20, 
                    ),),
                    SizedBox(width: 10,),
                    Icon(Icons.shopping_cart_checkout_outlined),
                  ],
                )),
          ))
        ],
      ),
    );
  }
}
