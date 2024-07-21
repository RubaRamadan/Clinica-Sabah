import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controller/ResponsesController/responses_controller.dart';
import 'package:untitled1/Widgets/reusable_app_bar.dart';

import '../Constants/gaps.dart';
import '../Widgets/loading.dart';

class Responses extends StatefulWidget {
  const Responses({super.key});

  @override
  State<Responses> createState() => _ResponsesState();
}

class _ResponsesState extends State<Responses> {
  final scrollBarController = ScrollController();
  ResponsesController responsesController = Get.find();
  @override
  void initState() {
    responsesController.getResponsesFromBack();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<ResponsesController>(builder: (cont) {
        return Column(
          children: [
            const ReusableAppBar(),
             cont.isDataFetched
            ?SizedBox(
               height: deviceHeight * 0.8,
            child: cont.responsesList.isNotEmpty? Scrollbar(
                thumbVisibility: true,
                controller: scrollBarController,
                child: SizedBox(
                  height: deviceHeight * 0.8,
                  child: ListView.builder(
                    controller: scrollBarController,
                    itemCount: cont.responsesList.length,
                    itemBuilder: (context, index) => ReusableResponseCard(
                      index: index,
                    ),
                  ),
                ),
              ):const Center(child: Text('لا يوجد ردود حتى الآن',style: TextStyle(fontSize:20,color: Colors.grey,fontWeight: FontWeight.bold ),)),
            ):loading()
          ],
        );
      }),
    );
  }
}

class ReusableResponseCard extends StatelessWidget {
  const ReusableResponseCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    ResponsesController responsesController = Get.find();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45,),
      ),
      child: Column(
        children: [
          Text('${responsesController.responsesList[index]['date']}  ${responsesController.responsesList[index]['time']}'),
          gapH10,
          SizedBox(
              child: Text('${responsesController.responsesList[index]['reply']??'لا يوجد رد حتى الآن'}')
          ),
        ],
      ),
    );
  }
}
