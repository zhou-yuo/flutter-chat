import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class Shared {
  static String sharedKey = 'chat_';
  static String tokenKey = '${sharedKey}token';

  Shared._();

  /// 设置token
  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  /// 清空token
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
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

  // 退出登录
  static void logout(BuildContext context) {
    clearToken();
    toLogin(context);
  }

  static void toLogin(BuildContext context) {
    context.go('/login');
  }

  static void toRegist(BuildContext context) {
    context.go('/regist');
  }
}
