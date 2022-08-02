import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/view/widgets/text_utils.dart';

import '../widgets/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Column(
          children: [
        const     Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding:  EdgeInsets.only(left: 15, top: 15),
                  child: TextUtiles(
                      text: "Category",
                      underline: TextDecoration.none,
                      color: Colors.black,
                      fontsize: 30,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
