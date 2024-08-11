import 'package:get/get.dart';

import '../Screens/add_order_screen.dart';
import '../Screens/responses.dart';

List<String> cities = [
  'UAE'.tr,
  'saudi_arabia'.tr,
  'oman'.tr,
  'kuwait'.tr,
  'qatar'.tr,
  'other'.tr
];


List<String> phoneSuffixes=['971','966','968','965','974'];


List options=[
  {
    'name':'design_your_cosmetic_package'.tr,
    'image':'assets/images/woman2.png',
    'page':'/AddOrderScreen'
  },
  {
    'name':'responses'.tr,
    'image':'assets/images/responses2.png',
    'page':'/Responses'
  }
];

List screensList=[
 const AddOrderScreen(),
 const Responses()
];