import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall_self/router/application.dart';
import 'package:flutter_mall_self/router/routers.dart';
import 'package:flutter_stack_trace/flutter_stack_trace.dart';

void main() {
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
