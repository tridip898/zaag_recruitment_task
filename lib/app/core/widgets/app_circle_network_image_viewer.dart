import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaag_recruitment_task/app/core/widgets/shimmer/shimmer_base.dart';

import '../utils/helper/app_helper.dart';

class AppCircleNetworkImageViewer extends StatelessWidget {
  final String? imagePath;
  final double? width, padding, radius;
  final bool isProfile, needToShowImageView;

  const AppCircleNetworkImageViewer(
      this.imagePath,
      this.width,
      this.radius, {
        super.key,
        this.padding = 8,
        this.isProfile = false,
        this.needToShowImageView = false,
      });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius?.r,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: AppHelper().validateImageURL(imagePath ?? ""),
          height: width,
          width: width,
          fit: BoxFit.cover,
          /*placeholder: 'assets/placeholder_profile_pic.jpg',*/
          progressIndicatorBuilder: (
              context,
              child,
              loadingProgress,
              ) {
            return ShimmerBase(
              child: Container(
                height: width,
                width: width,
                color: Colors.white,
              ),
            );
          },
          errorWidget: (
              BuildContext context,
              String url,
              dynamic error,
              ) {
            return Container(
              height: width,
              width: width,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  isProfile
                      ? "assets/png/user.png"
                      : "assets/png/user.png",
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
