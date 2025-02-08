import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../core/constants/app_constants.dart';
import 'api_endpoint.dart';

class ApiClient {
  Dio? dio;
  String token = "";

  ApiClient() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
    (dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<Response?> getAPI(
    String url,
    retry, {
    Map<String, dynamic>? mQueryParameters,
    // Map<String, dynamic>? headers,
    bool isHeaderRequired = true,
    bool needLoader = true,
    bool isApplicationJson = true,
  }) async {
    logger.w('URL:  $url\nQueryParameters: $mQueryParameters');

    appHelper.showLoader(needToShow: needLoader);
    appHelper.hideKeyboard();
    try {
      if (isHeaderRequired) {
        // await appHelper.getToken().then((value) => {
        //       token = value ?? "",
        //       logger.w('token: $token'),
        //       log('token: $token'),
        //     });
        dio?.options.headers["Authorization"] = "Bearer $token";
        if (isApplicationJson) {
          dio?.options.headers["Accept"] = "application/json";
        }
      }
      Response? response = await dio?.get(
        url,
        queryParameters: mQueryParameters,
      );
      logger.w(
          'URL:  $url\nHeader: ${dio?.options.headers}\nQueryParameters: $mQueryParameters\nResponse: $response');
      if (needLoader) {
        appHelper.hideLoader();
      }
      return response;
    } on DioException catch (e) {
      return exceptionHandler(e, retry, isHeaderRequired);
    }
  }

  Future<Response?> postAPI(
    String url,
    data,
    retry, {
    // Map<String, dynamic>? headers,
    bool isHeaderRequired = true,
    Map<String, dynamic>? mQueryParameters,
    needToShowLoader = true,
    needToHideLoader = true,
    needToShowLogoutMsg = true,
    isFormData = true,
    bool isApplicationJson = false,
  }) async {
    appHelper.showLoader(needToShow: needToShowLoader);
    appHelper.hideKeyboard();
    try {
      if (isHeaderRequired) {
        // await appHelper.getToken().then((value) => {
        //       token = value ?? "",
        //     });
        dio?.options.headers["Authorization"] = "Bearer $token";
        if (isApplicationJson) {
          dio?.options.headers["Accept"] = "application/json";
        }
      }
      FormData formData = FormData.fromMap(isFormData ? data : {});
      logger.d('URL:  $data');
      Response? response = await dio?.post(
        url,
        data: isFormData
            ? formData
            : data == null
                ? null
                : jsonEncode(data),
        queryParameters: mQueryParameters,
      );
      logger.w(
          'URL:  $url\nHeader: ${dio?.options.headers}\nData: $data\nResponse: $response');
      if (needToHideLoader) {
        appHelper.hideLoader();
      }
      return response;
    } on DioException catch (e) {
      return exceptionHandler(e, retry, isHeaderRequired,
          needToShowLogoutMsg: needToShowLogoutMsg);
    }
  }

  Future<Response?> putAPI(
    String url,
    data,
    retry, {
    // Map<String, dynamic>? headers,
    bool isHeaderRequired = true,
    Map<String, dynamic>? mQueryParameters,
    bool needLoader = true,
    bool isApplicationJson = false,
  }) async {
    appHelper.showLoader(needToShow: needLoader);
    appHelper.hideKeyboard();
    try {
      if (isHeaderRequired) {
        // await appHelper.getToken().then((value) => {
        //       token = value ?? "",
        //     });
        dio?.options.headers["Authorization"] = "Bearer $token";
        if (isApplicationJson) {
          dio?.options.headers["Accept"] = "application/json";
        }
      }
      logger.d('URL:  $data');
      Response? response = await dio?.put(
        url,
        data: data,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        queryParameters: mQueryParameters,
      );
      logger.w(
          'URL:  $url\nHeader: ${dio?.options.headers}\nData: $data\nResponse: $response');
      if (needLoader) {
        appHelper.hideLoader();
      }
      return response;
    } on DioException catch (e) {
      return exceptionHandler(e, retry, isHeaderRequired);
    }
  }

  Future<Response?> deleteAPI(
    String url,
    retry, {
    Map<String, dynamic>? mQueryParameters,
    // Map<String, dynamic>? headers,
    bool isHeaderRequired = true,
    bool isApplicationJson = false,
  }) async {
    logger.w('URL:  $url\nQueryParameters: $mQueryParameters');
    appHelper.showLoader();
    appHelper.hideKeyboard();
    try {
      if (isHeaderRequired) {
        // await appHelper.getToken().then((value) => {
        //       token = value ?? "",
        //     });
        dio?.options.headers["Authorization"] = "Bearer $token";
        if (isApplicationJson) {
          dio?.options.headers["Accept"] = "application/json";
        }
      }

      Response? response = await dio?.delete(
        url,
        queryParameters: mQueryParameters,
      );
      logger.w(
          'URL:  $url\nHeader: ${dio?.options.headers}\nQueryParameters: $mQueryParameters\nResponse: $response');
      appHelper.hideLoader();
      return response;
    } on DioException catch (e) {
      return exceptionHandler(e, retry, isHeaderRequired);
    }
  }

  exceptionHandler(DioException e, retry, bool isHeaderRequired,
      {needToShowLogoutMsg}) {
    printCatch(e, retry);
    appHelper.hideLoader();
    if (e.error.toString().contains("Connection failed")) {

      return e.response;
    } else if (e.message.toString().contains("connection took longer")) {
      appWidgets.showSimpleDialog(
        "Failed",
        "The connection took longer than expected. Please check that you have a proper internet connection and try again.",
        retry,
      );
      return e.response;
    }
    if (e.response?.statusCode == 401) {
      // appHelper.logout();
      // return e.response;
    } else if (e.response?.statusCode == 403) {
      return e.response;
    } else if (e.response?.statusCode == 404) {
      return e.response;
    } else if (e.response?.statusCode == 202) {
      return e.response;
    } else if (e.response?.statusCode == 203) {
      return e.response;
    } else if (e.response?.statusCode == 308) {
      return e.response;
    } else if (e.response?.statusCode == 424) {
      return e.response;
    } else if (e.response?.statusCode == 422) {
      return e.response;
    } else if (e.response?.statusCode == 500) {
      return e.response;
    }
  }

  Future<void> printCatch(DioException e, retry) async {
    logger.w('printCatch:  ${e.response?.statusCode}');

    if (e.response != null) {
      logger.w('Error Response data:  ${e.response?.data}');
      logger.w('Error Response headers:  ${e.response?.headers}');
      logger.w('Error Response statusCode:  ${e.response?.statusCode}');
    } else {
      logger.w('Error Response message:  ${e.message}');
    }
  }
}
