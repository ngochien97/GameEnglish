
import 'package:get/get.dart';
import 'package:turtle_game/pages/loading/presentation/controllers/loading_controller.dart';
import 'package:turtle_game/pages/loading/repository/loading_repository.dart';

class LoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadingRepository>(() => LoadingRepositoryIml(Get.find()));
    Get.lazyPut(() => LoadingController(Get.find()));
  }

}
