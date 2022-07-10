
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:login_signup_screen/view/home-page-fridge.dart';
import 'package:login_signup_screen/view/contents-page.dart';
import 'package:login_signup_screen/view/login.dart';
import 'package:login_signup_screen/view/welcomepage.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
 final email="".obs;
 final password="".obs;




  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _startScreen);
  }

  _startScreen(User? user) {
      Get.offAll(() => HomePage());

  }


  void login()async {
    try {

      await auth.signInWithEmailAndPassword(email: email.value, password: password.value);
      if(_user!=null){
        Get.offAll(() => FirstPage());
      }
    } catch (e) {
      Get.snackbar(
        "AboutUser",
        "UserMessage",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blueAccent,
        titleText: Text(
          "login failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void logout()async{
    Get.to(HomePage);
  }
}
