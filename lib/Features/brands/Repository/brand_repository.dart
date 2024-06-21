import 'package:dio/dio.dart';
import 'package:spareproject/Features/Home/Model/all_products_model.dart';

class BrandRepository {

  Future<List<AllProductsResponse>?> getAllBrands (int brandId) async {
    try{
    var dio = Dio();
var response = await dio.request(
  'https://prethewram.pythonanywhere.com/api/parts_categories/filter/brand/$brandId/',
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

    }
  }
}