// ignore_for_file: nullable_type_in_catch_clause

import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st/routes/route.dart';
import 'package:st/view/screens/main_screen.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  bool isVisibility = false;
  bool isCheckBox = false;
  var displayUserName = '';
  var displayUserPhoto= '';

  void isvisibility() {
    isVisibility = isVisibility;

    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  Future<void> signUpUsingFirebase(
      String email, String password, String name) async {
    try {
      var result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
       
      );

      if (result != null) {
        await userRef.doc().set({
          'email': email,
          'password': password,
          'name':name ,
          'uid': result.user!.uid
        }).then((value) {
          Get.back();
          Get.snackbar("Ok", "Signed Up");
        });
      }
    } catch (e) {
      if (e.toString() ==
          "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
        Get.snackbar("Erorr", "The email is wrong",
            backgroundColor: Colors.red.shade300);
      } else if (e.toString() ==
          "[firebase_auth/invalid-email] The email address is badly formatted.") {
        Get.snackbar("Erorr", "wright The email right",
            backgroundColor: Colors.red.shade300);
      } else if (e.toString() ==
          "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.") {
        Get.snackbar("Erorr", "The password is wrong",
            backgroundColor: Colors.red.shade300);
      }
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> LoginUsingFirebase(String email, String password) async {
    try {
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        Get.to( mainScreen());
      }
    } catch (e) {
      if (e.toString() ==
          "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
        Get.snackbar("Erorr", "The email is wrong",
            backgroundColor: Colors.red.shade300);
      } else if (e.toString() ==
          "[firebase_auth/invalid-email] The email address is badly formatted.") {
        Get.snackbar("Erorr", "wright The email right",
            backgroundColor: Colors.red.shade300);
      } else if (e.toString() ==
          "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.") {
        Get.snackbar("Erorr", "The password is wrong",
            backgroundColor: Colors.red.shade300);
      }
    }
  }

  Future<void> resetrUsingFirebase(String email) async {
    try {
      var reset = await firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } catch (e) {
      if (e.toString() == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.toString() == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  
}


Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
// Future<void> googleREgest() async {
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//   try {
//     final displayUserName = googleUser!.displayName;
//     final displayUserPhoto = googleUser.photoUrl;

//     Get.offAllNamed(Routs.mainScreen);
//   } catch (e) {
//     Get.snackbar("Erro", e.toString());
//   }
// }

void FacebookrUsingFirebase() async {}

Future<void> signOutUsingFirebase() async{
  try{
   await FirebaseAuth.instance.signOut();
   

  }catch(e){
     Get.snackbar("Erro", e.toString(),);
  }

}
