import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:st/logic/Languages/localiztion.dart';
import 'package:st/utils/my_constant.dart';
import 'package:st/view/auth/forget_password.dart';
import 'package:st/view/auth/login_screen.dart';
import 'package:st/view/auth/signup_screen.dart';
import 'package:st/view/screens/cart_screen.dart';
import 'package:st/view/screens/category_screen.dart';
import 'package:st/view/screens/favorite_Screen.dart';
import 'package:st/view/screens/main_screen.dart';
import 'package:st/view/screens/payment_screen.dart';
import 'package:st/view/screens/settings_screen.dart';
import 'package:st/view/screens/welcome_screen.dart';
import 'routes/route.dart';
import 'view/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale:Locale(GetStorage().read<String>('lang').toString()) ,
      translations: LocaliztionApp(),
      fallbackLocale: Locale(ene),
      title: 'Flutter Demo',
      initialRoute: '/WelcomeScreen',
      getPages: [
        GetPage(name: Routs.welcomeScreen, page: () => const WelcomeScreen()),
        GetPage(name: Routs.LoginScreen, page: () => LoginScreen()),
        GetPage(name: Routs.signUpScreen, page: () => signUpScreen()),
        GetPage(name: Routs.ForgetPassword, page: () => ForgetPassword()),
        GetPage(name: Routs.mainScreen, page: () => mainScreen()),
        GetPage(name: Routs.HomeScreen, page: () => const HomeScreen()),
        GetPage(name: Routs.CategoryScreen, page: () => const CategoryScreen()),
        GetPage(name: Routs.FavoriteScreen, page: () =>  FavoriteScreen()),
        GetPage(name: Routs.SettingsScreen, page: () => SettingsScreen()),
        GetPage(name: Routs.CartScreen, page: () => CartScreen()),
        GetPage(name: Routs.PaymentScreen, page: () => PayMentScreen()),
      ],
    );
  }
}
