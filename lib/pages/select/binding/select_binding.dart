import 'package:get/get.dart';
import 'package:turtle_game/pages/select/presentation/controllers/select_controller.dart';
import 'package:turtle_game/pages/select/repository/select_repository.dart';


class SelectCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectCategoryRepository>(() => SelectCategoryRepositoryIml(Get.find()));
    Get.lazyPut(() => SelectCategoryController(Get.find()));
  }

}