import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/routes/route.dart';


import '../../../logic/controller/account_setting.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../../logic/controller/payment_controller.dart';
import '../../../utils/thems.dart';
import '../text_utils.dart';

class DeliveryContinerWidget extends StatefulWidget {
  const DeliveryContinerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContinerWidget> createState() => _DeliveryContinerWidgetState();
}

class _DeliveryContinerWidgetState extends State<DeliveryContinerWidget> {
  final TextEditingController phoneController = TextEditingController();
  int radioContinerIndes = 1;
  bool changeColors = false;

  final controller = Get.put(PayMentController());
  final authController = Get.put(AuthController());
  final cont = Get.put(AcoountSetting());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContiner(
          address: "Egypt, Cairo Helwan ",
          name: "asroo store",
          phone: "51-887-9932",
          title: "Asroo Shop",
          value: 1,
          color: changeColors ? Colors.white : Colors.grey.shade300,
          icon: Container(),
          onChanged: (int? value) {
            setState(() {
              radioContinerIndes = value!;
              changeColors = !changeColors;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => buildRadioContiner(
            address: controller.address.value,
            name: cont.email == null ? "loading" : cont.name!,
            phone: controller.phoneNumber.value,
            title: "Delivery",
            value: 2,
            color: changeColors ? Colors.grey.shade300 : Colors.white,
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: "Enter Your Phone Number",
                  titleStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.white,
                  radius: 10,
                  textCancel: " Cancel ",
                  confirmTextColor: Colors.black,
                  textConfirm: " Save ",
                  cancelTextColor: Colors.black,
                  onCancel: () {
                    Get.toNamed(Routs.PaymentScreen);
                  },
                  onConfirm: () {
                    Get.back();
                    controller.phoneNumber.value = phoneController.text;
                  },
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  content: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: phoneController,
                      cursorColor: Colors.black,
                      maxLength: 11,
                      keyboardType: TextInputType.text,
                      onSubmitted: (value) {
                        phoneController.text = value;
                      },
                      decoration: InputDecoration(
                        fillColor: Get.isDarkMode
                            ? pinkClr.withOpacity(0.1)
                            : mainColor.withOpacity(0.2),
                        focusColor: Colors.red,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            phoneController.clear();
                          },
                          icon: const Icon(Icons.close, color: Colors.black),
                        ),
                        hintText: "Enter Your Phone Number",
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
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
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.contact_phone,
                color: Get.isDarkMode ? pinkClr : mainColor,
                size: 20,
              ),
            ),
            onChanged: (int? value) {
              setState(() {
                radioContinerIndes = value!;
                changeColors = !changeColors;
              });
              controller.updatePosition();
            },
          ),
        ),
      ],
    );
  }

  Widget buildRadioContiner({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContinerIndes,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 TextUtiles(
                  text: title,
                  underline: TextDecoration.none,
                  color: Colors.black,
                  fontsize: 20,
                  fontWeight: FontWeight.bold),
              
                const SizedBox(
                  height: 5,
                ),
                 TextUtiles(
                  text: name,
                  underline: TextDecoration.none,
                  color:  Colors.black,
                  fontsize: 14,
                  fontWeight: FontWeight.normal),
               
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('🇪🇬+02 '),
                    TextUtiles(
                  text: phone,
                  underline: TextDecoration.none,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontsize: 15,
                  fontWeight: FontWeight.bold),
                    const SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                 TextUtiles(
                  text: address,
                  underline: TextDecoration.none,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontsize: 15,
                  fontWeight: FontWeight.bold),
              ],
            ),
          ),
        ],
      ),
    );
  }
}