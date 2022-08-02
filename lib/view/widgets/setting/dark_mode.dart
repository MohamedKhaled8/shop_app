import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/widgets/text_utils.dart';

import '../../../logic/controller/setting_controller.dart';

class DarkMode extends StatelessWidget {
   DarkMode({Key? key}) : super(key: key);


final controller  = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return   Obx(() =>  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidgets(),
        Switch(
          activeTrackColor: mainColor,
          activeColor: Get.isDarkMode ? pinkClr :mainColor,
          value: controller.switchValue.value , onChanged: (value){
          
          controller.switchValue.value  = value;
        })
      ],
    ));
  }
}

Widget buildIconWidgets() {
  return Material(
    color: Colors.transparent,
    child: Row(children: [
      Container(
        padding: const EdgeInsets.all(6),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: darkSettings),
        child: const Icon(
          Icons.dark_mode,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 20,
      ),
       TextUtiles(
          text: 'Dark Mode',
          underline: TextDecoration.none,
          color: Get.isDarkMode ? Colors.white : Colors.black, 
          fontsize: 22,
          fontWeight: FontWeight.bold)
    ]),
  );
}
