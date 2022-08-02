import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/my_constant.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;
  var storge = GetStorage();
  var langLocak = ene;
  String capital(String profileNAme) {
    return profileNAme.split(" ").map((name) => name.capitalize).join(" ");
  }

  @override
  void onInit() async {
    super.onInit();

    langLocak = await getLanguage;
  }

  void saveLang(String lang) async {
    await storge.write("lang", lang);
  }

  Future<String> get getLanguage async {
    return await storge.read("lang");
  }

  void changeLanguage(String typeLang) {
    saveLang(typeLang);
    if (langLocak == typeLang) {
      return;
    }

    if (typeLang == frf) {
      langLocak = frf;
      saveLang(frf);
    } else if (typeLang == ara) {
      langLocak = ara;
      saveLang(ara);
    } else {
      langLocak = ene;
      saveLang(ene);
    }
    update();
  }
}
