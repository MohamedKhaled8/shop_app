import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:st/services/prudect_services.dart';

import '../../model/models_prudects.dart';

class prudectController extends GetxController {
  var prudectList = <PrudectsModels>[].obs;
  var favoritesList = <PrudectsModels>[].obs;

  var stoarge = GetStorage();
  var isLoading = true.obs;


var SearchList = <PrudectsModels>[].obs;
TextEditingController searchTextController = TextEditingController();

@override
  void onInit() {
    getProuduct();
    super.onInit();

    List? stoargeShopping = stoarge.read<List>("isFavoritersList");
    if (stoargeShopping != null) {
      favoritesList =
          stoargeShopping.map((e) => PrudectsModels.fromJson(e)).toList().obs;
    }
    getProuduct();
  }

  void getProuduct() async {
    var products = await ProductServices.getProduct();

    try {
      if (prudectList.isEmpty) {
        prudectList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
//logic favorite screen

  void manageFavorite(int pruductId) async {
    var exiteIndex =
        favoritesList.indexWhere((element) => element.id == pruductId);

    if (exiteIndex >= 0) {
      favoritesList.removeAt(exiteIndex);
      await stoarge.remove("isFavoritersList");
    } else {
      favoritesList
          .add(prudectList.firstWhere((element) => element.id == pruductId));
      await stoarge.write("isFavoritersList", favoritesList);
    }
  }

  bool isFavorites(int pruductId) {
    return favoritesList.any((element) => element.id == pruductId);
  }

  void addSearchToList(String searchName){
searchName = searchName.toLowerCase();
   
    SearchList.value = prudectList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) || searchPrice.toString().contains(searchName);
    }).toList();
update();
  }

  void cleeanSearch(){
searchTextController.clear();
addSearchToList("");
  }
}
