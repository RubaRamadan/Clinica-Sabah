import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Screens/Authentication/register_screen.dart';
import 'package:untitled1/Screens/Authentication/verification_screen.dart';
import 'package:untitled1/Screens/home_screen.dart';

import '../../Backend/Auth/login.dart';
import '../../Constants/colors.dart';
import '../../Constants/const_lists.dart';
import '../../Constants/gaps.dart';
import '../../Widgets/loading.dart';
import '../../Widgets/reusable_btn.dart';
import '../../Widgets/reusable_snak_bar.dart';
import '../../Widgets/reusable_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneSuffixController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
// //todo cities as language
//   List<String> cities = [
//     'الإمارات العربية المتحدة',
//     'المملكة العربية السعودية',
//     'سلطنة عمان',
//     'الكويت',
//     'قطر',
//     'غير ذلك',
//   ];
  String selectedCity = '';
  @override
  void initState() {
    phoneSuffixController.text=phoneSuffixes[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text(
                  'login'.tr,
                  style: const TextStyle(
                      color: kBasicColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: deviceHeight * 0.1,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 50),
                  decoration: BoxDecoration(
                      border: Border.all(color: kBorderColor, width: 2)),
                  child: Form(
                    key: _formKey,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        ReusablePhoneTextField(
                            onChangedFunc: (val) {},
                            validationFunc: (String val) {
                              if (val.isEmpty) {
                                return 'required_field'.tr;
                              }else if (val.length!=9) {
                                return 'long_is_9'.tr;
                              }
                              return null;
                            },
                            hint: '',
                            textEditingController: phoneController,
                            suffixController: phoneSuffixController,
                            text: '${'phone_number'.tr} *'),
                        gapH32,
                        ReusableTextField(
                            onChangedFunc: (val) {},
                            validationFunc: (val) {
                              if (val.isEmpty) {
                                return 'required_field'.tr;
                              }
                              return null;
                            },
                            hint: '',
                            textEditingController: passwordController,
                            text: '${'password'.tr} *'),
                        gapH48,
                        ReusableButton(
                            btnText: 'login'.tr,
                            onTapFunction: () async {
                              if (_formKey.currentState!.validate()) {
                                LoadingDialogHelper.showLoadingDialog();
                                var res = await login(
                                  password: passwordController.text,
                                  phone: '${phoneSuffixController.text}${phoneController.text}',
                                );
                                LoadingDialogHelper.hideLoading();
                                if (res['status'] == '1') {
                                  Get.to(() => const HomeScreen());
                                }else if (res['status'] == '0') {
                                  Get.to(() => const VerificationScreen());
                                } else {
                                  CommonWidgets.snackBar(
                                      'error'.tr, res['data']);
                                }
                              }
                            },
                            width: deviceWidth,
                            height: deviceHeight * 0.06),
                        gapH16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text(
                              'do_not_have_an_account'.tr,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            ),
                            ReUsableTextButton(
                              text: 'create_account_now'.tr,
                              onPress: () {
                                //Navigator.pushNamed(context, '/signup');
                                // Get.to(const RegisterScreen());
                                Get.to(() => const RegisterScreen());
                              },
                              isGrey: false,
                              isUnderLined: false,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
