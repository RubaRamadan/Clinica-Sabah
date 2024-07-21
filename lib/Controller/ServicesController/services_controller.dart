import 'package:get/get.dart';

import '../../Backend/Services/get_services.dart';

class ServicesController extends GetxController {
  List servicesList = [
    // {'name': 'جراحة تجميلية', 'check': false},
    // {'name': 'فيلر ', 'check': false}
  ];
  List selectedServicesIds = [];
  bool isServicesFetched = false;
  String selectedServicesString='';
List<bool> servicesListCheckBoxesValues=[];
  getServicesFromBack() async {
    print('start');
    servicesList = [];
    isServicesFetched = false;
    selectedServicesString='';
    servicesListCheckBoxesValues=[];
    var p = await getServices();
    print('get $p');
    if (p['status']=='1') {
      servicesList=p['data'];
      for(int i=0;i<servicesList.length;i++){
        servicesListCheckBoxesValues.add(false);
      }
      servicesList = servicesList.reversed.toList();
      isServicesFetched = true;
      update();
    }
  }

  setCheckService(bool val, int index) {
    servicesListCheckBoxesValues[index] = val;
    update();
  }
  // addServiceIdToSelectedServicesString(String id){
  //   selectedServicesString=selectedServicesString+id;
  //   update();
  // }
  addServiceIdToSelectedServices(String id){
    selectedServicesIds.add(id);
    update();
  }
  removeServiceIdFromSelectedServices(String id){
    selectedServicesIds.remove(id);
    update();
  }
  convertListToString(){
    selectedServicesString=selectedServicesIds.join(',');
    update();
  }

}
