import 'package:flutter/material.dart';

import '../../model/models_prudects.dart';
import '../widgets/add_card.dart';
import '../widgets/clothes_info.dart';
import '../widgets/image_slider.dart';
import '../widgets/size_list.dart';

class ProuductDetailesScreen extends StatelessWidget {
  final PrudectsModels prudectsModels;
   // ignore: prefer_const_constructors_in_immutables
   ProuductDetailesScreen({
    Key? key,
    required this.prudectsModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageSlider(
                ImageUrl: prudectsModels.image,
              ),
              ClothesInfo(title: prudectsModels.title, productId: prudectsModels.id, rate: prudectsModels.rating.rate, decoration: prudectsModels.description,),  
               SizedList(),       
               AddCart(price: prudectsModels.price , prudectsmodels: prudectsModels,),
              ],
          ),
        ),
      ),
    );
  }
}
