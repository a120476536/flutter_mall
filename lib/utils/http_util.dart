import 'package:dio/dio.dart';
import 'package:flutter_mall_self/constant/strings.dart';
import 'package:flutter_mall_self/utils/SharePreferenceUtils.dart';

var dio;

class HttpUtil {
  // 工厂模式
  static HttpUtil get instance => _getInstance();

  static HttpUtil _httpUtil;

  static HttpUtil _getInstance() {
    if (_httpUtil == null) {
      _httpUtil = HttpUtil();
    }
    return _httpUtil;
  }

  HttpUtil() {
    BaseOptions options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    dio = new Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      print("========================请求数据===================");
      print("url=${options.uri.toString()}");
      print("params_data=${options.data}");
      dio.lock();
      // await SharePreference.getToken().then((token) {
      //   options.headers[Strings.TOKEN] = token;
      // });
      await SharePreference.getShareData(Strings.TOKEN).then((token) => {
        options.headers[Strings.TOKEN] = token
      });
      print("options_header=${options.headers}");
      dio.unlock();
      return options;
    }, onResponse: (Response response) {
      print("========================请求结果===================");
      print("code=${response.statusCode}");
      print("response=${response.data}");
      print("response.toString=$response");
    }, onError: (DioError error) {
      print("========================请求错误===================");
      print("message =${error.message}");
    }));
  }

  Future get(String url,
      {Map<String, dynamic> parameters, Options options}) async {
    Response response;
    if (parameters != null && options != null) {
      response =
      await dio.get(url, queryParameters: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.get(url, queryParameters: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.get(url, options: options);
    } else {
      response = await dio.get(url);
    }
    // return response.data;
    return response;
  }

  Future post(String url, {Map<String, dynamic> parameters, Options options}) async {
    Response response;
    if (parameters != null && options != null) {
      response = await dio.post(url, data: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.post(url, data: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.post(url, options: options);
    } else {
      response = await dio.post(url);
    }
    // return response.data;
    return response;
  }
}
