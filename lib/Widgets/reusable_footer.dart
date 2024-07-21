
import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import '../Constants/gaps.dart';
import '../Screens/add_order_screen.dart';

class ReusableFooter extends StatelessWidget {
  const ReusableFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width ;
    final deviceHeight = MediaQuery.of(context).size.height ;
    return Column(
      children: [
        SizedBox(
            // padding:const EdgeInsets.symmetric(horizontal: 15),
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: socialMedia.length,
              itemBuilder: (context, index) => ReusableSocialMediaCircle(
                  info:socialMedia[index]
              ),

            )
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: SizedBox(
                    width:deviceWidth * 0.6,
                    child: const Text('.MOH Approval Number ER87549,All rights reserved',//© 2024
                      textAlign: TextAlign.center,
                      style:   TextStyle(color: Colors.black, fontSize: 9),

                    ),
                  ),
                ),
                // gapH10,
                // Center(
                //   child: SizedBox(
                //     width:deviceWidth * 0.5,
                //     child: const Text('All rights reserved',//© 2024
                //       textAlign: TextAlign.center,
                //       style:   TextStyle(color: Colors.black, fontSize: 12),
                //
                //     ),
                //   ),
                // ),
                gapH10,
                Center(
                  child: SizedBox(
                    width:deviceWidth * 0.5,
                    child: const Text('Clinica Sabah Specialty Hospital',
                      textAlign: TextAlign.center,
                      style:   TextStyle(color: Colors.black, fontSize: 12),

                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(
                "assets/images/logo.png",
                height: deviceHeight * 0.12,
                width: deviceWidth * 0.3,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
