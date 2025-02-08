import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaag_recruitment_task/app/core/constants/app_colors.dart';
import 'package:zaag_recruitment_task/app/core/widgets/app_circle_network_image_viewer.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/my_text_style.dart';
import '../../core/widgets/app_button.dart';
import 'favourite_item_controller.dart';

class FavouriteItemView extends GetView<FavouriteItemController> {
  const FavouriteItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomNavBtnDesign(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH24,
            Padding(
              padding: mainPaddingWidthOnly,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello, Welcome back",
                    style: text20Style(
                      isWeight600: true,
                      color: AppColor.textColor,
                    ),
                  ),
                  Image.asset(
                    "assets/png/wave.png",
                    height: 28.w,
                    width: 28.w,
                  )
                ],
              ),
            ),
            gapH24,
            Obx(() {
              if (controller.globalState.favItemList.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Padding(
                      padding: mainPaddingWidthOnly,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "No items to show now.",
                            style: text16Style(color: Color(0xff8790AB)),
                          ),
                          gapH6,
                          Text(
                            "Please add some favorite items to see here.",
                            style: text14Style(color: Color(0xff8790AB)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: mainPaddingWidthOnly,
                      child: Text(
                        "Favourite Items",
                        style: text18Style(color: AppColor.textColor),
                      ),
                    ),
                    gapH8,
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 8.h, bottom: 12.h),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          var data = controller.globalState.favItemList[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColor.black.withValues(alpha: 0.04),
                                    blurRadius: 16,
                                    spreadRadius: 0,
                                  )
                                ]),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppCircleNetworkImageViewer(
                                    data.avatar, 60, 30),
                                gapW12,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name : ",
                                        style: text14Style(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        "${data.firstName ?? ""} ${data.lastName ?? ""}",
                                        style: text14Style(
                                          isWeight500: true,
                                          color: AppColor.textColor,
                                        ),
                                      ),
                                      gapH6,
                                      Text(
                                        "Email Address : ",
                                        style: text14Style(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        data.firstName ?? "",
                                        style: text14Style(
                                          isWeight500: true,
                                          color: AppColor.textColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                gapW12,
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20.w,
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, index) {
                          return gapH12;
                        },
                        itemCount: controller.globalState.favItemList.length,
                      ),
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  bottomNavBtnDesign() {
    return IntrinsicHeight(
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColor.white,
        ),
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, bottom: 24.h, top: 12.h),
        child: AppButton(
          text: "Add Favorite Item",
          backgroundColor: AppColor.textColor,
          onPressed: controller.addFav,
        ),
      ),
    );
  }
}
