import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

bool isBengali = Localizations.localeOf(Get.context!).languageCode == 'bn';

TextStyle textRegularStyle({
  color = AppColor.black,
  double fontSize = 14,
  fontWeight = FontWeight.normal,
  bool isColorPrimary = false,
  bool isColorWhite = false,
  bool isTextColor = false,
  bool isTextGrey = false,
  double? lineHeight,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize,
    color: isColorWhite
        ? AppColor.white
        : isColorPrimary
            ? AppColor.primaryColor
            : isTextGrey
                ? AppColor.textGrey
                : color,
    fontWeight: fontWeight,
    height: lineHeight,
  );
}

TextStyle textHeaderStyle({
  color = AppColor.headerTextColor,
  double fontSize = 24,
  fontWeight = FontWeight.w700,
  isColorWhite = false,
  bool isColorPrimary = false,
  double? lineHeight,
}) {
  return GoogleFonts.inter(
      fontSize: fontSize,
      color: isColorWhite
          ? AppColor.white
          : isColorPrimary
              ? AppColor.primaryColor
              : color,
      fontWeight: fontWeight,
      height: lineHeight);
}

TextStyle textAppBarStyle({
  color = AppColor.appBarTextColor,
  double fontSize = 16,
  fontWeight = FontWeight.w600,
  bool isGrayColor = false,
  bool isPrimaryColor = false,
  bool isPurpleColor = false,
  bool isColorWhite = false,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize,
    color: isGrayColor
        ? AppColor.gray
        : isPrimaryColor
            ? AppColor.primaryColor
            : isPurpleColor
                ? AppColor.purpleColor
                : isColorWhite
                    ? AppColor.white
                    : color,
    fontWeight: fontWeight,
  );
}

TextStyle textSemiLargeStyle({
  color = AppColor.appBarTextColor,
  double fontSize = 16,
  fontWeight = FontWeight.normal,
  bool isGrayColor = false,
  bool isPrimaryColor = false,
  bool isPurpleColor = false,
  bool isColorWhite = false,
  double? lineHeight,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize,
    color: isGrayColor
        ? AppColor.gray
        : isPrimaryColor
            ? AppColor.primaryColor
            : isPurpleColor
                ? AppColor.purpleColor
                : isColorWhite
                    ? AppColor.white
                    : color,
    fontWeight: fontWeight,
    height: lineHeight,
  );
}

TextStyle textSemiRegularStyle({
  color = AppColor.black,
  double fontSize = 12,
  fontWeight = FontWeight.normal,
  bool isColorPrimary = false,
  bool isColorWhite = false,
  bool isColorLikeWhite = false,
  bool isTextColor = false,
  bool isTextGrey = false,
  double? lineHeight,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize,
    color: isColorWhite
        ? AppColor.white
        : isColorPrimary
            ? AppColor.primaryColor
            : isColorLikeWhite
                ? AppColor.likeWhite
                : isTextGrey
                    ? AppColor.textGrey
                    : color,
    fontWeight: fontWeight,
    height: lineHeight,
  );
}

TextStyle textSmallStyle({
  color = AppColor.black,
  double fontSize = 10,
  fontWeight = FontWeight.normal,
  bool isColorPrimary = false,
  bool isColorWhite = false,
  bool isTextColor = false,
  bool isLikeWhiteColor = false,
  bool isTextGrey = false,
  double? lineHeight,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize,
    color: isColorWhite
        ? AppColor.white
        : isColorPrimary
            ? AppColor.primaryColor
            : isLikeWhiteColor
                ? AppColor.likeWhite
                : isTextGrey
                    ? AppColor.textGrey
                    : color,
    fontWeight: fontWeight,
    height: lineHeight,
  );
}

TextStyle textButtonStyle({
  color = AppColor.white,
  double fontSize = 18,
  bool isTextColor = false,
  fontWeight = FontWeight.w600,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize,
    color: isTextColor ? AppColor.black : color,
    fontWeight: fontWeight,
  );
}

final hintStyle = GoogleFonts.inter(
  fontSize: 14,
  color: AppColor.inputColor,
  fontWeight: FontWeight.w500,
);

List<BoxShadow> cardBoxShadow(
    {Color? color, double blurRadius = 20, double spreadRadius = 0}) {
  return [
    BoxShadow(
      color: color ?? AppColor.grey.withOpacity(.1),
      spreadRadius: spreadRadius,
      blurRadius: blurRadius,
    )
  ];
}
