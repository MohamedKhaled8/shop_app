import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:st/model/models_prudects.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/widgets/text_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../logic/controller/pruducts_controller.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final String decoration;
  final int productId;
  final double rate;
  ClothesInfo({
    Key? key,
    required this.title,
    required this.decoration,
    required this.productId,
    required this.rate,
  }) : super(key: key);

  final controller = Get.find<prudectController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                      onTap: () {
                        controller.manageFavorite(productId);
                      },
                      child: controller.isFavorites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                              size: 20,
                            )),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextUtiles(
                  text: "$rate",
                  underline: TextDecoration.none,
                  color: Colors.black,
                  fontsize: 14,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                width: 8,
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            decoration,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: " Show More",
            trimExpandedText: "Show less",
            lessStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
            moreStyle:const TextStyle(
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
            style:const  TextStyle(
              fontSize: 16,
              height: 2,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
