import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AcoountSetting extends GetxController {
  String?  email;
  String? name;
  

  CollectionReference userRef = FirebaseFirestore.instance.collection("users");

  Future<void> getdata() async {
    await userRef
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
          email  = value.docs[0]['email'];
          name  = value.docs[0]['name'];
          print(email);
          print(name);
          update();
        }
        
        );
  }
  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
