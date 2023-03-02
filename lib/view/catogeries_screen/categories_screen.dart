import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/common_widgets/background_widget.dart';
import 'package:shop_now/consts/consts.dart';
import 'categories_detail.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
        child: Scaffold(
      appBar: AppBar(
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 200,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoriesImagesList[index],
                    width: 120,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  10.heightBox,
                  categoriesList[index]
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .make()
                ],
              )
                  .box
                  .white
                  .rounded
                  .outerShadowSm
                  .clip(Clip.antiAlias)
                  .make()
                  .onTap(() {
                Get.to(() => CategoryDetail(
                      title: categoriesList[index],
                    ));
              });
            }),
      ),
    ));
  }
}
