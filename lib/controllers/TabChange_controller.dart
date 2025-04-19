import 'package:get/get.dart';

class TabChangeController extends GetxController{

  var selectedTabIndex = 0.obs;

  void updateTabIndex(index) {
    selectedTabIndex.value = index;
    print("Updated tab index to: $index");
  }
}