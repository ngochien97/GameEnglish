import 'package:get/get.dart';
import 'package:turtle_game/base/base_controller.dart';
import 'package:turtle_game/pages/ranking/entity/ranking_model.dart';
import 'package:turtle_game/pages/ranking/repository/ranking_repository.dart';
import 'package:turtle_game/pages/select/entity/select_model.dart';

class RankingController extends BaseController {
  RankingController(this._rankingRepository);
  final RankingRepository _rankingRepository;

  final listRankByType = RxList<Ranking?>();
  final listCategory = RxList<Category>();

  RxString rank = "1".obs;

  @override
  void onInit() {
    super.onInit();
    getListRankByType(rank.value);
  }

  void confirmRank() {
    rank.value;
    update();
  }

  void getListCategory() async {
    listCategory.value = [];
    final res = await _rankingRepository.category();
    listCategory.value = res.listCategory!;
    update();
  }

  void getListRankByType(String type) async {
    listRankByType.value = [];
    final res = await _rankingRepository.rankByType(type);
    listRankByType.value = res.listRanking!;
    print(listRankByType.length);
    update();
  }
}