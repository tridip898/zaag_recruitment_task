import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaag_recruitment_task/app/core/constants/app_constants.dart';
import 'package:zaag_recruitment_task/app/core/widgets/app_edit_text.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/my_text_style.dart';
import '../../core/widgets/app_circle_network_image_viewer.dart';
import 'add_favourite_item_controller.dart';

class AddFavouriteItemView extends GetView<AddFavouriteItemController> {
  const AddFavouriteItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColor.black,
            ),
          ),
        ),
        title: Text(
          'Search',
          style: text18Style(),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppEditText(
                title: "",
                controller: controller.searchController,
                hintText: "Search items here",
                isRequired: false,
                suffixIcon: Icons.search_rounded,
              ),
            ),
            gapH8,
            Obx(() {
              if (!controller.isDataLoaded.value) {
                return Container();
              }
              if (controller.itemList.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Text("No Item Found",style: text18Style(),),
                  ),
                );
              }
              return Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: ListView.separated(
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 8.h, bottom: 12.h),
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      var data = controller.itemList[index];
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.black.withValues(alpha: 0.04),
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
                            AppCircleNetworkImageViewer(data.avatar, 60, 32),
                            gapW12,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    data.email ?? "",
                                    style: text14Style(
                                      isWeight500: true,
                                      color: AppColor.textColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            gapW12,
                            InkWell(
                              onTap: () {
                                controller.favClick(data);
                              },
                              child: Icon(
                                (data.isFav ?? false)
                                    ? Icons.favorite
                                    : Icons.favorite_border_rounded,
                                color: (data.isFav ?? false)
                                    ? Colors.red
                                    : Colors.grey,
                                size: 20.w,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, index) {
                      return gapH12;
                    },
                    itemCount: controller.itemList.length,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
