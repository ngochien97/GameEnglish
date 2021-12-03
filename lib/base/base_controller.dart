import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class BaseController<T> extends GetxController {
  final _loadingStatus = BehaviorSubject<bool>.seeded(false);
  final T? arguments = Get.arguments == null ? null : Get.arguments as T;

  Stream<bool> get loadingStatus => _loadingStatus.stream;

  @override
  void onInit() {
    super.onInit();
  }

  setLoading(bool value) {
    _loadingStatus.add(value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _loadingStatus.close();
    super.onClose();
  }
}
