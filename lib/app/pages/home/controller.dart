import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin {
  RxInt point = 3000.obs;
  RxInt tree = 8.obs;
  RxInt count = 6.obs;

  void addCount() {
    point.value += 500;
    tree += 1;
    count += 1;
  }
}
