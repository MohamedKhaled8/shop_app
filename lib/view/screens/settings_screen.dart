import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/logic/controller/auth_controller.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/widgets/text_utils.dart';

import '../widgets/setting/dark_mode.dart';
import '../widgets/setting/languages_widget.dart';
import '../widgets/setting/log_out_widget.dart';
import '../widgets/setting/profile_image.dart';

class SettingsScreen extends GetWidget<AuthController> {
 const SettingsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            ProfileImage(),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
             TextUtiles(
                text: "General".tr,
                underline: TextDecoration.none,
                color: mainColor,
                fontsize: 15,
                fontWeight: FontWeight.bold),
                const SizedBox(
              height: 20,
            ),
            
            DarkMode(),
            const SizedBox(
              height: 20,
            ),
             LanguagesWidget(),
            const SizedBox(
              height: 20,
            ),
        const    LogOutWidgts(),
          ],
        ),

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     GetBuilder<AuthController>(builder: ((controller) {
        //       return TextButton(onPressed: (){
        //         Get.defaultDialog();

        //       }, child:const Center(child:  Text("LogOut" , style: TextStyle(
        //       fontSize: 35,
        //     ),) ,));
        //     }))
        //   ]

        // )
      ),
    );
  }
}
