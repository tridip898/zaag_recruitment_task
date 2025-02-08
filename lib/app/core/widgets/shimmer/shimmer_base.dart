// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/app_colors.dart';

class ShimmerBase extends StatelessWidget {
  final Widget child;
  final Color baseColor, highlightColor;

  const ShimmerBase({
    Key? key,
    required this.child,
    this.baseColor = AppColor.shimmerBaseColor,
    this.highlightColor = AppColor.shimmerHighlightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: baseColor, highlightColor: highlightColor, child: child);
  }
}
