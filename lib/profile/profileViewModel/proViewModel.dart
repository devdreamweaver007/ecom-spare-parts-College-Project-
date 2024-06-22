import 'package:flutter/material.dart';
import 'package:spareproject/profile/profileModel/profileModel.dart';
import 'package:spareproject/profile/profileRepositery/repositery.dart';

class ProVieModel extends ChangeNotifier {
  ProRepo proRepo = ProRepo();
  ProfileModel? profileList;

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
      required String adress}) async {
    await proRepo.editProfile(name: name, email: email, adress: adress).then(
      (value) {
        print('Succsfull Edit Profile');
      },
    );
    notifyListeners();
  }
}
