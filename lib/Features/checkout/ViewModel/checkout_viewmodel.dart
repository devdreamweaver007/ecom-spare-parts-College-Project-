import 'package:flutter/material.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/flush_custom.dart';
import 'package:spareproject/Features/checkout/model/my_order_response_model.dart';
import 'package:spareproject/Features/checkout/repository/checkout_repository.dart';
import 'package:spareproject/Features/checkout/view/orders_view.dart';

class CheckoutViewModel extends ChangeNotifier {
  CheckoutRepository checkoutrepo = CheckoutRepository();
  MyOrderResponseModel? myorders;


  checkout({required BuildContext context})async{
    await checkoutrepo.checkout().then((value){
      if(value?.message !=null){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MyordersScreen()));
      showFlushBarCustom(context: context, color: buttonColor, message: "Checkout Success",icon: Icons.check_circle_rounded);
      }else{
        showFlushBarCustom(context: context, color: Colors.red, message: "OOPS Something Went Wrong",icon: Icons.error);
      }
    });
    notifyListeners();
  }

  //get all orders 

  getAllOrders () async {
    await checkoutrepo.myorders().then((value){
    if(value!=null){
      myorders = value ;
    }
    });
    notifyListeners();
  }
}