import 'package:flutter/material.dart';

class ReusableAppBar extends StatelessWidget {
  const ReusableAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width ;
    final deviceHeight = MediaQuery.of(context).size.height ;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height:deviceHeight * 0.1,
            width:deviceWidth * 0.2,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
