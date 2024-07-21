
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Constants/colors.dart';
import 'Controller/ResponsesController/responses_controller.dart';
import 'Controller/ServicesController/services_controller.dart';
import 'Screens/splash_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ServicesController servicesController=Get.put(ServicesController());
    ResponsesController responsesController=Get.put(ResponsesController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSSH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kBasicColor),
        fontFamily: 'Cairo',
        useMaterial3: true,
      ),
      home:const SplashScreen(),
    );
  }
}


