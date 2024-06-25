import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spareproject/profile/profileModel/editProfileModel.dart';
import 'package:spareproject/profile/profileModel/profileModel.dart';

class ProRepo {
  Future<ProfileModel?> getProfiledteials() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? id = pref.getInt('userId');
    try {
      var dio = Dio();
      var response = await dio.request(
        'https://prethewram.pythonanywhere.com/api/profile/$id/',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        return ProfileModel.fromJson(response.data);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print('THis Is your error: $e');
    }
  }

  Future<EditProfileModel?> editProfile({
  required String name,
  required String email,
  required String address,
  File? profileImage,
}) async {
  EasyLoading.show();
  SharedPreferences pref = await SharedPreferences.getInstance();
  int? id = pref.getInt('userId');
  try {
    var headers = {'Content-Type': 'multipart/form-data'}; // Update content type
    var dio = Dio();

    // Prepare FormData
    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
      'address_line': address,
      if (profileImage != null)
        'profile_image': await MultipartFile.fromFile(profileImage.path),
    });
    var response = await dio.put(
      'https://prethewram.pythonanywhere.com/api/profile/$id/',
      options: Options(
        headers: headers,
      ),
      data: formData,
    );

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      print(json.encode(response.data));
      return EditProfileModel.fromJson(response.data);
    } else {
      EasyLoading.dismiss();
      print(response.statusMessage);
      return null;
    }
  } catch (e) {
    EasyLoading.dismiss();
    print('This is your Error: $e');
    return null;
  }
}

}
