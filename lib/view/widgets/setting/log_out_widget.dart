import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/thems.dart';
import '../text_utils.dart';

class LogOutWidgts extends StatelessWidget {
  const LogOutWidgts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
      onTap: (){},
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: languageSettings),
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtiles(
              text: 'Logout',
              underline: TextDecoration.none,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontsize: 22,
              fontWeight: FontWeight.bold)
        ]),
      ),
    );
  }
}
