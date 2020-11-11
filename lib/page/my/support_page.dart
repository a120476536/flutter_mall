import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于我们'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10.0),child: Text(
              'FlutterMall是一个企业级商城Flutter项目,通过学习FlutterMall可以让读者达到开发企业项目的实战能力',style: TextStyle(fontSize: 15.0),),),
          Divider(
            color: Colors.grey,
            height: 1.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('作者'),
                Text('有点东西'),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 1.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('邮箱'),
                Text('1677156127@qq.com'),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 1.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('QQ'),
                Text('1677156127'),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 1.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('微信'),
                Text('qblitter'),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 1.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('API_SUPPORT'),
                Text('LITEMALL'),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
