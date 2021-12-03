
import 'package:get/get.dart';
import 'package:turtle_game/pages/details/presentation/controllers/detail_controller.dart';
import 'package:turtle_game/pages/details/repository/details_repository.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsRepository>(() => DetailsRepositoryIml(Get.find()));
    Get.lazyPut(() => DetailController(Get.find()));
  }

}
