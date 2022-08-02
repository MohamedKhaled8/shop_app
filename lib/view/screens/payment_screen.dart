import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/view/widgets/text_utils.dart';

import '../../logic/controller/cart_controller.dart';
import '../../logic/controller/payment_controller.dart';
import '../../utils/thems.dart';
import '../widgets/payment/delivery_container.dart';
import '../widgets/payment/payment_method.dart';

class PayMentScreen extends StatelessWidget {
  PayMentScreen({Key? key}) : super(key: key);

  final cartController = Get.put(CartController());
  final payMentController = Get.put(PayMentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text("PayMent"),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TextUtiles(
                  text: "Shopping to",
                  underline: TextDecoration.none,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontsize: 24,
                  fontWeight: FontWeight.bold),
             
              const SizedBox(
                height: 20,
              ),
              const DeliveryContinerWidget(),
              const SizedBox(
                height: 20,
              ),

              TextUtiles(
                  text: "Payment method",
                  underline: TextDecoration.none,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontsize: 24,
                  fontWeight: FontWeight.bold),

              const SizedBox(
                height: 20,
              ),
               PayMentMethodWidget(),
              const SizedBox(
                height: 30,
              ),
              Center(
             child:   TextUtiles(
                  text: "Total: ${cartController.total}\$",
                  underline: TextDecoration.none,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontsize: 20,
                  fontWeight: FontWeight.bold),


                
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Pay Now",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // GetBuilder<PayMentController>(
              //   builder: (_) {
              //     if (payMentController.paymentItems.isNotEmpty) {
              //       return Center(
              //         child: GooglePayButton(
              //           width: 200,
              //           height: 50,
              //           paymentConfigurationAsset: 'gpay.json',
              //           paymentItems: payMentController.paymentItems,
              //           style: GooglePayButtonStyle.black,
              //           type: GooglePayButtonType.pay,
              //           margin: const EdgeInsets.only(top: 15.0),
              //           onPaymentResult: (data) {
              //             print(data);
              //           },
              //           loadingIndicator: const Center(
              //             child: CircularProgressIndicator(),
              //           ),
              //         ),
              //       );
              //     } else {
              //       return Center(
              //         child: SizedBox(
              //           height: 50,
              //           width: 150,
              //           child: ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               elevation: 0,
              //               primary: Get.isDarkMode ? pinkClr : mainColor,
              //             ),
              //             onPressed: () {},
              //             child: const Text(
              //               "Pay Now",
              //               style: TextStyle(
              //                 fontSize: 22,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     }
              //   },
              // ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
