import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:st/logic/controller/cart_controller.dart';
import 'package:st/routes/route.dart';
import 'package:st/utils/thems.dart';

import '../../logic/controller/main_controller.dart';
import 'color_picker.dart';

class ImageSlider extends StatefulWidget {
  String ImageUrl;
  ImageSlider({
    Key? key,
    required this.ImageUrl,
  }) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

CarouselController carouselController = CarouselController();
  final controller = Get.put(MainController());


final List<Color> colorSelected = [
  kCOlor1,
  kCOlor2,
  kCOlor3,
  kCOlor4,
  kCOlor2,
  kCOlor3,
  kCOlor4,
];
int currentPage = 0;
int currentColor = 0;

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(widget.ImageUrl),
                )),
              );
            },
            options: CarouselOptions(
                height: 500,
                autoPlay: true,
                enlargeCenterPage: F,
                autoPlayInterval: const Duration(seconds: 2),
                enableInfiniteScroll: F,
                viewportFraction: 1,
                onPageChanged: (index, reson) {
                  setState(() {
                    currentPage = index;
                  });
                })),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: mainColor,
              ),
            )),
        Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 200,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: ColorPicker(
                        color: colorSelected[index],
                        outerBorder: currentColor == index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 3,
                      ),
                  itemCount: colorSelected.length),
            )),
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: mainColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
           Obx((() =>    Badge(
                position: BadgePosition.topEnd(top: -10, end: -10),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  controller.Number().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routs.CartScreen);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ))),
            ],
          ),
        ),
      ],
    );
  }
}
