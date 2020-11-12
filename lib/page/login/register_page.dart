import 'package:flutter/material.dart';
import 'package:flutter_mall_self/utils/toast_utils.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

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
          color: Colors.white,
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _accountController,
                maxLines: 1,
                maxLength: 11,
                decoration: InputDecoration(
                  hintText: "请输入账号",
                  hintStyle: TextStyle(fontSize: 12.0),
                  labelText: "账号",
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
