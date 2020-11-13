import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/constant/strings.dart';
import 'package:flutter_mall_self/entity/login2_entity.dart';
import 'package:flutter_mall_self/entity/login_entity.dart';
import 'package:flutter_mall_self/page/login/register_page.dart';
import 'package:flutter_mall_self/utils/SharePreferenceUtils.dart';
import 'package:flutter_mall_self/utils/event_bus.dart';
import 'package:flutter_mall_self/utils/http_manager.dart';
import 'package:flutter_mall_self/utils/http_util.dart';
import 'package:flutter_mall_self/utils/navigator_util.dart';
import 'package:flutter_mall_self/utils/toast_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';
import 'package:event_bus/event_bus.dart';
/// 登录接口返回的josn数据异常，（接口取自三方），因此采用截取方式处理
class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _accountTextControl = TextEditingController();
  TextEditingController _passwordTextControl = TextEditingController();
  LoginEntity _loginEntity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharePreference.getShareData(Strings.TOKEN).then((value) => {
      if(value==null){
        _goLogin(),
      }else{
        print('已登录'),
      }
    });
  }
  void _goLogin(){
    Map<String, dynamic> map = Map();
    map.putIfAbsent("username", () => _accountTextControl.text.toString());
    map.putIfAbsent("password", () => _passwordTextControl.text.toString());
    SharePreference.getShareData(Strings.TOKEN).then((value) => {
      if (value == null)
            {
              HttpUtil.instance.post(Api.BASE_URL + Api.LOGIN, parameters: map).then((value) => {
                        print('登录结果$value'),
                        _loginEntity = LoginEntity().fromJson(json.decode(value.toString())),
                        // ignore: unrelated_type_equality_checks
                        print("登录对象${_loginEntity.toString()}"),
                        // ignore: unrelated_type_equality_checks
                        print("登录对象errno${_loginEntity.errno == "0"}"),
                        if (_loginEntity.errno == "0"){
                            SharePreference.saveShareData(Strings.TOKEN, _loginEntity.data.token),
                            SharePreference.saveShareData(Strings.NICK_NAME, _loginEntity.data.userInfo.nickName),
                            SharePreference.saveShareData(Strings.AVATARURL, _loginEntity.data.userInfo.avatarUrl),
                            eventBus.fire(LoginEvent(_loginEntity)),
                            Navigator.of(context).pop(),
                          }
                        else {ToastUtils.showToast(context, _loginEntity.errmsg)}
                      }),
            }
        });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('登录'),
      // ),
      backgroundColor: Colors.deepOrangeAccent,
      body: SafeArea(
        top: false,
        child: Container(
          margin: EdgeInsets.only(top: 150.0),
          child: Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            width: double.infinity,
            height: 300.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50.0,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      maxLines: 1,
                      maxLength: 11,
                      // autovalidate: _autovalidator,
                      keyboardType: TextInputType.phone,
                      // validator: _validatorAccount,
                      decoration: InputDecoration(
                        errorText: "请输入正确账号",
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.deepOrangeAccent,
                          size: ScreenUtil.instance.setWidth(60.0),
                        ),
                        hintText: Strings.ACCOUNT_HINT,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil.instance.setSp(28.0)),
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil.instance.setSp(28.0)),
                        // labelText: Strings.ACCOUNT,
                      ),
                      controller: _accountTextControl,
                    ),
                  ),
                  Container(
                    height: 50.0,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      controller: _passwordTextControl,
                      maxLines: 1,
                      maxLength: 18,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        errorText: "请输入正确密码",
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.deepOrangeAccent,
                          size: ScreenUtil.instance.setWidth(60.0),
                        ),
                        hintText: Strings.PASSWORD_HINT,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil.instance.setSp(28.0)),
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil.instance.setSp(28.0)),
                        // labelText: Strings.ACCOUNT,
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      onPressed: () => _goLogin(),
                      color: Colors.deepOrange,
                      child: Text(
                        '登录',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  InkWell(onTap: (){
                      // NavigatorUtil.goRegisterPage(context);
                    Navigator.of(context).push(MaterialPageRoute(builder: (_){
                      return RegisterPage();
                    },),);
                  },child: Text('没有账号?立即注册'),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // eventBus.destroy();
  }
}
