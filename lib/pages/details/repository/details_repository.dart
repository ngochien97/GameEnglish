import 'dart:convert';
import 'package:turtle_game/pages/details/enity/details_model.dart';
import 'package:turtle_game/pages/select/entity/answer_model.dart';
import 'package:turtle_game/shared/api_client/api_client.dart';
import 'package:turtle_game/shared/api_client/api_endpoint.dart';

abstract class DetailsRepository {
  Future<DetailsModel> details(String id);

  Future<AnswerModel> answer(
    String userId,
    String categoryId,
    String questionId,
    String answer,
  );
// Future<RegisterModel> registerPhone({
//   required String phoneNumber,
//   required String countryCode,
// });
}

class DetailsRepositoryIml implements DetailsRepository {
  final ApiClient _apiClient;

  DetailsRepositoryIml(this._apiClient);

  @override
  Future<DetailsModel> details(String id) async {
    final res = await _apiClient.get(ApiEndpoint.getListQuestionByCategory(id));
    return DetailsModel.fromJson(jsonDecode(res.data.toString()) as Map<String, dynamic>);
  }

  @override
  Future<AnswerModel> answer(
      String userId,
      String categoryId,
      String questionId,
      String answer,
      ) async {
    final res = await _apiClient.post(ApiEndpoint.ADD_ANSWER, data: {
      "user_id": userId,
      "category_id": categoryId,
      "question_id": questionId,
      "answer": answer,
    });
    return AnswerModel.fromJson(jsonDecode(res.data.toString()) as Map<String, dynamic>);
  }
// @override
// Future<RegisterModel> registerPhone({
//   required String phoneNumber,
//   required String countryCode,
// }) async {
//   final response = await _apiClient.post(ApiEndpoint.QUESTION, data: {
//     "phone": phoneNumber,
//     "country_code": countryCode,
//   });
//   return RegisterModel.fromJson(response.data as Map<String, dynamic>);
// }

}
