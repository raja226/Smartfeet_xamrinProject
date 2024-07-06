import 'package:get/get.dart';

class BottomBarController extends GetxController {
  RxInt pageIndex = 2.obs;
  void changePageIndex(int _index) {
    pageIndex.value = _index;
  }
}
