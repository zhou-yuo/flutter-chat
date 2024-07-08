import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Request {
  static String baseUrl = 'https://www.wanandroid.com/';
  static Map<String, dynamic> headers = {'token': 'token'};

  static Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 60),

    /// 接收数据的超时设置。
    receiveTimeout: const Duration(seconds: 60),

    /// 发送数据的超时设置。
    sendTimeout: const Duration(seconds: 60),

    /// HTTP 请求头。
    headers: headers,

    /// 表示 [Dio] 处理请求响应数据的类型
    responseType: ResponseType.json,
  ));

  // static getDio(params) {
  //   return dio(params);
  // }

  static Future send(String method, String url, {dynamic data}) async {
    try {
      return await dio.request(
        url,
        data: data,
        options: Options(method: method),
      );
    } on DioException catch (e) {
      EasyLoading.showError('请求错误');
      print(e.toString());
    }
  }
}
