import 'package:get/get.dart';
import '../../Locale_Memory/save_user_info_locally.dart';

class RegisterController extends GetxController {
  bool isRegistered = false;
  setIsRegisteredValue(bool newVal) {
    isRegistered = newVal;
    update();
  }





  var id='';
  getInfoFromPref() async{
    id=await getIdFromPref();
    if(id!=''){setIsRegisteredValue(true);}
  }

  String fullName = '';
  String city = '';
  String email = '';
  String password = '';
  String phone = '';





  setFullNameValue(String newVal) {
    fullName = newVal;
    update();
  }

  setEmailValue(String newVal) {
    email = newVal;
    update();
  }

  setPasswordValue(String newVal) {
    password = newVal;
    update();
  }

  setPhoneValue(String newVal) {
    phone = newVal;
    update();
  }








  // int selectedCityId = 0;
  // bool isCitiesFetched = false;
  // List citiesList = [];
  // List<String> citiesNamesList = ['اختر'];
  // List<int> citiesIdsList = [0];

  // getCitiesFromBackend() async {
  //   citiesIdsList= [0];
  //   citiesNamesList = ['اختر'];
  //   isCitiesFetched=false;
  //   var p = await getGovernorates();
  //   for (var element in p) {
  //     citiesNamesList.add(element['name']);
  //     citiesIdsList.add(element['id']);
  //   }
  //   cityDropdownValue = citiesNamesList[0];
  //   setIsCitiesFetched(true);
  // }

  //
  // setCitiesNamesList(List<String> newList) {
  //   citiesNamesList = newList;
  //   update();
  // }
  //
  // setCitiesIdsList(List<int> newList) {
  //   citiesIdsList = newList;
  //   update();
  // }
  //
  // setSelectedCityId(newSelectedSailPointId) {
  //   selectedCityId = newSelectedSailPointId;
  //   update();
  // }
  //
  //
  // setIsCitiesFetched(bool newValue) {
  //   isCitiesFetched = newValue;
  //   update();
  // }
}
