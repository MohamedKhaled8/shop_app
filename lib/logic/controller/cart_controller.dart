import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/model/models_prudects.dart';
import 'package:st/routes/route.dart';
import 'package:st/utils/thems.dart';

class CartController extends GetxController{
var productsMap = {}.obs;
void addProductToCart(PrudectsModels prudectsModels){
  if(productsMap.containsKey(prudectsModels)){
    productsMap[prudectsModels] +=1;
  }else{
    productsMap[prudectsModels] = 1;
  }
}

void removeProductsForCart(PrudectsModels prudectsModels){
  // ignore: unrelated_type_equality_checks
  if(productsMap.containsKey(prudectsModels)&& productsMap[prudectsModels ==1]){
    productsMap.removeWhere((key, value) => key == prudectsModels);
  }else{
    productsMap[prudectsModels] -=1;
  }
}



void removeOneProuuct(PrudectsModels prudectsModels){
productsMap.removeWhere((key, value) => key == prudectsModels);
}

void clearAllProducts(){
Get.defaultDialog(
  title: "Clean Products",
  titleStyle: const TextStyle(
    fontSize: 18, 
    color: Colors.black,
   fontWeight: FontWeight.bold
  ),
  middleText: 'Are you sure you need clear products',
  middleTextStyle: const  TextStyle(
    fontSize: 18, 
    color: Colors.black,
   fontWeight: FontWeight.bold
  ),
  backgroundColor: Colors.grey,
  radius: 10,
  textCancel: "No",
  cancelTextColor: Colors.white,
  textConfirm: "YES",
  confirmTextColor: Colors.white,
  onCancel: (){
    Get.toNamed(Routs.CartScreen);
  },
  onConfirm: (){
    productsMap.clear();
    Get.back();
  },
  buttonColor: mainColor
);
  
}

get prouductSubTotal => productsMap.entries.map((e) => e.key.price  * e.value).toList();

get total => productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value + element).toStringAsFixed(2);

int Number(){
  return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value + element);
  
}
int Numberless(){
  return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value - element);
}

}