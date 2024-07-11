import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class SharedManager {
  static String sharedKey = 'chat_';
  static String tokenKey = '${sharedKey}token';

  static SharedManager? _instance;
  late SharedPreferences _prefs;

  // 私有构造函数，确保只能在类内部实例化
  SharedManager._internal();

  // 工厂构造函数，返回单例实例
  factory SharedManager() {
    _instance ??= SharedManager._internal();
    return _instance!;
  }

  // 初始化SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// 设置token
  void setToken(String token) async {
    _prefs.setString(tokenKey, token);
  }

  /// 清空token
  void clearToken() {
    _prefs.remove(tokenKey);
  }

  /// 获取token
  String getToken() {
    return _prefs.getString(tokenKey) ?? '';
  }

  /// 是否登录
  bool isLogin() {
    final token = getToken();
    if (token != '') {
      return true;
    }
    return false;
  }

  // 退出登录
  void logout(BuildContext context) {
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
