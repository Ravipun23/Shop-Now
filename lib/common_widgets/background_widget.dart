import 'package:flutter/material.dart';
import 'package:shop_now/consts/consts.dart';

Widget backgroundWidget({Widget? child}) {
  return Container(
    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imgBackground),fit: BoxFit.fill)),
    child: child,
  );
}
