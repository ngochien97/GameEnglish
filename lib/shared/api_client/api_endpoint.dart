class ApiEndpoint {
  static const String QUESTION = '/question/getQuestionByCategory';
  static const String ANSWER = '/answerUser/getAnswerUserByUserId';
  static const String ADD_ANSWER = '/answerUser/add';
  static const String CATEGORIES = '/category/categoryList';
  static const String ADD_RANK = '/ranking/add';
  static const String UPDATE_RANK = '/ranking/edit';
  static const String RANK = '/ranking/getRank';
  static const String RANK_BY_TYPE = '/ranking/getRankByTypeRank';

  static String getListQuestionByCategory(String id) {
    return '$QUESTION/$id';
  }

  static String getListAnswerByCategoryAndUser(String id) {
    return '$ANSWER/$id';
  }

  static String getListRankByTypeRank(String id) {
    return '$RANK_BY_TYPE/$id';
  }
}