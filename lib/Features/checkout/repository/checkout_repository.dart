import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spareproject/Features/checkout/model/checkout_response_model.dart';
import 'package:spareproject/Features/checkout/model/my_order_response_model.dart';

class CheckoutRepository{

  Future <CheckoutResponseModel?>checkout() async {
    EasyLoading.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('userId');
    try{
var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/checkout/$id/',
  options: Options(
    method: 'POST',
  ),
);

if (response.statusCode == 200) {
  EasyLoading.dismiss();
  return CheckoutResponseModel.fromJson(response.data);
}
else {
  EasyLoading.dismiss();
  print(response.statusMessage);
}
    }catch(e){
      print(e);
    }
  }

  Future <MyOrderResponseModel?>myorders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int?id = prefs.getInt('userId');
    try{
var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/my-orders/$id/',
  options: Options(
    method: 'GET',
  ),
);

if (response.statusCode == 200) {
  return MyOrderResponseModel.fromJson(response.data);
}
else {
  print(response.statusMessage);
}
    }catch(e){
      throw(e);}
  }
}