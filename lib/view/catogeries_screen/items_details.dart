import 'package:flutter/material.dart';
import 'package:shop_now/common_widgets/my_buttons.dart';
import 'package:shop_now/consts/consts.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(semibold).make(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
                color: redColor,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Swipe Section
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      height: 350,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      itemCount: 3,
                      itemBuilder: ((context, index) {
                        return Image.asset(
                          imgFc1,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ).box.rounded.clip(Clip.antiAlias).make();
                      })),

                  //Title and description and rating
                  10.heightBox,
                  title!.text
                      .fontFamily(semibold)
                      .size(16)
                      .color(darkFontGrey)
                      .make(),

                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    stepInt: true,
                    count: 5,
                    size: 22,
                  ),

                  10.heightBox,
                  "\$30,000"
                      .text
                      .size(22)
                      .color(redColor)
                      .fontFamily(bold)
                      .make(),
                  10.heightBox,

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller"
                                .text
                                .fontFamily(semibold)
                                .color(whiteColor)
                                .make(),
                            5.heightBox,
                            "In the House Brands"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make()
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: whiteColor,
                        child: Icon(
                          Icons.message,
                          color: darkFontGrey,
                        ),
                      )
                    ],
                  )
                      .box
                      .roundedSM
                      .height(80)
                      .color(textfieldGrey)
                      .padding(EdgeInsets.all(16))
                      .make(),

                  //Color selection
                  10.heightBox,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Color Row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color: "
                                .text
                                .color(textfieldGrey)
                                .fontFamily(bold)
                                .make(),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(EdgeInsetsDirectional.symmetric(
                                        horizontal: 6))
                                    .make()),
                          ),
                        ],
                      ).box.white.shadowSm.padding(EdgeInsets.all(8)).make(),

                      //Quantity Row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity: "
                                .text
                                .fontFamily(bold)
                                .color(textfieldGrey)
                                .make(),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.remove)),
                              "0".text.fontFamily(bold).size(18).make(),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add)),
                              "Available(0)"
                                  .text
                                  .white
                                  .color(textfieldGrey)
                                  .make(),
                            ],
                          ),
                        ],
                      ).box.white.shadowSm.padding(EdgeInsets.all(8)).make(),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total Price: "
                                .text
                                .fontFamily(bold)
                                .color(textfieldGrey)
                                .make(),
                          ),
                          "\$0.00"
                              .text
                              .fontFamily(bold)
                              .color(redColor)
                              .size(16)
                              .make()
                        ],
                      ).box.white.shadowSm.padding(EdgeInsets.all(8)).make(),

                      //Description
                      10.heightBox,
                      "Description: "
                          .text
                          .fontFamily(bold)
                          .color(darkFontGrey)
                          .make(),
                      5.heightBox,
                      "This is the best product  hdaskf fadjfh df ahdfk fh adf aj ajhjdfha fh a"
                          .text
                          .color(darkFontGrey)
                          .make(),
                      10.heightBox,

                      //List Tiles
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: itemDetailsListTileList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: itemDetailsListTileList[index]
                                  .text
                                  .fontFamily(bold)
                                  .size(14)
                                  .color(darkFontGrey)
                                  .make(),
                              trailing: Icon(Icons.arrow_forward),
                            );
                          }),
                      10.heightBox,
                      productYouMay.text
                          .fontFamily(bold)
                          .size(16)
                          .color(darkFontGrey)
                          .make(),
                      10.heightBox,

                      //Product Yo may Like
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              6,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        imgP1,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      10.heightBox,
                                      "Laptop 4GB/256GB"
                                          .text
                                          .color(darkFontGrey)
                                          .fontFamily(semibold)
                                          .make(),
                                      10.heightBox,
                                      "\$6000"
                                          .text
                                          .color(redColor)
                                          .fontFamily(bold)
                                          .size(18)
                                          .make()
                                    ],
                                  )
                                      .box
                                      .roundedSM
                                      .white
                                      .margin(
                                          EdgeInsets.symmetric(horizontal: 4))
                                      .padding(EdgeInsets.all(8))
                                      .make()),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: myButtons(
                  color: redColor,
                  onTap: () {},
                  title: "Add Cart",
                  textColor: whiteColor))
        ],
      ),
    );
  }
}
