import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/common_widgets/background_widget.dart';
import 'package:shop_now/consts/consts.dart';
import 'package:shop_now/view/catogeries_screen/items_details.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    6,
                    (index) => "Baby Clothing"
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make()
                        .box
                        .white
                        .padding(EdgeInsets.all(20))
                        .rounded
                        .margin(EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),
            20.heightBox,
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                color: whiteColor,
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemBuilder: (content, index) {
                      return Column(
                        children: [
                          Image.asset(
                            imgFc6,
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          Spacer(),
                          Align(child: categoriesList[index].text.fontFamily(semibold).color(darkFontGrey).make()),
                          10.heightBox,
                          "\$6000".text.fontFamily(semibold).color(darkFontGrey).make()
                        ],
                      ).box.white.shadowSm.rounded.clip(Clip.antiAlias).make().onTap(() {
                        Get.to(()=> ItemsDetails(title: categoriesList[index]));
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
