import 'package:shared_preferences/shared_preferences.dart';

Future storeToken(String token) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('token', token);
}

Future storeUserId(int userId) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setInt('userId', userId);
}

Future removeToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.remove('token');
}

Future getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString('token');
  return token != null;
}
