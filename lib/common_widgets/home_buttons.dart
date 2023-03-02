import 'package:flutter/material.dart';
import 'package:shop_now/consts/consts.dart';

Widget homeButtons({width,height,title,icon}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon,width: 26,),
      5.heightBox,
      todaytDeal.text.fontFamily(bold).color(darkFontGrey).make()
    ],
  ).box.size(width, height).rounded.shadowSm.white.make();
}