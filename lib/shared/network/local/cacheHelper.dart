

import 'package:shared_preferences/shared_preferences.dart';

import '../../components/constants.dart';


  Future<void> saveUserInfo(String uid , dynamic myCity)async {
    final prefs1 = await SharedPreferences.getInstance();
    final prefs2 = await SharedPreferences.getInstance();
    await prefs1.setString('uid', uid);
    await prefs2.setString('myCity', myCity);
  }

  Future<String?> getUserUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }
  Future<void> clearUserUid() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid','haveBefore');
  }






