import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/widgets/text_utils.dart';

class ContUn extends StatelessWidget {
  const ContUn({
    Key? key,
    required this.txt,
    required this.txttype,
    required this.onTap,
  }) : super(key: key);
  final String txt;
  final String txttype;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 812 * 95 / Get.height,
      decoration: const BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextUtiles(
            text: txt,
            underline: TextDecoration.none,
            color: Colors.white,
            fontsize: 20,
            fontWeight: FontWeight.bold),
            const SizedBox(width: 10,),
        TextButton(
          onPressed: onTap,
          child: TextUtiles(text: txttype, underline: TextDecoration.underline, color: Colors.white, fontsize: 20, fontWeight: FontWeight.bold),
           ),
      ]),
    );
  }
}
