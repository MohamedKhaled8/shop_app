import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/logic/controller/pruducts_controller.dart';

class TextFormFieldScreen extends StatelessWidget {
  TextFormFieldScreen({Key? key}) : super(key: key);

  final controller = Get.find<prudectController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<prudectController>(builder: (_) => TextFormField(
      controller: controller.searchTextController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      onChanged: (searchName) {
        controller.addSearchToList(searchName);
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: const Icon(
          Icons.search,
        ), 
        suffixIcon: IconButton(
            onPressed: () {
              controller.cleeanSearch();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            )),
        hintText: "Search With name & price",
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ));
  }
}
