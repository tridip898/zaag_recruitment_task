import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaag_recruitment_task/app/core/constants/app_constants.dart';
import 'package:zaag_recruitment_task/app/core/state/global_state.dart';
import 'package:zaag_recruitment_task/app/data/api_response/item_response_model.dart';
import 'package:zaag_recruitment_task/app/network/api_endpoint.dart';

class AddFavouriteItemController extends GetxController {
  final globalState = Get.find<GlobalState>();
  final searchController = TextEditingController();
  final itemList = <Data>[].obs;
  final itemListClone = <Data>[];
  final favoriteIds = <String>[].obs;
  final isDataLoaded = false.obs;

  @override
  void onInit() {
    fetchItemList();
    searchController.addListener(() {
      runFilter(searchController.text);
    });
    super.onInit();
  }

  void fetchItemList() async {
    var param=<String,dynamic>{};
    param['page']=1;
    param['per_page']=20;
    var response = await apiClient.getAPI(itemListUrl, fetchItemList,mQueryParameters: param);
    if (response != null) {
      final Map<String, dynamic> data = json.decode(response.toString());
      ItemResponseModel model = ItemResponseModel.fromJson(data);
      List<Data> temp = [];
      isDataLoaded.value = true;

      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String> favoriteIds = prefs.getStringList('favoriteIds') ?? [];

      for (var item in model.data ?? []) {
        if (favoriteIds.contains(item.id.toString())) {
          item.isFav = true;
        } else {
          item.isFav = false;
        }
        temp.add(item);
      }
      itemList.clear();
      itemListClone.clear();
      itemList.addAll(temp);
      itemList.refresh();
      itemListClone.addAll(itemList);
    }
  }

  void favClick(Data data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteIds = prefs.getStringList('favoriteIds') ?? [];

    if (data.isFav == false) {
      if (!favoriteIds.contains(data.id.toString())) {
        favoriteIds.add(data.id.toString());
      }
      if (!globalState.favItemList.contains(data)) {
        globalState.favItemList.add(data);
      }
      data.isFav = true;
    } else {
      favoriteIds.remove(data.id.toString());
      globalState.favItemList.removeWhere((item) => item.id == data.id);
      data.isFav = false;
    }
    await prefs.setStringList('favoriteIds', favoriteIds);

    itemList.refresh();
    globalState.favItemList.refresh();
  }

/* void favClick(Data data) {
    if (data.isFav == false) {
      data.isFav = true;
      if (!globalState.favItemList.contains(data)) {
        globalState.favItemList.add(data);
      }
      itemList.refresh();
    } else {
      data.isFav = false;
      globalState.favItemList.remove(data);
      itemList.refresh();
    }
    // for (var data in globalState.favItemList) {}
    // if (globalState.favItemList.contains(data)) {
    //   globalState.favItemList.remove(data);
    // } else {
    //   globalState.favItemList.add(data);
    // }
  }*/

  void runFilter(String searchKeyword) {
    logger.i("Length ${itemList.length}");
    List<Data> results = [];
    if (searchKeyword.isEmpty) {
      results = itemListClone;
      logger.i("Results1 ${results.length}");
    } else {
      results = itemListClone.where((dictionary) {
        return ((dictionary.firstName ?? "") +
                (dictionary.lastName ?? "") +
                (dictionary.email ?? ""))
            .toLowerCase()
            .contains(searchKeyword.toLowerCase());
      }).toList();
      logger.i("Results2 ${results.length}");
    }

    itemList.value = results;
  }
}
