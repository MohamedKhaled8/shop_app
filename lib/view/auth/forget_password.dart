import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/auth/auth_Buttom.dart';

import '../../logic/controller/auth_controller.dart';
import 'auth_text_form_field.dart';

class ForgetPassword extends GetWidget<AuthController> {
   ForgetPassword({Key? key}) : super(key: key);
final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController emailCont = TextEditingController();
    final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          centerTitle: T,
          title: const Text(
            "Forgot Password",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: 
        
        Form(
          
          key: _key,
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 35,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                    " If you want to recover your account, then please provide your email ID below.....",
                    
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),),
                  const   SizedBox(
                      height: 50,
                    ),
                    Image.asset("assets/images/forgetpass copy.png" , 
                    width: 250,),
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
                          suffixIcon: Text(""),
                          hitText: "-Email",
                          hintStyle: '',
                        ),
                        const SizedBox(
                          height:50
                        ),
                        GetBuilder<AuthController>(builder: (cotroller) => AuthButtom(txt: "SEND", onTap: (){
                               if(_key.currentState!.validate()){
                                controller.resetrUsingFirebase(emailCont.text);
                               };
                                validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your email';
                          }
                          return null;
                        };


                        }),)
              ],
            ),
          ),
        )),
      ),
    );
  }
}
