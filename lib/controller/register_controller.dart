import 'package:get/get.dart';

class RegisterController extends GetxController {
  var selectedPosition = ''.obs;

  void selectPosition(String position) {
    selectedPosition.value = position;
  }
}
