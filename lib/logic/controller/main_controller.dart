import 'package:get/get.dart';
import 'package:st/view/screens/category_screen.dart';
import 'package:st/view/screens/favorite_Screen.dart';
import 'package:st/view/screens/home_screen.dart';
import 'package:st/view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  var productsMap = {}.obs;

  final Navigate = [
    HomeScreen(),
   
    CategoryScreen(),
     FavoriteScreen(),
    SettingsScreen(),
  ].obs;

  final titlePage = [
    "Asroo Shop",
    " category",
    "favorite",
    "settings",
  ];

  int Number(){
  if (productsMap.isEmpty){
    return 0 ;
  }else{
    return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value + element);
  }
}
}
