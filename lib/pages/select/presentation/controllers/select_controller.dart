import 'dart:io';

import 'package:get/get.dart';
import 'package:turtle_game/base/base_controller.dart';
import 'package:turtle_game/pages/details/enity/details_model.dart';
import 'package:turtle_game/pages/ending/ending_model.dart';
import 'package:turtle_game/pages/select/entity/answer_model.dart';
import 'package:turtle_game/pages/select/entity/select_model.dart';
import 'package:turtle_game/pages/select/repository/select_repository.dart';
import 'package:turtle_game/shared/utils/connection.dart';
import 'package:turtle_game/shared/utils/dialog_loading.dart';

class SelectCategoryController extends BaseController {
  SelectCategoryController(this._selectRepository);

  final SelectCategoryRepository _selectRepository;

  final listCategory = Rx(SelectModel());
  final listNumberQuestion = RxList<String>();
  final listNumberAnswer = RxList<String>();
  final listNumberAnswerDone = RxList<String>();
  final listAllAnswer = RxList<Answer>();
  final listQuestionShow = RxList<Question?>();
  final RxList<Answer?> lsAnswer = RxList<Answer?>([]);
  final RxList<Question?> lsQuestion = RxList<Question?>([]);

  String? userId = "0";

  @override
  void onInit() {
    getListCategory();
    ConnectionUtils.isNetworkConnected();
    userId = EndingModel.getUserId();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  void getListCategory() async {
    listNumberQuestion.value = [];
    listNumberAnswer.value = [];
    listNumberAnswerDone.value = [];
    print("getListCategory");
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await Future.delayed(Duration(milliseconds: 1));
        Get.dialog(DialogLoading());
        final res = await _selectRepository.select();
        listCategory.value = res;
        for (var i = 0; i < listCategory.value.listCategory!.length; i++) {
          listNumberQuestion.add("0");
          listNumberAnswer.add("0");
          listNumberAnswerDone.add("0");
        }
        await getAllAnswer(userId!);
        for (var i = 0; i < listCategory.value.listCategory!.length; i++) {
          await getNumberQuestion(listCategory.value.listCategory![i].id!, i);
          getNumberAnswerByCategory(listCategory.value.listCategory![i].id!, i);
        }
        Get.back();
      }
    } on SocketException catch (_) {
      Get.snackbar('Thông báo', 'Bạn chưa kết nối mạng vui lòng kiểm tra lại đường truyền');
    }
    update();
  }

  Future<void> getNumberQuestion(String idCategory, int index) async {
    final res = await _selectRepository.details(idCategory);
    listNumberQuestion[index] = res.listQuestion!.length.toString();
    update();
  }

  Future<void> getAllAnswer(String idUser) async {
    listAllAnswer.value = [];
    final res = await _selectRepository.answer(idUser);
    listAllAnswer.value = res.listAnswerUser!;
  }

  void getNumberAnswerByCategory(String id, int index) {
    var count = 0;
    var count2 = 0;
    for (var i = 0; i < listAllAnswer.length; i++) {
      if (listAllAnswer[i].categoryId == id && listAllAnswer[i].answer == "1") {
        count++;
      }
      if (listAllAnswer[i].categoryId == id) {
        count2++;
      }
    }
    listNumberAnswer[index] = count.toString();
    listNumberAnswerDone[index] = count2.toString();
    update();
  }

  Future<void> getListQuestion(String id) async {
    listQuestionShow.value = [];
    final res = await _selectRepository.details(id);
    lsAnswer.value = listAllAnswer.map((e) {
      if (e.categoryId == id) return e;
    }).toList();
    lsQuestion.value = res.listQuestion!;
    if (lsAnswer.isEmpty || lsAnswer.length == 0) {
      listQuestionShow.value = lsQuestion;
      return;
    }
    for (var i = 0; i < lsQuestion.length; i++) {
      if (lsAnswer.length > 0){
        var check = false;
        for (var j = 0; j < lsAnswer.length; j++) {
          if (lsAnswer[j]?.questionId == lsQuestion[i]!.id) {
            check = true;
            break;
          }
        }
        if (check == false) {
          listQuestionShow.add(lsQuestion[i]);
        }
      } else {
        listQuestionShow.add(lsQuestion[i]);
      }
    }
    update();
  }
}
