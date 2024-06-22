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
        print(" these is your value ${value?.toJson()}");
        profileList = value;
      },
    );
    notifyListeners();
  }

  editProfile(
      {required String name,
      required String email,
      required String adress,
      required BuildContext context}) async {
    await proRepo.editProfile(name: name, email: email, adress: adress).then(
      (value) {
        print('Succsfull Edit Profile');
        if (value == null) {
          showFlushBarCustom(
              context: context,
              color: Colors.red,
              message: 'Profile data Failed');
        } else {
          Navigator.of(context).pop();

          showFlushBarCustom(
              context: context,
              color: Colors.green,
              message: 'Profile data Loadedsuccesfully loaded ');
        }
      },
    );
    notifyListeners();
  }
}
