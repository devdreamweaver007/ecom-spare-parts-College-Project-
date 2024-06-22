import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spareproject/Features/Address/model/address_response_model.dart';

class AddressRepository {


  Future <AddressResponseModel?> getAddress() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userid = prefs.getInt('userId');
var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/address/$userid/',
  options: Options(
    method: 'GET',
  ),
);

if (response.statusCode == 200) {
  return AddressResponseModel.fromJson(response.data);
}
else {
  print(response.statusMessage);
}
    }catch(e){
      print(e);
    }
  }
}