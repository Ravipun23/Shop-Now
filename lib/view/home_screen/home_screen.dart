import 'package:flutter/material.dart';
import 'package:shop_now/common_widgets/home_buttons.dart';
import 'package:shop_now/consts/consts.dart';
import 'package:shop_now/view/home_screen/feature_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 60,
                color: lightGrey,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: search,
                    hintStyle: TextStyle(color: textfieldGrey),
                    fillColor: whiteColor,
                    filled: true,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //sliderLists Brands
                    VxSwiper.builder(
                      // isFastScrollingEnabled: true,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                        height: 150,
                        aspectRatio: 16 / 9,
                        itemCount: sliderLists.length,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemBuilder: ((context, index) {
                          return Image.asset(
                            sliderLists[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 10))
                              .make();
                        })),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => homeButtons(
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 2.5,
                            icon: (index == 0) ? icTodaysDeal : icFlashDeal,
                            title: (index == 0) ? todaytDeal : flashSale),
                      ),
                    ),
                    10.heightBox,

                    //Second Swiper

                    VxSwiper.builder(
                      // isFastScrollingEnabled: false,
                        height: 150,
                        aspectRatio: 16 / 9,
                        itemCount: sliderLists.length,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemBuilder: ((context, index) {
                          return Image.asset(
                            secondSliderLists[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 10))
                              .make();
                        })),

                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                          3,
                          (index) => homeButtons(
                              title: (index == 0)
                                  ? topCategories
                                  : (index == 1)
                                      ? brand
                                      : topSellers,
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth / 3.5,
                              icon: (index == 0)
                                  ? icTopCategories
                                  : (index == 1)
                                      ? icBrands
                                      : icTopSeller)),
                    ),

                    //Feature Categories
                    20.heightBox,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: featureCategories.text
                            .size(18)
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .make()),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    FeatureButton(
                                        title: featuredTitleList1[index],
                                        icon: featuredImagesList1[index]),
                                    10.heightBox,
                                    FeatureButton(
                                        title: featuredTitleList2[index],
                                        icon: featuredImagesList2[index])
                                  ],
                                )).toList(),
                      ),
                    ),

                    20.heightBox,

                    //Feature Product
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(color: redColor),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: featuredProduct.text
                                  .size(18)
                                  .white
                                  .fontFamily(bold)
                                  .make()),
                          10.heightBox,
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
                                          .margin(EdgeInsets.symmetric(
                                              horizontal: 4))
                                          .padding(EdgeInsets.all(8))
                                          .make()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,

                    //Swiper
                    VxSwiper.builder(
                        height: 150,
                        aspectRatio: 16 / 9,
                        itemCount: sliderLists.length,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemBuilder: ((context, index) {
                          return Image.asset(
                            secondSliderLists[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 10))
                              .make();
                        })),

                    //All products
                    20.heightBox,

                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300),
                        itemBuilder: (context, index) {
                          return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            imgP1,
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                          Spacer(),
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
                                          .margin(EdgeInsets.symmetric(
                                              horizontal: 4))
                                          .padding(EdgeInsets.all(10))
                                          .make();
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
