import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/Backend/Auth/update_user.dart';
import 'package:untitled1/Constants/gaps.dart';
import 'package:untitled1/Locale_Memory/save_user_info_locally.dart';
import 'package:untitled1/Screens/home_screen.dart';
import 'package:untitled1/Widgets/reusable_text_field.dart';

import '../../Constants/colors.dart';
import '../../Widgets/loading.dart';
import '../../Widgets/reusable_btn.dart';
import '../../Widgets/reusable_snak_bar.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber="";
  String code="";
  String id="";
  TextEditingController code1Controller=TextEditingController();
  TextEditingController code2Controller=TextEditingController();
  TextEditingController code3Controller=TextEditingController();
  TextEditingController code4Controller=TextEditingController();
  getInfoFromLocalMemory()async{
      phoneNumber=  await getPhoneFromPref();
      code= await getCodeFromPref();
      id= await getIdFromPref();
  }
  @override
  void initState() {
    getInfoFromLocalMemory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 25, vertical: 50),
          child: Column(
            children: [
              const Text('Verification',
                style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),),
              gapH32,
              const Text('Enter the code sent to your number',
                style: TextStyle(color: Colors.black, fontSize: 16),),
              gapH32,
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text( phoneNumber,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              gapH32,
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReusableVerificationTextField(
                        onChangedFunc: (String value){
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        hint: '-',
                        textEditingController: code1Controller,
                      validationFunc: (String? value){
                          if(value!.isEmpty){
                            return 'required';
                          }return null;
                      },
                        ),
                    ReusableVerificationTextField(
                        onChangedFunc: (String value){
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        hint: '-',
                        textEditingController: code2Controller,
                      validationFunc: (String? value){
                        if(value!.isEmpty){
                          return 'required';
                        }return null;
                      },
                        ),
                    ReusableVerificationTextField(
                        onChangedFunc: (String value){
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        hint: '-',
                        textEditingController: code3Controller,
                      validationFunc: (String? value){
                        if(value!.isEmpty){
                          return 'required';
                        }return null;
                      },
                        ),
                    ReusableVerificationTextField(
                        onChangedFunc: (String value) async {
                          if (code1Controller.text.isNotEmpty&&code2Controller.text.isNotEmpty&&code3Controller.text.isNotEmpty&&code4Controller.text.isNotEmpty) {
                            LoadingDialogHelper.showLoadingDialog();
                          String enteredCode='${code1Controller.text}${code2Controller.text}${code3Controller.text}${code4Controller.text}';
                          if(code==enteredCode){
                              var res = await updateUser(id: id, status: '1');
                              LoadingDialogHelper.hideLoading();
                              if (res['status'] == '1') {
                                Get.to(() => const HomeScreen());
                              } else {
                                CommonWidgets.snackBar(
                                    'error', res['message']);
                              }
                            }else{
                            LoadingDialogHelper.hideLoading();
                            CommonWidgets.snackBar(
                                'error', 'This code is not correct');
                          }
                        }
                      },
                        hint: '-',
                        textEditingController: code4Controller,
                      validationFunc: (String? value){
                        if(value!.isEmpty){
                          return 'required';
                        }return null;
                      },
                        ),
                  ],
                ),
              ),
              gapH48,
              ReusableButton(
                  btnText: 'تحقق',
                  onTapFunction: () async {
                    if (_formKey.currentState!.validate()) {
                      LoadingDialogHelper.showLoadingDialog();
                      String enteredCode='${code1Controller.text}${code2Controller.text}${code3Controller.text}${code4Controller.text}';
                      if(code==enteredCode){
                        var res = await updateUser(id: id, status: '1');
                        LoadingDialogHelper.hideLoading();
                        if (res['status'] == '1') {
                          Get.to(() => const HomeScreen());
                        } else {
                          CommonWidgets.snackBar(
                              'error', res['message']);
                        }
                      }else{
                        LoadingDialogHelper.hideLoading();
                        CommonWidgets.snackBar(
                            'error', 'This code is not correct');
                      }
                    }
                  },
                  width: deviceWidth,
                  height: deviceHeight * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
