import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/common_widgets/appLogo_Widget.dart';
import 'package:shop_now/consts/consts.dart';
import 'package:shop_now/view/auth_screen/login_screen.dart';
import 'package:shop_now/view/home_screen/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription<User?> user;
//Creating a method to change the screen.
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      // Get.offAll(() => LoginScreen());
      // auth.authStateChanges().listen((User? user) {
      //   if (user == null && mounted) {
      //     Get.offAll(() => LoginScreen());
      //   } else {
      //     Get.offAll(() => Home());
      //   }
      // });
      user = auth.authStateChanges().listen((user) {
        if (user == null && mounted) {
          Get.offAll(() => LoginScreen());
          print('User is currently signed out!');
        } else {
          Get.offAll(() => Home());
          print('User is signed in!');
        }
      });
    });
  }

  @override
  // void dispose() {
  //   user.cancel();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              )),
          20.heightBox,
          appLogoWidget(),
          10.heightBox,
          appname.text.fontFamily(bold).size(22).white.make(),
          5.heightBox,
          appversion.text.white.make(),
          const Spacer(),
          credits.text.white.make(),
          20.heightBox
        ],
      ),
    );
  }
}
