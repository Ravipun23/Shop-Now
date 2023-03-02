import 'package:flutter/material.dart';
import 'package:shop_now/consts/consts.dart';

Widget customTextField({String? title, String? hint, controller, isPass}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title.toString().text.color(redColor).fontFamily(semibold).make(),
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: textfieldGrey,
            fontFamily: semibold
          ),
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: redColor)
          )
        ),
      ),
      10.heightBox,
    ],
  );
}