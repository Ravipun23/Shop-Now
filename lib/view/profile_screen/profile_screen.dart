import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/common_widgets/background_widget.dart';
import 'package:shop_now/consts/consts.dart';
import 'package:shop_now/controller/profile_controller.dart';
import 'package:shop_now/services/firestore_services.dart';
import 'package:shop_now/view/auth_screen/login_screen.dart';
import 'package:shop_now/view/profile_screen/edit_profile.dart';
import 'package:shop_now/view/profile_screen/profile_home_button.dart';

import '../../controller/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ProfileController controller = Get.put(ProfileController());

    return backgroundWidget(
        child: Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          // stream: FirestoreServices.getUser("S19MQBWumrRcazDFI1iwXXpBYnT2"),
          stream: FirestoreServices.getUser(),
          builder: (context, AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            }else{
              
              var data = snapshot.data!.docs[0];
              return Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    print(data['image'].toString());
                    Get.to(EditProfile(editData: data,));
                  },
                  icon: Icon(
                    Icons.edit,
                    color: whiteColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4, right: 10, left: 4),
              child: Row(
                children: [
                  (data['image'] == " ")?Image.asset(
                    imgProfile,
                    width: 80,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make():
                  Image.network(
                    data['image'],
                    width: 60,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                  ,
                  5.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ("${data['name']}").text.fontFamily(semibold).white.make(),
                        ("${data['email']}").text.fontFamily(semibold).white.make()
                      ],
                    ),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: whiteColor)),
                      onPressed: () async {
                        await Get.put(AuthController()).signOutMethod(context);
                        Get.offAll(() => LoginScreen());
                        VxToast.show(context, msg: loggedOut);
                      },
                      child: "Log Out".text.white.make())
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                profileHomeButton(
                    width: context.screenWidth / 3.5,
                    height: context.screenHeight * 0.09,
                    number: data['cartCount'],
                    // number: "00",
                    title: "In Your Cart"),
                profileHomeButton(
                    width: context.screenWidth / 3.5,
                    height: context.screenHeight * 0.09,
                    number: data['wishlistCount'],
                    // number: "00",
                    title: "00"),
                profileHomeButton(
                    width: context.screenWidth / 3.5,
                    height: context.screenHeight * 0.09,
                    // number: "00",
                    number: data['orderCount'],
                    title: "Your Orders")
              ],
            ),
            ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: darkFontGrey,
                        ),
                    shrinkWrap: true,
                    itemCount: profileButtomIconList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.asset(
                          profileButtomIconList[index],
                          width: 22,
                        ),
                        title: profileButtonNameList[index]
                            .text
                            .fontFamily(bold)
                            .color(darkFontGrey)
                            .size(15)
                            .make(),
                      );
                    })
                .box
                .white
                .rounded
                .margin(EdgeInsets.all(8))
                .padding(EdgeInsets.all(8))
                .shadowSm
                .make()
                .box
                .color(redColor)
                .padding(EdgeInsets.all(8))
                .make()
          ],
        );
            }
            
          }),
      ),
    ));
  }
}
