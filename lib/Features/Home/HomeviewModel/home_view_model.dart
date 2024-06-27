import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/flush_custom.dart';
import 'package:spareproject/Features/Cart/Repository/repository.dart';
import 'package:spareproject/Features/Home/Model/all_products_model.dart';
import 'package:spareproject/Features/Home/Model/get_all_brands_model.dart';
import 'package:spareproject/Features/Home/Model/get_product_by_id_model.dart';
import 'package:spareproject/Features/Home/Model/search_product_response_model.dart';
import 'package:spareproject/Features/Home/repositery/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeRepository homerepository = HomeRepository();
  CartRepository cartrepo = CartRepository();
  List<AllProductsResponse> allproducts = [];
  List<AllProductsResponse> categoryProducts = [];
  List<AllProductsResponse> vehicles = [];
  List<GetAllBrandsLogo> allBrands = [];
  GetProductModel? getProducts;
  bool isLoading = false;
  List<Results> searchedresults = [];

  getAllProducts() async {
    isLoading = true;
    await homerepository.getProducts().then((value) {
      if (value != null) {
        isLoading = false;
        allproducts = value ?? [];
      } else {
        isLoading = false;
      }
    });
    notifyListeners();
  }

  getProductsById({required int id}) async {
    isLoading = true;
    await homerepository.getProductById(id: id).then((value) {
      if (value != null) {
        isLoading = false;
        getProducts = value;
      } else {
        isLoading = false;
      }
    });
    notifyListeners();
  }

  getProductBycategory({required int id}) async {
    isLoading = true;
    await homerepository.getproductBycategoryId(id: id).then((value) {
      if (value != null) {
        isLoading = false;
        categoryProducts = value;
      } else {
        isLoading = false;
      }
    });
    notifyListeners();
  }

  getProductByvehicle({required int id}) async {
    isLoading = true;
    await homerepository.getproductsByVehicle(id: id).then((value) {
      if (value != null) {
        isLoading = false;
        vehicles = value;
      } else {
        isLoading = false;
      }
    });
    notifyListeners();
  }

  getAllBrands() async {
    isLoading = true;
    await homerepository.getAllBrands().then((value) {
      if (value != null) {
        isLoading = false;
        allBrands = value ?? [];
      } else {
        isLoading = false;
      }
    });
    notifyListeners();
  }
  // =========================>Add to Cart

  addTocart(int productId, BuildContext context) async {
    await cartrepo.addToCart(productId).then((value) {
      if (value?.quantity != null) {
        showFlushBarCustom(
            context: context,
            color: buttonColor,
            message: "Product Added To Cart",
            icon: Icons.check_circle_outline_outlined);
      }
    });
    notifyListeners();
  }

  //=======getsearchedproducts

  getSearchResults(String query) async {
    isLoading = true;
    await homerepository.searchProducts(query: query).then((value) {
      if (value?.results != null) {
        isLoading = false;
        searchedresults = value?.results ?? [];
      } else {
        isLoading = false;
      }
    });
    notifyListeners();
  }

  checkTokenandId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? id = pref.getInt('userId');
    String? token = pref.getString('token');
    notifyListeners();
  }
}
