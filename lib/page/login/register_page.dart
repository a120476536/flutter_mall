import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/entity/register_entity.dart';
import 'package:flutter_mall_self/utils/http_util.dart';
import 'package:flutter_mall_self/utils/toast_utils.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  RegisterEntity _registerEntity;

  _register(){
    Map<String, dynamic> map = Map();
    map.putIfAbsent("username", () => _accountController.text.toString());
    map.putIfAbsent("password", () => _pwdController.text.toString());
    map.putIfAbsent("mobile", () => _accountController.text.toString());
    map.putIfAbsent("code", () => "8888"); //测试验证码写死8888
    HttpUtil.instance.post(Api.BASE_URL+Api.REGISTER, parameters: map).then((value) => {
      if(value!=null){
        _registerEntity = RegisterEntity().fromJson(json.decode(value.toString())),
        if(_registerEntity.errno==0){
          ToastUtils.showFlutterToast("注册成功,请登录使用"),
          Navigator.pop(context),
        }else{
          ToastUtils.showFlutterToast(_registerEntity.errmsg),
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.deepOrangeAccent,
        alignment: Alignment.center,
        child: Container(
          // height: 200.0,
          // color: Colors.white,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(color:Colors.white,border: Border.all(width: 1.0),borderRadius: BorderRadius.all(Radius.circular(10.0),),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,//自适应高度
            children: [
              Text('FLUTTER_MALL',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
              TextField(
                  controller: _accountController,
                  maxLines: 1,
                  maxLength: 11,
                  decoration: InputDecoration(
                    hintText: "请输入手机号",
                    hintStyle: TextStyle(fontSize: 12.0),
                    labelText: "手机号",
                    labelStyle: TextStyle(fontSize: 14.0),
                  ),
                ),
              TextField(
                controller: _pwdController,
                maxLines: 1,
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: "请输入密码",
                  hintStyle: TextStyle(fontSize: 12.0),
                  labelText: "密码",
                  labelStyle: TextStyle(fontSize: 14.0),
                ),
              ),
              InkWell(
                onTap: (){
                  ToastUtils.showFlutterToast("注册");
                  _register();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.deepOrange),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 40.0,
                  child: Text(
                    '注册',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
