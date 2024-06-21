import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spareproject/Features/Cart/Model/add_to_cart_response_model.dart';
import 'package:spareproject/Features/Cart/Model/update_cart_model.dart';
import 'package:spareproject/Features/Cart/Model/view_cart_response_model.dart';

class CartRepository{

  Future <AddToCartResponse?>addToCart (int productId) async {
    EasyLoading.show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    int?  userId = pref.getInt('userId');
    try{
      var headers = {
  'Cookie': 'jwt=$token'
};
var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/add-to-cart/$userId/$productId',
  options: Options(
    method: 'POST',
    headers: headers,
  ),
);

if (response.statusCode == 201) {
  EasyLoading.dismiss();
  return AddToCartResponse.fromJson(response.data);
}
else {
  EasyLoading.dismiss();
  print(response.statusCode);
}
    }catch(e){
    print(e);
    }
  }

  //=========================== Viewcart

  Future <CartResponseModel?>viewcart() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    int?  userId = pref.getInt('userId');
    try{
      var headers = {
  'Cookie': 'jwt=$token'
};
var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/view-cart/$userId/',
  options: Options(
    method: 'GET',
    headers: headers,
  ),
);

if (response.statusCode == 200) {
  return CartResponseModel.fromJson(response.data);
}
else {
  print(response.statusMessage);
}

    }catch(e){
      print(e);
    }
  }

  //===== update quantity 
  Future <UpdatecartResponseModel?>updatecart(int quantity,int cartId) async{
    EasyLoading.show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    int?  userId = pref.getInt('userId');
  try{
    var headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Cookie': 'jwt=$token'
};
var data = {
  'quantity': quantity.toString()
};
var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/update-cart/$userId/$cartId/',
  options: Options(
    method: 'PUT',
    headers: headers,
  ),
  data: data,
);

if (response.statusCode == 200) {
  EasyLoading.dismiss();
  UpdatecartResponseModel.fromJson(response.data);
}
else {
  EasyLoading.dismiss();
  print(response.statusMessage);
}
  }catch(e){
 EasyLoading.dismiss();
 print(e);
  }
  }

  //=====================delete cart ========

  Future<UpdatecartResponseModel?> deletecart (int cartId)async{
    EasyLoading.show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    int?  userId = pref.getInt('userId');
  try{
    var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/delete-cart-item/$userId/$cartId/',
  options: Options(
    method: 'DELETE',
  ),
);

if (response.statusCode == 200) {
  EasyLoading.dismiss();
   return UpdatecartResponseModel.fromJson(response.data);
}
else {
  EasyLoading.dismiss();
  print(response.statusMessage);
}

  }catch(e){
  print(e);
  }
  }
}