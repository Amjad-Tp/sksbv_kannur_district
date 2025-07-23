import 'package:get/get.dart';

class RegisterController extends GetxController {
  var selectedZone = ''.obs;
  var selectedPosition = ''.obs;

  void selectMeghala(String zone) {
    selectedZone.value = zone;
  }

  void selectPosition(String position) {
    selectedPosition.value = position;
  }
}
