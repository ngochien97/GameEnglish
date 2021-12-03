
import 'package:get/get.dart';
import 'package:turtle_game/base/base_controller.dart';
import 'package:turtle_game/pages/ending/ending_model.dart';
import 'package:turtle_game/pages/ending/repository/ending_repository.dart';
import 'package:turtle_game/pages/ranking/entity/ranking_model.dart';

class EndingController extends BaseController {
  EndingController(this._endingRepository);
  final EndingRepository _endingRepository;

  String? userID = "0";
  String? userName = "Minh";
  int? correctAnswer = 0;
  int? scoreHave = 0;
  int? num = 0;
  List<String>? question = [];
  List<String>? answers = [];
  List<String>? trueFail = [];
  String? categoryId = "0";
  final listRank = RxList<Ranking>();
  final listRankByType = RxList<Ranking>();

  @override
  void onInit() {
    super.onInit();
    getDataFromDetail();
    getListRank();
    categoryId = EndingModel.getCategoryId();
    userID = EndingModel.getUserId();
    userName = EndingModel.getUserName();
  }

  void getDataFromDetail() {
    correctAnswer = EndingModel.getCorrectAnswer();
    question = EndingModel.getQuestion();
    answers = EndingModel.getAnswer();
    trueFail = EndingModel.getTrueFail();
    update();
  }

  void addScore(String idUser,String score, String nameUser) async {
    final res = await _endingRepository.addScore(idUser, "1", nameUser, score, categoryId ?? "");
    update();
  }

  void updateScore(String idUser,String typeRank, String score, String nameUser) async {
    final res = await _endingRepository.updateScore(idUser, typeRank, nameUser, score, categoryId ?? "");
    update();
  }

  void getListRank() async {
    listRank.value = [];
    final res = await _endingRepository.rank();
    listRank.value = res.listRanking!;
    if(listRank.isNotEmpty) {
      getScoreUserHave();
      checkUserExist();
    }
    update();
  }

  void getScoreUserHave() {
    print('getScoreUserHave');
    for (var i = 0; i < listRank.length; i++) {
      if (listRank[i].userId == userID){
        scoreHave = int.parse(listRank[i].score!);
        num = scoreHave! + correctAnswer!;
        update();
      }
    }
    update();
  }
  void checkUserExist() {
    var contain = listRank.where((e) => e.userId == userID);
    var contain2 = listRank.where((e) => e.categoryId == categoryId);
    if (contain.isNotEmpty && contain2.isNotEmpty) {
      if(scoreHave! + correctAnswer! <= 49) {
        updateScore(userID!, "1", num.toString(), userName!);
      } else if (scoreHave! + correctAnswer! > 49 && scoreHave! + correctAnswer! <= 99) {
        updateScore(userID!, "2", num.toString(), userName!);
      } else if (scoreHave! + correctAnswer! > 99 && scoreHave! + correctAnswer! <= 199) {
        updateScore(userID!, "3", num.toString(), userName!);
      } else if (scoreHave! + correctAnswer! > 199 && scoreHave! + correctAnswer! <= 499) {
        updateScore(userID!, "4", num.toString(), userName!);
      } else if (scoreHave! + correctAnswer! > 499 && scoreHave! + correctAnswer! <= 999) {
        updateScore(userID!, "5", num.toString(), userName!);
      } else if (scoreHave! + correctAnswer! > 999) {
        updateScore(userID!, "6", num.toString(), userName!);
      }
    } else {
      addScore(userID!, correctAnswer!.toString(), userName!);
    }
    update();
  }
}