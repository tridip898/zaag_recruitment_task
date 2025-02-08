import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../network/api_client.dart';
import '../utils/helper/app_helper.dart';
import '../widgets/app_widgets.dart';
import 'app_colors.dart';

var logger = Logger();
var appWidgets = AppWidgets();
var appHelper = AppHelper();
var appColors = AppColor();
var apiClient = ApiClient();

var removingUnwantedData = RegExp(r'\[\d+\]$');
const Transition transition = Transition.fadeIn;

double mainPaddingW = 20.0.w;
double mainPaddingH = 20.0.h;
double borderRadius = 10.0;
const transitionDuration = 500;

enum Environment { prod, dev }

var environment = Environment.dev;

const fontSize32 = 32.0;
const fontSize36 = 36.0;
const fontSize28 = 28.0;
const fontSize24 = 24.0;
const fontSize20 = 20.0;
const fontSize18 = 18.0;
const fontSize16 = 16.0;
const fontSize15 = 15.0;
const fontSize14 = 14.0;
const fontSize13 = 13.0;
const fontSize12 = 12.0;

double buttonSize = 30;
const defaultBorderRadius = 8.0;
double widgetToTitlePadding = 12;

const defaultPadding = EdgeInsets.all(12);
const smallPadding = EdgeInsets.all(8);
final defaultBorder = BorderRadius.circular(12);

EdgeInsetsGeometry mainPaddingAll =
 EdgeInsets.symmetric(horizontal: mainPaddingH, vertical: mainPaddingH);

EdgeInsetsGeometry mainPaddingAllWH =
EdgeInsets.symmetric(horizontal: mainPaddingW, vertical: mainPaddingH);

EdgeInsetsGeometry mainPaddingWidthOnly =
 EdgeInsets.symmetric(horizontal: mainPaddingH);

EdgeInsetsGeometry mainPaddingWidthOnlyW =
EdgeInsets.symmetric(horizontal: mainPaddingW);

EdgeInsetsGeometry mainPaddingHeightOnly =
EdgeInsets.symmetric(vertical: mainPaddingH);
EdgeInsetsGeometry mainPaddingSymmetric(double leftRight, double topBottom) {
  return EdgeInsets.symmetric(horizontal: leftRight.w, vertical: topBottom.h);
}
var borderCircular = BorderRadius.circular(borderRadius);



//User Roll:
const admin = 1;
const farmer = 2;
const plant = 3;
const outlet = 4;
const consumer = 5;

final defaultRadius = BorderRadius.circular(16);

final Widget gapH3 = appWidgets.gapH(3);
final Widget gapH6 = appWidgets.gapH(6);
final Widget gapH8 = appWidgets.gapH(8);
final Widget gapW8 = appWidgets.gapW(8);
final Widget gapW3 = appWidgets.gapW(3);
final Widget gapH12 = appWidgets.gapH(12);
final Widget gapH16 = appWidgets.gapH(16);
final Widget gapH18 = appWidgets.gapH(18);
final Widget gapH20 = appWidgets.gapH(20);
final Widget gapH24 = appWidgets.gapH(24);
final Widget gapH30 = appWidgets.gapH(30);
final Widget gapH32 = appWidgets.gapH(32);
final Widget gapH48 = appWidgets.gapH(48);
final Widget gapW12 = appWidgets.gapW(12);
final Widget gapW16 = appWidgets.gapW(16);
final Widget gapW18 = appWidgets.gapW(18);
final Widget gapW20 = appWidgets.gapW(20);
final Widget gapW24 = appWidgets.gapW(24);

var regexConfig = {
  "full_name_bn": RegExp(r'[ঀ-৿]+'),
  "father_nid": RegExp(r'^(\d{10}|\d{17})$'),
  "mother_nid": RegExp(r'^(\d{10}|\d{17})$'),
  "birth_registration_no": RegExp(r'^(\d{17})$'),
  "student_email": RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'),
  "student_contact": RegExp(r'^01[1-9][0-9]{8}$'),
  "father_contact_no": RegExp(r'^01[1-9][0-9]{8}$'),
  "local_guardian_contact_no": RegExp(r'^01[1-9][0-9]{8}$'),
  "mother_contact_no": RegExp(r'^01[1-9][0-9]{8}$'),
  "father_name_en": RegExp(r'^[A-Z^.\s]+$'),
  "mother_name_en": RegExp(r'^[A-Z^.\s]+$'),
  "father_yearly_income": RegExp(r'^(?:[0-4]?\d{0,9}|5000000000)$'),
  "roll_number[0]": RegExp(r'^(\d{6})$'),
  "registration_number[0]": RegExp(r'^(\d{10})$'),
  "registration_number[1]": RegExp(r'^(\d{10})$'),
};

Pattern capitalLetterREGX = r'^[A-Z^.\\s]+$'; // Done
Pattern banglaLetterREGX = r"[ঀ-৿]+"; // Done
Pattern gmailREGX = r"[a-zA-Z0-9@gmail.com]+"; // Need Email Validator

//Need to work
Pattern sscRollREGX = r"^(\\d{6})$"; //
Pattern regnumberREGX = r"^(\\d{10})$"; //

//Name

const onBoard = "on_board";

const String subjectWise = "বিষয় ভিত্তিক";

String extractYoutubeCode(String url) {
  Uri uri = Uri.parse(url);

  if (uri.queryParameters["v"] != null) {
    return uri.queryParameters["v"].toString();
  }

  return '';
}



