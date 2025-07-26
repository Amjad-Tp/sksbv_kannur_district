import 'package:get/get.dart';

class TextFieldController extends GetxController {
  var obscureText = true.obs;

  void toggleVisibility() {
    obscureText.value = !obscureText.value;
  }
}
