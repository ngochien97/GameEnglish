import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class EndingModel {
  static SharedPreferences? _preferences;

  static const _keyCorrectAnswer = 'correctanswer';
  static const _keyQuestion = 'question';
  static const _keyAnswers = 'answers';
  static const _keyTrueFail = 'truefail';
  static const _keyCategoryId = 'categoryid';
  static const _keyUserId = 'userid';
  static const _keyUserName = 'username';
  static const _keyQuestionShow = 'questionshow';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setCorrectAnswer(int correctanswer) async =>
      await _preferences?.setInt(_keyCorrectAnswer, correctanswer);

  static int? getCorrectAnswer() => _preferences?.getInt(_keyCorrectAnswer);

  static Future setQuestion(List<String> question) async =>
      await _preferences?.setStringList(_keyQuestion, question);

  static List<String>? getQuestion() => _preferences?.getStringList(_keyQuestion);

  static Future setAnswer(List<String> answers) async =>
      await _preferences?.setStringList(_keyAnswers, answers);

  static List<String>? getAnswer() => _preferences?.getStringList(_keyAnswers);

  static Future setTrueFail(List<String> truefail) async =>
      await _preferences?.setStringList(_keyTrueFail, truefail);

  static List<String>? getTrueFail() => _preferences?.getStringList(_keyTrueFail);

  static Future setCategoryId(String categoryid) async =>
      await _preferences?.setString(_keyCategoryId, categoryid);

  static String? getCategoryId() => _preferences?.getString(_keyCategoryId);

  static Future setUserId(String userid) async =>
      await _preferences?.setString(_keyUserId, userid);

  static String? getUserId() => _preferences?.getString(_keyUserId);

  static Future setUserName(String username) async =>
      await _preferences?.setString(_keyUserName, username);

  static String? getUserName() => _preferences?.getString(_keyUserName);

  static Future setQuestionShow(int questionshow) async =>
      await _preferences?.setInt(_keyQuestionShow, questionshow);

  static int? getQuestionShow() => _preferences?.getInt(_keyQuestionShow);
}