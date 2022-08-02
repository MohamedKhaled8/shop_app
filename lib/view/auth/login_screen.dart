import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/routes/route.dart';

import '../../logic/controller/auth_controller.dart';
import '../../utils/thems.dart';
import '../widgets/text_utils.dart';
import 'auth_Buttom.dart';
import 'auth_text_form_field.dart';
import 'chek_widgets.dart';
import 'count_Un.dart';

class LoginScreen extends GetWidget<AuthController> {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  // ignore: annotate_overrides
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            TextUtiles(
                                text: " LOG  ",
                                underline: TextDecoration.none,
                                color: mainColor,
                                fontsize: 28,
                                fontWeight: FontWeight.w500),
                            TextUtiles(
                                text: " IN ",
                                underline: TextDecoration.none,
                                color: Colors.black,
                                fontsize: 28,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        
                        AuthTextFormField(
                          controller: emailCont,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your email';
                            }
                            return null;
                          },
                          prefixIcon: Image.asset("assets/images/email.png"),
                          suffixIcon: const Text(""),
                          hitText: "-Email",
                          hintStyle: '',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormField(
                            controller: passCont,
                            obscureText: controller.isVisibility ? false : true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter your Password';
                              }
                              return null;
                            },
                            prefixIcon: Image.asset("assets/images/lock.png"),
                            hitText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isvisibility();
                                },
                                icon: controller.isVisibility
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )),
                            hintStyle: '',
                          );
                        }),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routs.ForgetPassword);
                              },
                              child: const TextUtiles(
                                  text: 'Forgot Password?',
                                  underline: TextDecoration.none,
                                  color: Colors.black,
                                  fontsize: 16,
                                  fontWeight: FontWeight.normal)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        checkWidget(),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<AuthController>(builder: (controller) {
                          return AuthButtom(
                            onTap: () {
                              if (_key.currentState!.validate()) {
                                controller.LoginUsingFirebase(
                                  emailCont.text,
                                  passCont.text,
                                );
                              }
                            },
                            txt: "LOG IN",
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextUtiles(
                            text: '-OR-',
                            underline: TextDecoration.none,
                            color: Colors.black,
                            fontsize: 16,
                            fontWeight: FontWeight.normal),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SingleChildScrollView(
                              child: GetBuilder<AuthController>(builder: ((controller) {
                                return InkWell(
                                  onTap: ()async {
                               UserCredential cred = await signInWithGoogle();
                               print(cred);
                               },
                                  
                                  child: Image.asset("assets/images/google.png"),
                                );
                              })),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ContUn(
                  onTap: () {},
                  txt: "Don't have an Account?",
                  txttype: 'Sign up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
