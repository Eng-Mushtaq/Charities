import 'package:charities/controller/SignUpController.dart';
import 'package:get/get.dart';

import '../controller/buttomBarController.dart';
import '../controller/dataController.dart';
import '../controller/loginController.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SignUpController());
    Get.put(BottomBarController());
    Get.put(DataController());
  }
}
