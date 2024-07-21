import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controller/ResponsesController/responses_controller.dart';
import 'package:untitled1/Widgets/reusable_app_bar.dart';

class Responses extends StatefulWidget {
  const Responses({super.key});

  @override
  State<Responses> createState() => _ResponsesState();
}

class _ResponsesState extends State<Responses> {
  final scrollBarController = ScrollController();
  ResponsesController responsesController = Get.find();
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<ResponsesController>(builder: (cont) {
        return Column(
          children: [
            const ReusableAppBar(),
            Scrollbar(
              thumbVisibility: true,
              controller: scrollBarController,
              child: SizedBox(
                height: deviceHeight * 0.8,
                child: ListView.builder(
                  controller: scrollBarController,
                  itemCount: cont.responsesList.length,
                  itemBuilder: (context, index) => ReusableServiceCard(
                    index: index,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ReusableServiceCard extends StatelessWidget {
  const ReusableServiceCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    ResponsesController responsesController = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        children: [
          Text('${responsesController.responsesList[index]['date']}  ${responsesController.responsesList[index]['time']}'),
          SizedBox(

              child: Text('${responsesController.responsesList[index]['reply']}')
          ),
        ],
      ),
    );
  }
}
