import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static String sharedKey = 'chat_';
  static String tokenKey = '${sharedKey}token';

  Shared._();

  /// 设置token
  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_phone', token);
  }

  /// 获取token
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(tokenKey) ?? '';
    return token;
  }

  /// 是否登录
  static Future<bool> isLogin() async {
    final token = await getToken();
    if (token != '') {
      return true;
    }
    return false;
  }
}
