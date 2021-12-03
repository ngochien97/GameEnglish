import 'package:get/get.dart';
import 'package:turtle_game/pages/ending/presentation/controllers/ending_controller.dart';
import 'package:turtle_game/pages/ending/repository/ending_repository.dart';

class EndingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EndingRepository>(() => EndingRepositoryIml(Get.find()));
    Get.lazyPut(() => EndingController(Get.find()));
  }

}
