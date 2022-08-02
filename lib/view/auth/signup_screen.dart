import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/auth/auth_text_form_field.dart';
import 'package:st/view/widgets/text_utils.dart';

import '../../logic/controller/account_setting.dart';
import '../../logic/controller/auth_controller.dart';
import '../../logic/controller/setting_controller.dart';
import 'auth_Buttom.dart';
import 'chek_widgets.dart';
import 'count_Un.dart';
import 'login_screen.dart';

class signUpScreen extends GetWidget<AuthController> {
  signUpScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final controller = Get.put(AuthController());


  final cont = Get.put(SettingController());
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
                              text: " SIGN ",
                              underline: TextDecoration.none,
                              color: mainColor,
                              fontsize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                            TextUtiles(
                              text: " UP ",
                              underline: TextDecoration.none,
                              color: Colors.black,
                              fontsize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(
                          controller: nameCont,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your name';
                            }
                            return null;
                          },
                          prefixIcon: Image.asset("assets/images/user.png"),
                          suffixIcon: Text(""),
                          hitText: "User Name",
                          hintStyle: '',
                        ),
                        const SizedBox(
                          height: 20,
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
                          suffixIcon: Text(""),
                          hitText: "-Email",
                          hintStyle: '',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        
                        GetBuilder<AuthController>(builder: (controller) {
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
                        const SizedBox(
                          height: 20,
                        ),
                        checkWidget(),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<AuthController>(builder: (controller) {
                          return AuthButtom(
                            onTap: (() {
                              
                              if (controller.isCheckBox == false) {
                                Get.snackbar("Check Box",
                                    "Please, Accept terms 7 conditions");
                              } else if (_key.currentState!.validate()) {
                                controller.signUpUsingFirebase(emailCont.text,
                                    passCont.text, nameCont.text);
                                controller.isCheckBox = true;
                              }
                            }),
                            txt: "SIGN UP",
                          );
                        })
                      ],
                    ),
                  ),
                ),
                ContUn(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  txt: 'Already have an Account?',
                  txttype: 'Log in',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
