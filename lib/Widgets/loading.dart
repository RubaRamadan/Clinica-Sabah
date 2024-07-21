import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget loading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

class LoadingDialogHelper{

static void showLoadingDialog(){
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox
        (
          height: 50,width: 50,
          child: Center(child: CircularProgressIndicator())),
    )
  );
}

static void hideLoading(){
  if(Get.isDialogOpen ?? false){
    Get.back();
  }
}
}