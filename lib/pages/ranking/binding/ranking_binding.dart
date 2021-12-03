import 'package:get/get.dart';
import 'package:turtle_game/pages/ranking/presentation/controllers/ranking_controller.dart';
import 'package:turtle_game/pages/ranking/repository/ranking_repository.dart';

class RankingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankingRepository>(() => RankingRepositoryIml(Get.find()));
    Get.lazyPut(() => RankingController(Get.find()));
  }

}
