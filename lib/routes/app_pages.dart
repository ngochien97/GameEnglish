import 'package:get/get.dart';
import '../pages/details/bindings/detail_binding.dart';
import '../pages/details/presentation/views/detail_view.dart';
import '../pages/ending/binding/ending_binding.dart';
import '../pages/ending/presentation/views/ending_view.dart';
import '../pages/loading/binding/loading_binding.dart';
import '../pages/loading/presentation/views/loading_view.dart';
import '../pages/ranking/binding/ranking_binding.dart';
import '../pages/ranking/presentation/views/ranking_view.dart';
import '../pages/select/binding/select_binding.dart';
import '../pages/select/presentation/views/select_view.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.LOADING;

  static final routes = [
    GetPage(
      name: Routes.ENDING,
      page: () => EndingView(),
      binding: EndingBinding(),
    ),
    GetPage(
      name: Routes.LOADING,
      page: () => LoadingView(),
      binding: LoadingBinding(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: Routes.SELECT,
      page: () => SelectView(),
      binding: SelectCategoryBinding(),
    ),
    GetPage(
      name: Routes.RANKING,
      page: () => RankingView(),
      binding: RankingBinding(),
    ),
  ];
}
