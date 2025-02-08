import 'package:get/get.dart';
import 'package:zaag_recruitment_task/app/core/state/global_state.dart';
import 'package:zaag_recruitment_task/app/routes/app_pages.dart';

class FavouriteItemController extends GetxController {
  final globalState=Get.find<GlobalState>();
  @override
  void onInit() {
    super.onInit();
  }

  addFav() {
    Get.toNamed(Routes.ADD_FAVOURITE_ITEM);
  }
}
