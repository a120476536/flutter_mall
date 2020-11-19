import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall_self/router/application.dart';
import 'package:flutter_mall_self/router/routers.dart';
import 'package:flutter_stack_trace/flutter_stack_trace.dart';
import 'package:flutter_bmfbase/BaiduMap/bmfmap_base.dart' show BMFMapSDK, BMF_COORD_TYPE;
void main() {
  // 百度地图sdk初始化鉴权
  if (Platform.isIOS) {
    BMFMapSDK.setApiKeyAndCoordType(
        '请在此输入您在开放平台上申请的API_KEY', BMF_COORD_TYPE.BD09LL);
  } else if (Platform.isAndroid) {
    // Android 目前不支持接口设置Apikey,
    // 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
    BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
  }
  runApp(MallApp());
  debugLog("test", isShowTime: false);
}

class MallApp extends StatelessWidget {
  MallApp(){
    final router = FluroRouter();
    Routers.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "电商", /*home: MallPage(),*/
        onGenerateRoute: Application.router.generator,
    );
  }
}
