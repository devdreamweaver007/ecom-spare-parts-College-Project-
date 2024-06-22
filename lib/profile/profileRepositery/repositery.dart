import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:spareproject/profile/profileModel/editProfileModel.dart';
import 'package:spareproject/profile/profileModel/profileModel.dart';

class ProRepo {
  Future<ProfileModel?> getProfiledteials() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        'https://prethewram.pythonanywhere.com/api/profile/6/',
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

  Future<EditProfileModel?> editProfile(
      {required String name,
      required String email,
      required String adress}) async {
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var data = {'name': name, 'email': email, 'address_line': adress};
      var dio = Dio();
      var response = await dio.request(
        'https://prethewram.pythonanywhere.com/api/profile/8/',
        options: Options(
          method: 'PUT',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        return EditProfileModel.fromJson(response.data);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print('THis is yur Error: $e');
    }
  }
}
