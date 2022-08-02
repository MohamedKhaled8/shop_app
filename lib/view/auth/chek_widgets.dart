import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/view/widgets/text_utils.dart';

import '../../logic/controller/auth_controller.dart';

class checkWidget extends GetWidget<AuthController> {
   checkWidget({Key? key}) : super(key: key);


final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: ((controller) =>  Row(
      children: [
        InkWell(
          onTap: (() {
            controller.checkBox();
          }),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200),
            child:controller.isCheckBox? Image.asset("assets/images/check.png") : Container(),
          ),
        ),
     const    SizedBox(
          width: 10,
        ),
        Row(
          children: const [
            TextUtiles(
                text: "accept" ,
                underline: TextDecoration.none,
                color: Colors.black,
                fontsize: 16,
                fontWeight: FontWeight.normal),
                  SizedBox(
          width: 10,
        ),
            TextUtiles(
                text: "terms & conditions" ,
                underline: TextDecoration.underline,
                color: Colors.black,
                fontsize: 16,
                fontWeight: FontWeight.normal),
          ],
        )
      ],
    )
    )
    );
  }
}
