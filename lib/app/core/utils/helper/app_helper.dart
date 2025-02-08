
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../network/api_endpoint.dart';
import '../../constants/app_constants.dart';
import '../../state/global_state.dart';

class AppHelper {


  hideLoader() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  unFocus() {
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  showLoader({needToShow = true}) {
    if (needToShow) {
      if (!EasyLoading.isShow) {
        return EasyLoading.show(
          status: "Loading...",
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: kDebugMode ? true : false,
        );
      }
    }
  }

  validateImageURL(String url) {
    String finalUrl = url;
    if (!url.startsWith("assets")) {
      if (url.startsWith("upload")) {
        finalUrl = imageShowUrl + url;
      } else if (url.startsWith("/storage")) {
        finalUrl = imageShowUrl + url;
      } else if (!url.contains("/")) {
        finalUrl = imageShowUrl + url;
      } else if (!url.contains("http")) {
        finalUrl = imageShowUrl + url;
      }
    }
    return finalUrl;
  }

  isValidImageUrl(String? url) {
    if (url == null) {
      return false;
    } else {
      if (url == imageShowUrl || url == "") {
        return false;
      }
      return true;
    }
  }

  String getOrdinal(int number) {
    if (number % 100 >= 11 && number % 100 <= 13) {
      return '${number}th';
    } else {
      switch (number % 10) {
        case 1:
          return '${number}st';
        case 2:
          return '${number}nd';
        case 3:
          return '${number}rd';
        default:
          return '${number}th';
      }
    }
  }


  String replaceNumber(String input) {
    try {
      String locale = Get.locale?.languageCode ?? "en";
      const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      if (locale == "bn") {
        const bangla = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
        for (int i = 0; i < english.length; i++) {
          input = input.replaceAll(english[i], bangla[i]);
        }
      }
      /*else if (locale == "hi") {
        const hindi = ['०', '१', '२', '३', '४', '५', '६', '७', '८', '९'];
        for (int i = 0; i < english.length; i++) {
          input = input.replaceAll(english[i], hindi[i]);
        }
      }*/
      return input;
    } catch (e) {
      logger.d('convertTransactionDateFormat:  $e');
      return input;
    }
  }

}
