import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spareproject/Constents/flush_custom.dart';
import 'package:spareproject/profile/profileModel/profileModel.dart';
import 'package:spareproject/profile/profileRepositery/repositery.dart';

class ProVieModel extends ChangeNotifier {
  ProRepo proRepo = ProRepo();
  ProfileModel? profileList;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();

  getProfil() async {
    await proRepo.getProfiledteials().then(
      (value) {
        if(value!=null){
        profileList = value;
        emailcontroller.text = value.email ?? "";
        namecontroller.text = value.name ?? "";
        adresscontroller.text = value.addressLine ?? "";
        }
      },
    );
    notifyListeners();
  }

  editProfile(
      {required String name,
      required String email,
      required String adress,
      File? profileImage,
      required BuildContext context}) async {
    await proRepo.editProfile(name: name, email: email, address: adress, profileImage: profileImage ).then(
      (value) {
        if (value == null) {
           Navigator.of(context).pop();
          showFlushBarCustom(
              context: context,
              color: Colors.red,
              message: 'Profile data Failed');
              getProfil();
        } else {
          Navigator.of(context).pop();
          showFlushBarCustom(
              context: context,
              color: Colors.green,
              message: 'Profile Updated');
              getProfil();
        }
      },
    );
    notifyListeners();
  }
}
