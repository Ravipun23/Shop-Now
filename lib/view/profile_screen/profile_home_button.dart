import 'package:flutter/material.dart';
import 'package:shop_now/consts/consts.dart';

Widget profileHomeButton({String? number, width,height, String? title}) {
  return Column(
    children: [
      number!.text.fontFamily(bold).color(darkFontGrey).size(18).make(),
      10.heightBox,
      title!.text.color(darkFontGrey).make()
    ],
  )
      .box
      .white
      .padding(EdgeInsets.all(8))
      .size(width,height)
      .rounded.shadowSm
      .make();
}
