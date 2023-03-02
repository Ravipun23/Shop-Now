import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/common_widgets/appLogo_Widget.dart';
import 'package:shop_now/common_widgets/background_widget.dart';
import 'package:shop_now/common_widgets/custom_textfield.dart';
import 'package:shop_now/common_widgets/my_buttons.dart';
import 'package:shop_now/consts/consts.dart';
import 'package:shop_now/controller/auth_controller.dart';
import 'package:shop_now/view/home_screen/home.dart';
class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  bool isChecked = false;

  AuthController controller = Get.put(AuthController());

  //text Field controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var reTypePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            join.text.white.fontFamily(bold).size(19).make(),
            20.heightBox,
            Obx(()=> Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextField(
                      title: name,
                      hint: nameHint,
                      controller: nameController,
                      isPass: false),
                  customTextField(
                      title: email,
                      hint: emailHint,
                      controller: emailController,
                      isPass: false),
                  customTextField(
                      title: password,
                      hint: passwordHint,
                      controller: passwordController,
                      isPass: true),
                  customTextField(
                      title: reTypePassword,
                      hint: reTypePasswordHint,
                      controller: reTypePasswordController,
                      isPass: true),
                  Align(
                    alignment: Alignment.centerRight,
                    child:
                        TextButton(onPressed: () {}, child: forget.text.make()),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: redColor,
                          checkColor: whiteColor,
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          }),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: agree,
                              style: TextStyle(
                                  color: fontGrey, fontFamily: regular)),
                          TextSpan(
                              text: terms,
                              style: TextStyle(
                                  color: redColor, fontFamily: regular)),
                          TextSpan(
                              text: " & ",
                              style: TextStyle(
                                  color: fontGrey, fontFamily: regular)),
                          TextSpan(
                              text: privacy,
                              style:
                                  TextStyle(color: redColor, fontFamily: regular))
                        ])),
                      )
                    ],
                  ),
                  5.heightBox,
                  (controller.isLoading.value)? Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ),
                  ):
                  myButtons(
                          title: signup,
                          color: (isChecked) ? redColor : lightGrey,
                          onTap: () async{
                              controller.isLoading.value = true;
                            if (isChecked) {
                              try{
                              await controller.signupMethod(nameController.text.toString(),emailController.text.toString(), passwordController.text.toString(), context);
                                controller.storeUserData(nameController.text.toString(),emailController.text.toString(), passwordController.text.toString());
                              
                              Get.off(Home());
                              }on FirebaseAuthException catch(e){
                              controller.isLoading.value = false;
                                VxToast.show(context, msg: e.message.toString());
                              }
                            }
                          },
                          textColor:
                              (isChecked == true) ? whiteColor : darkFontGrey)
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  5.heightBox,
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: alreadyHaveAccount,
                        style: TextStyle(fontFamily: bold, color: fontGrey)),
                    TextSpan(
                        text: login,
                        style: TextStyle(fontFamily: bold, color: redColor))
                  ])).onTap(() {})
                ],
              )
                  .box
                  .white
                  .padding(const EdgeInsets.all(16))
                  .roundedSM
                  .width(context.screenWidth * 0.8)
                  .make(),
            ),
          ],
        ),
      ),
    ));
  }
}
