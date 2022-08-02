import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/logic/controller/setting_controller.dart';
import 'package:st/view/widgets/text_utils.dart';

import '../../../logic/controller/account_setting.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);

  final controller = Get.put(SettingController());
  final cont = Get.put(AcoountSetting());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/mePhoto.png"),
                      fit: BoxFit.cover),
                )),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtiles(
                      text: cont.email == null ? "loading" : cont.name!,
                      underline: TextDecoration.none,
                      color: Colors.black,
                      fontsize: 22,
                      fontWeight: FontWeight.bold),
                  TextUtiles(
                      text: cont.email == null ? "loading" : cont.email !,
                      underline: TextDecoration.none,
                      color: Colors.black,
                      fontsize: 16,
                      fontWeight: FontWeight.bold),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
