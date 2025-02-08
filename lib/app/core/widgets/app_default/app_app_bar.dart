import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../constants/my_text_style.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title, actionImage;
  final double height, elevation, titleFontSize;
  final bool showHeaderTitle,
      needActionButtonList,
      isCenterTitle,
      needActionButton,
      needIconButton,
      showBackButton,
      showFilter,
      needWhiteBackButtonColor,
      showIconButton;
  final Function()? actionOnPressed, filterOnPressed, backCLick;
  final List<Widget>? actionsList;
  final Color? backgroundColor, titleColor;
  final Widget? leadingWidget, iconButton;
  final dynamic titleFontWeight;
  final IconData icons;

  const AppAppBar({
    super.key,
    this.title = "",
    this.actionImage = "",
    this.height = 55,
    this.elevation = 0,
    this.titleFontSize = fontSize16,
    this.showHeaderTitle = false,
    this.needActionButtonList = false,
    this.needIconButton = false,
    this.needWhiteBackButtonColor = false,
    this.isCenterTitle = true,
    this.needActionButton = false,
    this.showIconButton = false,
    this.showFilter = false,
    this.showBackButton = false,
    this.actionOnPressed,
    this.filterOnPressed,
    this.backCLick,
    this.actionsList,
    this.iconButton,
    this.backgroundColor = AppColor.white,
    this.leadingWidget,
    this.titleFontWeight = FontWeight.w600,
    this.titleColor,
    this.icons =  CupertinoIcons.bell,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(
        color: needWhiteBackButtonColor ? AppColor.white : AppColor.blackPure,
      ),
      title: title == ""
          ? Container()
          : Text(
              title,
              style: text18Style(
                fontWeight: titleFontWeight,
                fontSize: titleFontSize,
                color: titleColor,
              ),
            ),
      centerTitle: isCenterTitle,
      elevation: elevation,
      actions: needActionButtonList
          ? [
              needActionButton
                  ? needIconButton
                      ? IconButton(
                          onPressed: actionOnPressed,
                          icon: Icon(
                           icons,
                            size: 20.w,

                          ))
                      : Ink(
                          // padding: defaultPadding,
                          child: IconButton(
                            onPressed: actionOnPressed,
                            icon: Image.asset(
                              actionImage,
                              height: 20.w,
                              color: Colors.white,
                            ),
                          ),
                        )
                  : Container(),
              // showIconButton ? iconButton ?? const SizedBox() : const SizedBox(),
              iconButton ?? const SizedBox(),
            ]
          : actionsList ?? [],
    );
  }

  Widget backButton() {
    return InkWell(
      onTap: backCLick ??
          () {
            Get.back();
          },
      child: const Icon(
        Icons.arrow_back,
        // size: 38,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
