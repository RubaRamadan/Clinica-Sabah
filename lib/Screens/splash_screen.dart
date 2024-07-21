import 'package:flutter/material.dart';
import 'package:untitled1/Constants/colors.dart';
import 'package:untitled1/Screens/Authentication/register_screen.dart';
import 'package:untitled1/Screens/home_screen.dart';

import '../Locale_Memory/save_user_info_locally.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate=false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBgColor,
        child:   Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                bottom:animate? 300 :-170,
                child: const Logo())
          ],
        ),
      ),
    );
  }

  Future startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {animate=true;});
    String id= await getIdFromPref();
    await Future.delayed(const Duration(milliseconds: 1000));
    if(id.isEmpty) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
          (Route<dynamic> route) => false);
    }else{
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false);
    }

  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
              height: 230,
              width: 230,
              child: Image.asset('assets/images/logo.png')),
        ],
      ),
    );
  }
}




