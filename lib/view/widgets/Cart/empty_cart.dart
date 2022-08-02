import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/routes/route.dart';
import 'package:st/utils/thems.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 150,
            color: Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
            
              text: const TextSpan(children: [
            TextSpan(
              text: "Your Cart is ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
           
            TextSpan(
              text: "Empty",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ])),
          const SizedBox(height: 10,),
       const    Text("Add items to get Started" , style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold), 
                  
                   ),
                 const   SizedBox(height: 60,),
                  SizedBox(
                    height: 50,
                    child:  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                      primary: mainColor,
                      ),
                      onPressed: (){
                        Get.toNamed(Routs.mainScreen);
                      }, child: const Text("Go to Home" , 
                      style: TextStyle(fontSize: 20 , color: Colors.white),
                      )),
                  ),
                 
        ],
      ),
    );
  }
}
