import 'package:get/get.dart';

class SwitchController extends GetxController {
  var isSwitched = false.obs;
  var isSwitched2 = false.obs;


  void toggleSwitch(bool value) {
    isSwitched.value = value;

  }
  void toggleSwitch2(bool value2) {
    isSwitched2.value = value2;

  }
}
