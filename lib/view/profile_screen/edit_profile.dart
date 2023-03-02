import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/common_widgets/background_widget.dart';
import 'package:shop_now/common_widgets/custom_textfield.dart';
import 'package:shop_now/common_widgets/my_buttons.dart';
import 'package:shop_now/controller/profile_controller.dart';
import '../../consts/consts.dart';

class EditProfile extends StatelessWidget {
  final dynamic editData;
  const EditProfile({super.key, this.editData});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find<ProfileController>();
    controller.editNameController.text = editData['name'];
    controller.editPasswordController.text = editData['password'];

    return backgroundWidget(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => (controller.profileImagePath.value.isEmpty && editData['image'] == "")
                    ? Image.asset(
                        imgProfile,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : 
                    (controller.profileImagePath.isEmpty && editData['image'] != "")
                    ?Image.network(
                        editData['image'],
                        fit: BoxFit.cover,
                        width: 100,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    :Image.file(
                        File(controller.profileImagePath.value),
                        fit: BoxFit.cover,
                        width: 100,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
              ),
              myButtons(
                  title: "Change",
                  color: redColor,
                  onTap: () {
                    controller.changeImage(context);
                  },
                  textColor: whiteColor),
              20.heightBox,
              customTextField(
                  hint: "Change Name",
                  isPass: false,
                  title: "Name",
                  controller: controller.editNameController),
              10.heightBox,
              customTextField(
                  hint: "Change Password",
                  isPass: true,
                  title: "Password",
                  controller: controller.editPasswordController),
              10.heightBox,
              Obx(()=>(controller.isLoading.value)
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : SizedBox(
                        width: Get.width - 50,
                        child: myButtons(
                            title: "Change",
                            color: redColor,
                            onTap: () async {
                              controller.isLoading(true);
                              await controller.uploadImage();
                              await controller.updateEditProfile(
                                  name: controller.editNameController.text,
                                  password: controller.editPasswordController.text,
                                  image: controller.profileImageLink);
                              VxToast.show(context,
                                  msg: "Successfully Updated..");
                            },
                            textColor: whiteColor)),
              ),
            ],
          )
              .box
              .white
              .rounded
              .padding(EdgeInsets.all(16))
              .margin(EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03, vertical: Get.height * 0.08))
              .shadowSm
              .make(),
        ),
      ),
    );
  }
}
