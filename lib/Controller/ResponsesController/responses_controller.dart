import 'package:get/get.dart';

import '../../Backend/Orders/get_responses.dart';


class ResponsesController extends GetxController {
  List responsesList = [];
  // List selectedServicesIds = [];
  bool isServicesFetched = false;
  // String selectedServicesString='';
// List<bool> servicesListCheckBoxesValues=[];
  getResponsesFromBack() async {
    print('start');
    responsesList = [];
    isServicesFetched = false;
    // selectedServicesString='';
    // servicesListCheckBoxesValues=[];
    var p = await getResponses();
    print('get $p');
    if (p['status']=='1') {
      responsesList=p['data'];
      // for(int i=0;i<responsesList.length;i++){
      //   servicesListCheckBoxesValues.add(false);
      // }
      responsesList = responsesList.reversed.toList();
      isServicesFetched = true;
      update();
    }
  }

  // setCheckService(bool val, int index) {
  //   servicesListCheckBoxesValues[index] = val;
  //   update();
  // }
  // // addServiceIdToSelectedServicesString(String id){
  // //   selectedServicesString=selectedServicesString+id;
  // //   update();
  // // }
  // addServiceIdToSelectedServices(String id){
  //   selectedServicesIds.add(id);
  //   update();
  // }
  // removeServiceIdFromSelectedServices(String id){
  //   selectedServicesIds.remove(id);
  //   update();
  // }
  // convertListToString(){
  //   selectedServicesString=selectedServicesIds.join(',');
  //   update();
  // }

}
