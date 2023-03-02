import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/common_widgets/appLogo_Widget.dart';
import 'package:shop_now/common_widgets/background_widget.dart';
import 'package:shop_now/common_widgets/custom_textfield.dart';
import 'package:shop_now/consts/consts.dart';
import 'package:shop_now/controller/auth_controller.dart';
import 'package:shop_now/view/auth_screen/signup_screen.dart';
import 'package:shop_now/view/home_screen/home.dart';

import '../../common_widgets/my_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
  
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return backgroundWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Login to ${appname}".text.white.fontFamily(bold).size(22).make(),
              15.heightBox,
              Obx(()=>Column(
                  children: [
                    customTextField(title: email, hint: emailHint, isPass: false, controller: controller.emailController),
                    customTextField(
                        title: password, hint: passwordHint, isPass: true, controller: controller.passwordController),
                    Align(
                      alignment: Alignment.centerRight,
                      child:
                          TextButton(onPressed: () {}, child: forget.text.make()),
                    ),
                    5.heightBox,
              
                    //Login Button
                    (controller.isLoading.value)? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ): 
                    myButtons(
                            title: login,
                            textColor: whiteColor,
                            color: redColor,
                            onTap: () async{
                              controller.isLoading.value = true;
                              try{
                              await controller.loginMethod(context).then((value){
                                if(value != null){
                                  Get.offAll(Home());
                                  VxToast.show(context, msg: loggedIn);
                                }else{
                                  controller.isLoading.value = false;
                                }
                              });
                              }on FirebaseAuthException catch(e){
                                VxToast.show(context, msg: e.message.toString());
                                  controller.isLoading.value = false;
                              }
              
                            })
                        .box
                        .width(context.screenWidth - 50)
                        .make(),
                    5.heightBox,
                    createNew.text.color(fontGrey).make(),
                    10.heightBox,
              
                    //SIgnUp Button
                    myButtons(
                            title: signup,
                            color: lightGolden,
                            onTap: () {
                              Get.to(() => SingUpScreen());
                            },
                            textColor: redColor)
                        .box
                        .width(context.screenWidth - 50)
                        .make(),
                    10.heightBox,
                    loginWith.text.color(fontGrey).make(),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: whiteColor,
                                  child: Image.asset(
                                    socialMediaList[index],
                                    width: 30,
                                  ),
                                ),
                              )),
                    )
                  ],
                )
                    .box
                    .rounded
                    .white
                    .padding(EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
