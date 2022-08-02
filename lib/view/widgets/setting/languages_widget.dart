import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/logic/controller/setting_controller.dart';
import 'package:st/utils/my_constant.dart';
import 'package:st/view/widgets/image_slider.dart';

import '../../../utils/thems.dart';
import '../text_utils.dart';

class LanguagesWidget extends GetWidget<SettingController> {
   LanguagesWidget({Key? key}) : super(key: key);


final controller  = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) =>  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: languageSettings),
              child: const Icon(
                Icons.language,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            TextUtiles(
                text: 'Language'.tr,
                underline: TextDecoration.none,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontsize: 22,
                fontWeight: FontWeight.bold)
          ]),
        ),
        Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                
                iconSize: 25,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                items:   [
                  DropdownMenuItem(
                       // ignore: sort_child_properties_last
                       child: Text(
                    english,
                    style: const  TextStyle(fontSize: 16,)
                  ),
                  value: ene,
                  ),
                  DropdownMenuItem  (
                      // ignore: sort_child_properties_last
                      child:  Text(
                    arabic,
                    style:  const TextStyle(fontSize: 16,)
                  ),
                   value: ara,
                  ),
                  DropdownMenuItem(
                      // ignore: sort_child_properties_last
                      child: Text(
                    france,
                    style:  const TextStyle(fontSize: 16,)
                  ), 
                   value: frf,
                  ),
                ],
                value: controller.langLocak,
                onChanged: (value) {
                 controller.changeLanguage(value!);
                 Get.updateLocale(Locale(value));
                },
              ),
            )),
      ],
    ));
  }
}
