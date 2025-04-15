import 'package:get/get.dart';

class HomeScreenController extends GetxController{

  var selectedScreenIndex = 0.obs;
  updateSelectedIndex(index) => selectedScreenIndex.value = index;

}