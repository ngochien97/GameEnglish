import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:turtle_game/base/base_controller.dart';
import 'package:turtle_game/constants/app_colors.dart';
import 'package:turtle_game/pages/details/enity/details_model.dart';
import 'package:turtle_game/pages/details/repository/details_repository.dart';
import 'package:get/get.dart';
import 'package:turtle_game/pages/ending/ending_model.dart';
import 'package:turtle_game/routes/app_pages.dart';
import 'package:turtle_game/shared/utils/dialog_loading.dart';

class DetailController extends BaseController<List<Question?>> {
  DetailController(this._detailsRepository);

  final DetailsRepository _detailsRepository;

  AssetsAudioPlayer player = AssetsAudioPlayer();
  AssetsAudioPlayer player2 = AssetsAudioPlayer();

  Color checkColors(String? status) {
    if (status == "true") {
      return AppColors.green;
    }

    if (status == "fail") {
      return AppColors.red1;
    }

    return AppColors.green1;
  }

  DetailsModel? listQuestion;

  RxInt index = 0.obs;
  RxInt correctAnswer = 0.obs;
  List<String> question = [];
  List<String> trueFail = [];
  List<String> answers = [];
  String? categoryId = "0";
  String? userId = "0";
  int? questionShow = 0;
  RxString answer = ''.obs;
  List<RxString> color = [
    "".obs,
    "".obs,
    "".obs,
    "".obs,
    "".obs,
    "".obs,
    "".obs,
    "".obs,
    "".obs,
    "".obs,
  ];

  @override
  void onInit() {
    print(arguments![0]?.question);
    categoryId = EndingModel.getCategoryId();
    userId = EndingModel.getUserId();
    questionShow = EndingModel.getQuestionShow();
    player.open(
      Playlist(audios: [
        Audio("assets/audio/correct_answer.mp3"),
      ]),
      autoStart: false,
    );
    player2.open(
      Playlist(audios: [
        Audio("assets/audio/wrong_answer.mp3")
      ]),
      autoStart: false,
    );
    super.onInit();
    // getListQuestion();
  }

  void getListQuestion() async {
    print("getListQuestion");
    String? id = '1';
    listQuestion = null;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await Future.delayed(Duration(seconds: 1));
        Get.dialog(DialogLoading());
        final res = await _detailsRepository.details(id);
        listQuestion = res;
        Get.back();
      }
    } on SocketException catch (_) {
      Get.snackbar('Thông báo',
          'Bạn chưa kết nối mạng vui lòng kiểm tra lại đường truyền');
    }
    update();
  }

  Future<void> addAnswer(
      String idUser, String questionId, String answer) async {
    final res = await _detailsRepository.answer(
        idUser, categoryId ?? "", questionId, answer);
    // print(res.listAnswerUser!.length);
    update();
  }

  void checkAnswer(String answerUser, String answerTrue) async {
    Get.dialog(DialogLoading());
    await Future.delayed(Duration(seconds: 1));
    question.add(arguments![index.value]!.question ?? "");
    answers.add(answerUser);
    if (answerUser != answerTrue) {
      player2.playlistPlayAtIndex(0);
      player2.pause();
      trueFail.add('fail');
      color[index.value].value = "fail";
      addAnswer('1', arguments![index.value]!.id ?? "", "0");
    }
    if (answerUser == answerTrue) {
      player.playlistPlayAtIndex(0);
      player.pause();
      trueFail.add('true');
      color[index.value].value = "true";
      addAnswer('1', arguments![index.value]!.id ?? "", "1");
      correctAnswer.value++;
    }
    if (index.value == 9 || index.value == (questionShow! - 1)) {
      Get.toNamed(
        Routes.ENDING,
      );
      EndingModel.setCorrectAnswer(correctAnswer.value);
      EndingModel.setQuestion(question);
      EndingModel.setTrueFail(trueFail);
      EndingModel.setAnswer(answers);
      index.value = 0;
      color = [
        "".obs,
        "".obs,
        "".obs,
        "".obs,
        "".obs,
        "".obs,
        "".obs,
        "".obs,
        "".obs,
        "".obs,
      ];
      correctAnswer.value = 0;
      question = [];
      trueFail = [];
      answers = [];
    }
    if (index.value != 9) {
      answer.value = answerUser;
      index.value++;
    }
    Get.back();
    update();
  }
}
