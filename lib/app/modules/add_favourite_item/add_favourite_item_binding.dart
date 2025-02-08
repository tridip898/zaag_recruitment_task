import 'package:get/get.dart';

import 'add_favourite_item_controller.dart';


class AddFavouriteItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFavouriteItemController>(
      () => AddFavouriteItemController(),
    );
  }
}
