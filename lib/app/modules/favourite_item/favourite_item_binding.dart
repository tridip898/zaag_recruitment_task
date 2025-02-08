import 'package:get/get.dart';

import 'favourite_item_controller.dart';

class FavouriteItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavouriteItemController>(
      () => FavouriteItemController(),
    );
  }
}
