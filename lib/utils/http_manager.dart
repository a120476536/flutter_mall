import 'package:dio/dio.dart';
import 'package:flutter_mall_self/api/api.dart';

class HttpManager{
  //一个人工智能回答的免费API
  // final String _BASEURL = Api.BASE_URL;
  final int _CONNECTTIMEOUT = 5000;
  final int _RECEIVETIMEOUT = 3000;

  //单例模式
  static HttpManager _instance;
  Dio _dio;
  BaseOptions _options;

  //单例模式，只创建一次实例
  static HttpManager getInstance(){
    if(null == _instance){
      _instance = new HttpManager();
    }
    return _instance;
  }

  //构造函数
  HttpManager(){
    _options =new BaseOptions(
        baseUrl: Api.BASE_URL,
        //连接时间为5秒
        connectTimeout: _CONNECTTIMEOUT,
        //响应时间为3秒
        receiveTimeout: _RECEIVETIMEOUT,
        //设置请求头
        headers: {
          "resource":"android"
        },
        //默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
        contentType: Headers.formUrlEncodedContentType,
        //共有三种方式json,bytes(响应字节),stream（响应流）,plain
        responseType: ResponseType.json
    );
    _dio = new Dio(_options);
    //设置Cookie

    //添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options){
          print("在请求之前的拦截信息");
          print("========================请求数据===================");
          print("url=${options.uri.toString()}");
          print("params=${options.data}");
          _dio.lock();
          // await SharePreference.getToken().then((token) {
          //   options.headers[Strings.TOKEN] = token;
          // });
          _dio.unlock();
          return options;
        },
        onResponse: (Response response){
          print("在响应之前的拦截信息");
          print("========================请求结果===================");
          print("code=${response.statusCode}");
          print("response=${response.data}");
          return response;
        },
        onError: (DioError e){
          print("在错误之前的拦截信息");
          print("========================请求错误===================");
          print("message =${e.message}");
          return e;
        }
    ));
  }

  // //get请求方法
  // get(url,{data,options,cancelToken}) async{
  //   Response response;
  //   try{
  //     response = await _dio.get(url,queryParameters: data,options: options,cancelToken: cancelToken);
  //     print('getHttp response: $response');
  //   }on DioError catch(e){
  //     print('getHttp exception: $e');
  //     formatError(e);
  //   }
  //   return response;
  // }

  Future get(url,{data}) async{
    Response response;
    try {
      response = await _dio.get(url, queryParameters: data);
      print('getHttp $url respone:$response');
      return response.toString();
    } catch (e) {
      print('getHttp $url exception: $e');
    }
  }

  //post请求
  post(url,{params,options,cancelToken}) async{
    Response response;
    try{
      response = await _dio.post(url,queryParameters: params,options: options,cancelToken: cancelToken);
      print('postHttp  $url response: $response');
    }on DioError catch(e){
      print('postHttp  $url exception: $e');
      formatError(e);
    }
    return response;
  }

  //post Form请求
  postForm(url, {Map<String, dynamic> parameters/*,options,cancelToken*/}) async{
    Response response;
    try{
      response = await _dio.post(url,/*options: options,cancelToken: cancelToken,*/data: parameters);
      print('postHttp  $url response: $response');
    }on DioError catch(e){
      print('postHttp  $url exception: $e');
      formatError(e);
    }
    return response;
  }

  //下载文件
  downLoadFile(urlPath,savePath) async{
    Response response;
    try{
      response = await _dio.download(urlPath, savePath,onReceiveProgress: (int count,int total){
        print('$count $total');
      });
      print('downLoadFile  $urlPath response: $response');
    }on DioError catch(e){
      print('downLoadFile $urlPath exception: $e');
      formatError(e);
    }
    return response;
  }


  //取消请求
  cancleRequests(CancelToken token){
    token.cancel("cancelled");
  }

  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      print("请求取消");
    } else {
      print("未知错误");
    }
  }

}