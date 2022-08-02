import 'package:get/get.dart';
import 'package:st/view/screens/category_screen.dart';

import '../view/auth/forget_password.dart';
import '../view/auth/login_screen.dart';
import '../view/auth/signup_screen.dart';
import '../view/screens/cart_screen.dart';
import '../view/screens/favorite_Screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/main_screen.dart';
import '../view/screens/payment_screen.dart';
import '../view/screens/product_details_screen.dart';
import '../view/screens/settings_screen.dart';
import '../view/screens/welcome_screen.dart';

class AppRoute {
  static const welcome = Routs.welcomeScreen;

  static final routs =  [
    GetPage(
      name: Routs.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routs.LoginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(name: Routs.signUpScreen, page: () => signUpScreen()),
    GetPage(name: Routs.ForgetPassword, page: () => ForgetPassword()),
    // ignore: prefer_const_constructors
    GetPage(name: Routs.mainScreen, page: () => mainScreen()),
    GetPage(name: Routs.HomeScreen, page: () => HomeScreen()),
    GetPage(name: Routs.CategoryScreen, page: () => CategoryScreen() ),
    GetPage(name: Routs.FavoriteScreen, page: () => FavoriteScreen()),

    GetPage(name: Routs.SettingsScreen, page: () => SettingsScreen()),
    GetPage(name: Routs.CartScreen, page: () => CartScreen()),
    GetPage(name: Routs.PaymentScreen, page: () => PayMentScreen()),
    
  ];
}

class Routs {
  static const welcomeScreen = '/WelcomeScreen';
  // ignore: constant_identifier_names
  static const LoginScreen = '/LoginScreen';
  static const signUpScreen = '/signUpScreen';
  // ignore: constant_identifier_names
  static const ForgetPassword = '/ForgetPassword';
  static const mainScreen = '/mainScreen';
  static const HomeScreen = '/HomeScreen';
  static const CategoryScreen = '/CategoryScreen';
  static const FavoriteScreen = '/FavoriteScreen';

  static const SettingsScreen = '/SettingsScreen';
  static const CartScreen = '/CartScreen';
  static const PaymentScreen = '/PayMentScreen';
  

}
