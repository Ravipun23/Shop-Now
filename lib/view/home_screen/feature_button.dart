import 'package:flutter/material.dart';
import 'package:shop_now/consts/consts.dart';

Widget FeatureButton({String? title, icon,}){
  return Row(
    children: [
      Image.asset(icon,width: 60, fit: BoxFit.fill,),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  ).box.width(250).padding(EdgeInsets.all(4)).white.margin(EdgeInsets.symmetric(horizontal: 6)).white.roundedSM.outerShadowSm.make();
}