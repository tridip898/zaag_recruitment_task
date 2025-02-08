import 'package:get/get.dart';

import '../modules/add_favourite_item/add_favourite_item_binding.dart';
import '../modules/add_favourite_item/add_favourite_item_view.dart';
import '../modules/favourite_item/favourite_item_binding.dart';
import '../modules/favourite_item/favourite_item_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FAVOURITE_ITEM;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITE_ITEM,
      page: () => const FavouriteItemView(),
      binding: FavouriteItemBinding(),
    ),
    GetPage(
      name: _Paths.ADD_FAVOURITE_ITEM,
      page: () => const AddFavouriteItemView(),
      binding: AddFavouriteItemBinding(),
    ),
  ];
}
