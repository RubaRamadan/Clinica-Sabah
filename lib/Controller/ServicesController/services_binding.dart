
import 'package:get/get.dart';

import 'services_controller.dart';


class ServicesBinding implements Bindings {
  @override
  void dependencies() {
   Get.put(ServicesController());
  }
}