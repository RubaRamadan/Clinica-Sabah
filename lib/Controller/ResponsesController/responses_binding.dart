
import 'package:get/get.dart';

import 'responses_controller.dart';


class ServicesBinding implements Bindings {
  @override
  void dependencies() {
   Get.put(ResponsesController());
  }
}