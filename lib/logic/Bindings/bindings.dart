import 'package:get/get.dart';

import '../controller/account_setting.dart';
import '../controller/auth_controller.dart';
import '../controller/cart_controller.dart';
import '../controller/category_controller.dart';
import '../controller/main_controller.dart';
import '../controller/payment_controller.dart';
import '../controller/pruducts_controller.dart';
import '../controller/setting_controller.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => prudectController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => AcoountSetting());
    Get.lazyPut(() => PayMentController());
   
  }

}