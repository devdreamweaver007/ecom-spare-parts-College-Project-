import 'package:dio/dio.dart';
import 'package:spareproject/Features/Home/Model/all_products_model.dart';
import 'package:spareproject/Features/Home/Model/get_all_brands_model.dart';
import 'package:spareproject/Features/Home/Model/get_product_by_id_model.dart';
import 'package:spareproject/Features/Home/Model/search_product_response_model.dart';

class HomeRepository {
  Future <List<AllProductsResponse>?>getProducts() async {
    try{
      var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/parts_categories/',
  options: Options(
    method: 'GET',
  ),
);

if (response.statusCode == 200) {
   List<dynamic> data = response.data;
     List<AllProductsResponse> products = data.map((json) => AllProductsResponse.fromJson(json)).toList();
      return products;
}
else {
}
    }catch(e){
      print(e);
    }
  }

  // product by id
  Future <GetProductModel?> getProductById ({required int id}) async {
    try{
      var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/parts_categories/$id/',
  options: Options(
    method: 'GET',
  ),
);

if (response.statusCode == 200) {
  return GetProductModel.fromJson(response.data);
}
else {
  print(response.statusMessage);
}
    } catch(e){
      print(e);
    }
  }

  //==========================get product by parts=====

  Future <List<AllProductsResponse>?>getproductBycategoryId ({required int id}) async {
    try{
      var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/Top_categories/filter/$id/',
  options: Options(
    method: 'GET',
  ),
);

if (response.statusCode == 200) {
  List<dynamic> data = response.data;
     List<AllProductsResponse> products = data.map((json) => AllProductsResponse.fromJson(json)).toList();
      return products;
}
else {
  print(response.statusMessage);
}
    }catch(e){
    print(e);
    }
  }

  //===================getProductbyvehicle==
  Future <List<AllProductsResponse>?>getproductsByVehicle ({required int id}) async {
    try{
      var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/parts_categories/filter/$id/',
  options: Options(
    method: 'GET',
  ),
);

if (response.statusCode == 200) {
  List<dynamic> data = response.data;
     List<AllProductsResponse> products = data.map((json) => AllProductsResponse.fromJson(json)).toList();
      return products;
}
else {
  print(response.statusMessage);
}
    }catch(e){
    print(e);
    }
  }
  //========================= get All Brands 
  Future <List<GetAllBrandsLogo>?>getAllBrands () async {
    try{
      var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/brands/',
  options: Options(
    method: 'GET',
  ),
);

if (response.statusCode == 200) {
  List<dynamic> data = response.data;
     List<GetAllBrandsLogo> products = data.map((json) => GetAllBrandsLogo.fromJson(json)).toList();
      return products;
}
else {
  print(response.statusMessage);
}
    }catch(e){
    print(e);
    }
  }

  //==================Search Products ========================

  Future<SearchproductResponseModel?> searchProducts({required String query}) async {
    try{
var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/search/?search_query=$query',
  options: Options(
    method: 'GET',
  ),
);

if (response.statusCode == 200) {
  return SearchproductResponseModel.fromJson(response.data);
}
else {
  print(response.statusMessage);
}
    }catch(e){print(e);}
  }
}