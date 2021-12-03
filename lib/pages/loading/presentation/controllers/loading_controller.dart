import 'package:turtle_game/base/base_controller.dart';
import 'package:turtle_game/pages/ending/ending_model.dart';
import 'package:turtle_game/pages/loading/repository/loading_repository.dart';

class LoadingController extends BaseController{
  LoadingController(this._loadingRepository);

  final LoadingRepository _loadingRepository;

  @override
  void onInit() {
    super.onInit();
  }

  void saveUserId(String userId, String userName) {
    EndingModel.setUserId(userId);
    EndingModel.setUserName(userName);
    update();
  }
}