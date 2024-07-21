import '../Screens/add_order_screen.dart';
import '../Screens/responses.dart';

List<String> cities = [
  'الإمارات العربية المتحدة',
  'المملكة العربية السعودية',
  'سلطنة عمان',
  'الكويت',
  'قطر',
  'غير ذلك',
];


List<String> phoneSuffixes=['971','966','968','965','974'];


List options=[
  {
    'name':'صمم باقتك التجميلية',
    'image':'assets/images/woman2.png',
    'page':const AddOrderScreen()
  },
  {
    'name':'الردود',
    'image':'assets/images/responses2.png',
    'page':const Responses()
  }
];