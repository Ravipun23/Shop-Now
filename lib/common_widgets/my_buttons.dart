import 'package:flutter/material.dart';
import 'package:shop_now/consts/consts.dart';

Widget myButtons({onTap,String? title,color,textColor}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.all(12),
    ),
    onPressed: onTap,
    child: title!.text.fontFamily(bold).color(textColor).make());
}