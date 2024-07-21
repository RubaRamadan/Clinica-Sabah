
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Backend/Orders/add_order.dart';
import 'package:untitled1/Screens/Authentication/login_screen.dart';
import 'package:untitled1/Screens/add_order_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants/colors.dart';
import '../Constants/const_lists.dart';
import '../Constants/constants.dart';
import '../Constants/gaps.dart';
import '../Controller/ServicesController/services_controller.dart';
import '../Locale_Memory/save_user_info_locally.dart';
import '../Widgets/loading.dart';
import '../Widgets/reusable_btn.dart';
import '../Widgets/reusable_footer.dart';
import '../Widgets/reusable_snak_bar.dart';
import '../Widgets/reusable_text_field.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String id='',name='';
  getUserId()async{
    id= await getIdFromPref();
    name=await getNameFromPref();
  }
@override
  void initState() {
  getUserId();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width ;
    final deviceHeight = MediaQuery.of(context).size.height ;
    return GetBuilder<ServicesController>(builder: (cont) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: kBgColor,
            // floatingActionButton: Padding(
            //   padding:
            //   const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            //   child: FloatingActionButton(
            //     onPressed: () async {
            //       Uri url = Uri(scheme: "tel", path: phoneNumber);
            //       if (await canLaunchUrl(url)) {
            //         await launchUrl(url);
            //       } else {
            //
            //       }
            //     },
            //     shape: const CircleBorder(),
            //     backgroundColor: kBasicColor,
            //     child: const Icon(
            //       Icons.phone,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  gapH10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          height:deviceHeight * 0.1,
                          width:deviceWidth * 0.2,
                          fit: BoxFit.contain,
                        ),
                        InkWell(
                          onTap: () async {
                            await saveUserInfoLocally('', '', '', '', '', '');
                            Get.offAll(()=>const LoginScreen());
                          },
                          child: const Text('logout',style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),),
                        )
                      ],
                    ),
                  ),
                 SizedBox(
                   height:  deviceHeight * 0.05,
                   child: Center(
                     child: Text(
                       'أهلا بك $name',
                       style: const TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
                     ),
                   ),
                 ),
                 const Divider(
                   endIndent: 50,
                   indent: 50,
                   color: kBasicColor,
                 ),
                 Container(
                      padding:const EdgeInsets.symmetric(horizontal: 15),
                    height: deviceHeight * 0.61,
                    child: GridView.count(
                      crossAxisCount: 2,
                        children: List.generate(options.length, (index) {
                          return ReusableOptionCard(info: options[index],);
                        }

                    )
                  ),),
                  const Divider(
                    endIndent: 50,
                    indent: 50,
                    color: kBasicColor,
                  ),
                  gapH16,
                  const ReusableFooter(),
                ],
              ),
            )),
      );
    });
  }
}

class ReusableServiceCard extends StatefulWidget {
  const ReusableServiceCard(
      {super.key, required this.index, required this.onChangedFunc});
  final int index;
  final Function onChangedFunc;
  @override
  State<ReusableServiceCard> createState() => _ReusableServiceCardState();
}

class _ReusableServiceCardState extends State<ReusableServiceCard> {
  ServicesController servicesController = Get.find();
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width ;
    final deviceHeight = MediaQuery.of(context).size.height ;
    return GetBuilder<ServicesController>(builder: (cont) {
      return SizedBox(
        // padding: const EdgeInsets.symmetric(vertical: 10),
        height: deviceHeight * 0.14,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: cont.servicesListCheckBoxesValues[widget.index]
                          ? kBasicColor
                          : Colors.black54,
                      width: 2)),
              child: Container(
                  width:deviceWidth * 0.23,
                  height:deviceHeight * 0.11,
                  decoration: BoxDecoration(
                    border: Border.all(color: kBasicColor),
                    image:   DecorationImage(
                      image: NetworkImage(cont.servicesList[widget.index]['image'],),
                      fit: BoxFit.contain,
                    ),
                  )),
            ),
            Checkbox(
              // checkColor: kBasicColor,
              // activeColor: Colors.white,
              // fillColor: MaterialStateProperty.resolveWith(getColor),
              value: cont.servicesListCheckBoxesValues[widget.index],
              onChanged: (bool? value) {
                widget.onChangedFunc(value!);
                cont.setCheckService(value, widget.index);
                if(value){
                cont.addServiceIdToSelectedServices('${cont.servicesList[widget.index]['id']}');
                }else{
                  cont.removeServiceIdFromSelectedServices('${cont.servicesList[widget.index]['id']}');
                }
              },
            ),
            SizedBox(
              width:deviceWidth * 0.4,
              child: Text(cont.servicesList[widget.index]['name'],
                  style: const TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        ),
      );
    });
  }
}

class ReusableOptionCard extends StatelessWidget {
  const ReusableOptionCard({super.key, required this.info});
final Map info;
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width ;
    final deviceHeight = MediaQuery.of(context).size.height ;
    return InkWell(
      onTap: (){
        Get.to(()=> info['screen']);
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: deviceHeight*0.19,
              width: deviceWidth*0.4,
              color: kBasicColor,
              child:  Image.asset('${info['image']}'),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: kBasicColor)
            ),
            // height: deviceHeight*0.16,
            width: deviceWidth*0.4,
            child: Text(
              info['name'],
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

