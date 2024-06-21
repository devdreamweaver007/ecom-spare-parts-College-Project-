import 'package:flutter/material.dart';
import 'package:spareproject/Features/Home/Model/all_products_model.dart';
import 'package:spareproject/Features/brands/Repository/brand_repository.dart';

class BrandViewModel extends ChangeNotifier{

BrandRepository brandRepo = BrandRepository();
bool isLoading = false;
List<AllProductsResponse> brandsById = [];

getBrandById (int brandId) async {
  isLoading = true;
  await brandRepo.getAllBrands(brandId).then((value){
    if(value != null){
      isLoading = false;
      brandsById = value;
    }else{
      isLoading = false;
    }
  });
  notifyListeners();
}
}