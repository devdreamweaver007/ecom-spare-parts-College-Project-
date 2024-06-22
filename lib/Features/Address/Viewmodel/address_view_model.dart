import 'package:flutter/material.dart';
import 'package:spareproject/Features/Address/repository/address_repository.dart';

class AddressViewModel extends ChangeNotifier {
  AddressRepository addressrepo = AddressRepository();
  String address = "";

  getAddress()async{
    await addressrepo.getAddress().then((value){
      if(value != null ){
       address = value.addressLine ?? "";
      }else{
      }
    });
    notifyListeners();
  }
}