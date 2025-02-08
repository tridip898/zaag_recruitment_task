import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zaag_recruitment_task/app/core/widgets/shimmer/shimmer_base.dart';

import '../constants/app_colors.dart';
import '../utils/helper/app_helper.dart';

class AppNetworkImageProvider extends StatelessWidget {
  final String imagePath;
  final double width, padding, radius, height;
  final BoxFit fit;

  const AppNetworkImageProvider(
    this.imagePath,
    this.width,
    this.height,
    this.radius, {
    super.key,
    this.padding = 8,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: AppHelper().validateImageURL(imagePath),
        height: height,
        width: width,
        fit: fit,
        progressIndicatorBuilder: (
          context,
          child,
          loadingProgress,
        ) {
          return ShimmerBase(
            child: Container(
              height: height,
              width: width,
              color: AppColor.grey,
            ),
          );
        },
        errorWidget: (
          BuildContext context,
          String url,
          dynamic error,
        ) {
          return SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset("assets/png/no-pictures.png"),
            ),
          );
        },
      ),
    );
  }
}
