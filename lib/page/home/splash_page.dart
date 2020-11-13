import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mall_self/utils/navigator_util.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;
  int currentTimer = 3;
  int stypeTimer = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///延时3秒直接跳转。
    // Future.delayed(Duration(seconds: 3), () {
    //   NavigatorUtil.goMallPage(context);
    // });
    ///增加欢迎页倒计时功能
    _timer = Timer.periodic(Duration(seconds: stypeTimer), (timer) {
      setState(() {
        currentTimer-=stypeTimer;
      });
      if(currentTimer<=0){
        timer.cancel();
        NavigatorUtil.goMallPage(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              "images/splash.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: RaisedButton(
              child: Text('$currentTimer'),
            ),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

// class SplashPage extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       child: Image.asset(
//         "images/splash.png",
//         height: double.infinity,
//         width: double.infinity,
//         fit: BoxFit.fill,
//       ),
//     ));
//   }
// }
