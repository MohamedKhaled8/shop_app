import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/widgets/text_utils.dart';

import '../widgets/constant/cart_view.dart';
import '../widgets/constant/search_form_fild.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: 812 * 210 / Get.height,
                decoration: const BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
               const        Padding(
                        padding: EdgeInsets.all(5),
                        child: TextUtiles(
                            text: "Find Your ",
                            underline: TextDecoration.none,
                            color: Colors.white,
                            fontsize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                   const    SizedBox(
                        height: 5,
                      ),
                 const      TextUtiles(
                          text: "Inspiration ",
                          underline: TextDecoration.none,
                          color: Colors.white,
                          fontsize: 25,
                          fontWeight: FontWeight.bold),
                    const      SizedBox(
                            height: 30,
                          ),
                          TextFormFieldScreen(),
                    ],
                  ),
                ),
              ),
            ),
        const     SizedBox(height: 13,),
        const   Padding(
             padding:  EdgeInsets.only(left: 20),
             child: Align(
              alignment: Alignment.topLeft,
              child: TextUtiles(text: "Categories", underline: TextDecoration.none, color: Colors.black, fontsize: 20, fontWeight: FontWeight.w500)),
           ),
           const SizedBox(height: 30,),
        
           CartView(),
           
          ],
        ),
      ),
    );
  }
}
