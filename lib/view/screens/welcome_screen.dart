import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/routes/route.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: const Center(
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Asroo",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        TextUtiles(
                          text: "Shop",
                          fontsize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          underline: TextDecoration.underline,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12)),
                      onPressed: () {
                       Get.offNamed(Routs.LoginScreen);
                      },
                      child: const Text(
                        "Get Start",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextUtiles(
                          text: "Dont ' have an Account",
                          underline: TextDecoration.none,
                          color: Colors.white,
                          fontsize: 18,
                          fontWeight: FontWeight.normal),
                      TextButton(
                          onPressed: () {
                            Get.offNamed(Routs.signUpScreen);
                          },
                          child: const TextUtiles(
                              text: 'Sign Up',
                              underline: TextDecoration.underline,
                              color: Colors.white,
                              fontsize: 18,
                              fontWeight: FontWeight.normal))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
