import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:turtle_game/database/local_storage.dart';
import 'package:turtle_game/database/sqflite/repository/db_repository.dart';
import 'package:turtle_game/shared/api_client/api_client.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => LocalStorageImpl());
    Get.lazyPut(() => DBRepository());
    Get.lazyPut(() => ApiClient(Dio(), Get.find()));
  }
}
