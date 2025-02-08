import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/asset_constants.dart';
import 'shimmer/shimmer_base.dart';

class CachedNetworkImageCustom extends StatelessWidget {
  final String imageUrl;
  final String? errorImage;
  final double? height, width;
  final bool isProfilePhoto, isBoxFitContain, isLogo;
  final BoxFit fit;
  final Color? errorImageColor;

  const CachedNetworkImageCustom({
    super.key,
    required this.imageUrl,
    this.isProfilePhoto = false,
    this.isLogo = false,
    this.isBoxFitContain = false,
    this.height = 114,
    this.width = 114,
    this.fit = BoxFit.fill,
    this.errorImage,
    this.errorImageColor,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // imageUrl: AppHelper().validateImageURL(imageUrl ?? ""),
      imageUrl:  imageUrl,
      height: height,
      width: width,
      fit: isProfilePhoto ? BoxFit.cover : BoxFit.cover,
      placeholder: (context, url) => ShimmerBase(
        child: Container(
          height: height,
          width: width,
          color: AppColor.grey,
        ),
      ),
      errorWidget: (context, url, error) {
        return Image.asset(
          isProfilePhoto
              ? ""
              : isLogo
                  ? ""
                  : errorImage ?? "",
          height: height,
          width: width,
          fit: isProfilePhoto
              ? BoxFit.cover
              : isBoxFitContain
                  ? BoxFit.contain
                  : null,
        );
      },

      // placeholder: "assets/png/future_nation_logo.png",
    );
  }
}
