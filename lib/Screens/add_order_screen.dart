
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Backend/Orders/add_order.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants/colors.dart';
import '../Constants/constants.dart';
import '../Constants/gaps.dart';
import '../Controller/ServicesController/services_controller.dart';
import '../Locale_Memory/save_user_info_locally.dart';
import '../Widgets/loading.dart';
import '../Widgets/reusable_btn.dart';
import '../Widgets/reusable_footer.dart';
import '../Widgets/reusable_snak_bar.dart';
import '../Widgets/reusable_text_field.dart';



class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController budgetController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  ServicesController servicesController = Get.find();
  final scrollBarController = ScrollController();
  String id='';
  getUserId()async{
    id= await getIdFromPref();
  }
  @override
  void initState() {
    getUserId();
    servicesController.getServicesFromBack();
    noteController.text='';
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
            floatingActionButton: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              child: FloatingActionButton(
                onPressed: () async {
                  Uri url = Uri(scheme: "tel", path: phoneNumber);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {

                  }
                },
                shape: const CircleBorder(),
                backgroundColor: kBasicColor,
                child: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
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
                  ),
                  Container(
                    width: deviceWidth,
                    height: deviceHeight,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/dr.photo.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: deviceHeight * 0.45,
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.9),
                          width: deviceHeight * 0.8,
                          height: deviceHeight * 0.2,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                kFirstPhrase,
                                textAlign: TextAlign.center,
                                style:
                                TextStyle(color: kBasicColor, fontSize: 18),
                              ),
                              Text(
                                kSecondPhrase,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                        ReusableButton(
                            btnText: 'اتصلي بنا',
                            onTapFunction: () async {
                              Uri url = Uri(scheme: "tel", path: phoneNumber);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {

                              }
                            },
                            width: 150,
                            height: deviceHeight * 0.07)
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        const Text(
                          kThirdPhrase,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kBasicColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        gapH6,
                        const Text(
                          kForthPhrase,
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              wordSpacing: 2,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.1,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 25),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: kBorderColor, width: 2)),
                          child: Form(
                            key: _formKey,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                // ReusableTextField(
                                //     onChangedFunc: (val) {},
                                //     validationFunc: (val) {
                                //       _formKey.currentState!.validate(); //todo
                                //       if (val.isEmpty) {
                                //         return 'هذا الحقل مطلوب .';
                                //       }
                                //       return null;
                                //     },
                                //     hint: '',
                                //     textEditingController: nameController,
                                //     text: 'الاسم الكامل *'),
                                // gapH20,
                                // ReusableTextField(
                                //     onChangedFunc: (val) {},
                                //     validationFunc: (val) {
                                //       if (val.isEmpty) {
                                //         return 'هذا الحقل مطلوب .';
                                //       }
                                //       return null;
                                //     },
                                //     hint: '',
                                //     textEditingController: phoneController,
                                //     text: 'رقم الموبايل *'),
                                // gapH20,
                                // ReusableDropDownMenu(
                                //   list: cities,
                                //   text: 'الدولة: *',
                                //   onSelected: (val) {
                                //     setState(() {
                                //       selectedCity = val;
                                //     });
                                //   },
                                //   hint: 'الرجاء اختيار الدولة',
                                //   validationFunc: (String? val) {
                                //     //todo
                                //     // if(val!.isEmpty){
                                //     //   return 'الرجاء اختيار الدولة';
                                //     // }
                                //     // return null;
                                //   },
                                // ),
                                // gapH20,
                                // ReusableTextField(
                                //     onChangedFunc: (val) {},
                                //     validationFunc: (val) {},
                                //     hint: '',
                                //     textEditingController: emailController,
                                //     text: 'البريد الإلكتروني'),
                                // gapH20,
                                const Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'اختاري الخدمات التجميلية التي ترغبين بها!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                Scrollbar(
                                 thumbVisibility: true,
                                  controller: scrollBarController,
                                  child: SizedBox(
                                    height: 500,//cont.servicesList.length *(deviceHeight * 0.14),
                                    child: ListView.builder(
                                      controller: scrollBarController,
                                      itemCount: cont.servicesList.length,
                                      itemBuilder: (context, index) =>
                                          ReusableServiceCard(
                                            index: index,
                                            onChangedFunc: (value) {
                                              cont.setCheckService(value, index);
                                            },
                                          ),
                                    ),
                                  ),
                                ),
                                gapH20,
                                ReusableInputNumberField(
                                    onChangedFunc: (val) {},
                                    validationFunc: (val) {
                                      if (val.isEmpty) {
                                        return 'هذا الحقل مطلوب .';
                                      }
                                      return null;
                                    },
                                    text:
                                    'ماهي ميزانيتك لتصميم الباقة؟ (بالدرهم الإماراتي) *',
                                    controller: budgetController),
                                gapH20,
                                ReusableTextField(
                                    onChangedFunc: (val) {},
                                    validationFunc: (val) {},
                                    hint: '',
                                    maxLines: 6,
                                    textEditingController: noteController,
                                    text:
                                    'هل هناك أي ملاحظة تودين مشاركتها معنا؟'),
                                gapH20,
                                ReusableButton(
                                    btnText: 'صمم باقتي التجميلية',
                                    onTapFunction: () async{
                                      cont.convertListToString();
                                      if(cont.selectedServicesString==''){
                                        CommonWidgets.snackBar(
                                            'error', 'عليك اختيار الخدمات التجميلية التي ترغبين بها');
                                      }else if(_formKey.currentState!.validate()){
                                        LoadingDialogHelper.showLoadingDialog();
                                        var res=await addOrder(
                                            balance: budgetController.text,
                                            note: noteController.text ,
                                            userId: id,
                                            services: cont.selectedServicesString);
                                        LoadingDialogHelper.hideLoading();
                                        if (res['status'] == '1') {
                                          CommonWidgets.snackBar(
                                              'success', res['message']);
                                        } else {
                                          CommonWidgets.snackBar(
                                              'error', res['data']);
                                        }
                                      }
                                    },
                                    width: deviceWidth,
                                    height: deviceHeight * 0.06)
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: deviceHeight*0.1,),
                  Container(
                    color: Colors.black,
                    width: deviceWidth,
                    height: deviceHeight*0.25,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          k6Phrase,
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          height: deviceHeight*0.1,
                          width: 100,
                          child: const Divider(color: kBasicColor,),
                        ),
                        ReusableButton(
                            btnText: 'زيارة الموقع',
                            isWhiteBg: true,
                            onTapFunction: () async {
                              final Uri url = Uri.parse(websiteUrl);
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            },
                            width: 200,
                            height: deviceHeight*0.06)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight*0.1,),
                  const ReusableFooter()
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


class ReusableSocialMediaCircle extends StatefulWidget {
  const ReusableSocialMediaCircle({super.key, required this.info});
  final Map info;
  @override
  State<ReusableSocialMediaCircle> createState() => _ReusableSocialMediaCircleState();
}

class _ReusableSocialMediaCircleState extends State<ReusableSocialMediaCircle> {
  bool isLongPressed=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: CircleAvatar(
        radius:isLongPressed?11: 15,
        backgroundColor: kBasicColor,
        child: InkWell(
          onTap: () async {
            final Uri url = Uri.parse(widget.info["link"]);
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },
          onLongPress: (){
            // setState(() {
            //   isLongPressed=true;
            // });
          },
          child: Padding(
            padding:   EdgeInsets.all(isLongPressed?5:8), // Border radius
            child: ClipOval(child:  Image.asset(
              widget.info["image"],
              fit: BoxFit.contain,
            ),),
          ),
        ),
      ),
    );
  }
}
