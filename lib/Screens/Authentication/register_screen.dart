import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Backend/Auth/register.dart';
import 'package:untitled1/Screens/Authentication/login_screen.dart';
import 'package:untitled1/Screens/Authentication/verification_screen.dart';
import '../../Constants/colors.dart';
import '../../Constants/const_lists.dart';
import '../../Constants/gaps.dart';
import '../../Widgets/loading.dart';
import '../../Widgets/reusable_btn.dart';
import '../../Widgets/reusable_drop_down_menu.dart';
import '../../Widgets/reusable_snak_bar.dart';
import '../../Widgets/reusable_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneSuffixController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


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
                  'create_new_account'.tr,
                  style:const TextStyle(
                      color: kBasicColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 40),
                  decoration: BoxDecoration(
                      border: Border.all(color: kBorderColor, width: 2)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ReusableTextField(
                            onChangedFunc: (val) {},
                            validationFunc: (val) {
                              if (val.isEmpty) {
                                return 'required_field'.tr;
                              }
                              return null;
                            },
                            hint: '',
                            textEditingController: nameController,
                            text: '${'full_name'.tr} *'),
                        gapH28,
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
                        gapH28,
                        ReusableDropDownMenu(
                          list: cities,
                          text: '${'country'.tr}: *',
                          onSelected: (val) {
                            setState(() {
                              selectedCity = val;
                            });
                          },
                          hint: 'please_choose_country'.tr,
                          validationFunc: (String val) {
                            //todo
                            // if(val.isEmpty){
                            //   return 'الرجاء اختيار الدولة';
                            // }
                            // return null;
                          },
                        ),
                        gapH28,
                        ReusableTextField(
                            onChangedFunc: (val) {},
                            validationFunc: (val) {},
                            hint: '',
                            textEditingController: emailController,
                            text: 'email'.tr),
                        gapH28,
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
                            text: 'password'.tr),
                        gapH40,
                        ReusableButton(
                            btnText: 'create_account'.tr,
                            onTapFunction: () async {
                              if (_formKey.currentState!.validate()) {
                                LoadingDialogHelper.showLoadingDialog();
                                var res = await register(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: '${phoneSuffixController.text}${phoneController.text}',
                                    country: selectedCity);
                                LoadingDialogHelper.hideLoading();
                                if (res['status'] == '1') {
                                  Get.to(() => const VerificationScreen());
                                } else {
                                  CommonWidgets.snackBar(
                                      'error'.tr, '${res['data']}');
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
                              'have_an_account'.tr,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            ),
                            ReUsableTextButton(
                              text: 'log_in_now'.tr,
                              onPress: () {
                                //Navigator.pushNamed(context, '/signup');
                                // Get.to(const RegisterScreen());
                                Get.offAll(() => const LoginScreen());
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
