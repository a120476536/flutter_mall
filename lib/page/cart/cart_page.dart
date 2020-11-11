import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/constant/strings.dart';
import 'package:flutter_mall_self/entity/cart_all_entity.dart';
import 'package:flutter_mall_self/entity/login_entity.dart';
import 'package:flutter_mall_self/utils/SharePreferenceUtils.dart';
import 'package:flutter_mall_self/utils/event_bus.dart';
import 'package:flutter_mall_self/utils/http_util.dart';
import 'package:flutter_mall_self/widget/cached_image.dart';
import 'package:flutter_mall_self/widget/empty_view.dart';
import 'package:flutter_mall_self/widget/loading_dialog.dart';
import 'package:toast/toast.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isLogin = false;
  bool _isCheck = false;
  List<Widget> _list = List();
  var _lastMoney = 0;
  CartAllEntity _cartAllEntity;
  EasyRefreshController _controller = EasyRefreshController();
  LoginEntity _loginEntity;
  @override
  void initState() {
    super.initState();
    _listener();
    SharePreference.getShareData(Strings.TOKEN).then((token) => {
          setState(() {
            if (token==null) {
              _isLogin = false;
            } else {
              _isLogin = true;
            }
          }),
        });
    // for (int i = 0; i < 50; i++) {
    //   _list.add(Text("索引$i"));
    // }
    _getCartList();
  }

  void _getCartList() {
    Options options = Options();
    HttpUtil.instance
        .get(Api.BASE_URL + Api.CART_LIST, options: options)
        .then((value) => {
          _controller.finishRefresh(),
              print("购物车请求结果:$value"),
              setState(() {
                _cartAllEntity = CartAllEntity().fromJson(json.decode(value.toString()));
                print("购物车请求结果${_cartAllEntity.errmsg}");
              }),
            });
    // _cartAllEntity = CartAllEntity().fromJson(json.decode(response.toString()));
  }
  _deleteGoods(int index) {
    var parameters = {
      "productIds": [_cartAllEntity.data.cartList[index].productId]
    };
    HttpUtil.instance.post(Api.BASE_URL+Api.CART_DELETE,  parameters: parameters).then((value) => {
      print("删除item$value"),
      if(value!=null){
        if(value.data['errno']==0){
          _cartAllEntity.data.cartList.removeAt(index),
          Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("删除成功"))),
        }else{
          Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("删除失败"))),
        }
      }
    });
  }
  void setCheckAll(bool _isCheck){
    setState(() {
      if(_isCheck){
        for(int i =0;i<_cartAllEntity.data.cartList.length;i++){
          _cartAllEntity.data.cartList[i].isCheck = true;
        }
      }else{
        for(int i =0;i<_cartAllEntity.data.cartList.length;i++){
          _cartAllEntity.data.cartList[i].isCheck = false;
        }
      }
    });
    _checkList();
  }
  ///最终都调用当前方法去计算金额
  void _checkList(){
    setState(() {
      _lastMoney = 0;
      for(int i =0;i<_cartAllEntity.data.cartList.length;i++){
        if(_cartAllEntity.data.cartList[i].isCheck){
          _lastMoney+=_cartAllEntity.data.cartList[i].price*_cartAllEntity.data.cartList[i].number;
        }
      }
    });
  }
  void _addOrCut(){
    _checkList();
  }

  void _listener(){
    eventBus.on<LoginEvent>().listen((event) {
      setState(() {
        _loginEntity = event.loginEntity;
        if(_loginEntity.errno=="0"){
          _isLogin = true;
        }else{
          _isLogin = false;
        }
        print("登录成功$_isLogin");
      });
    });

    eventBus.on<LoginOutEvent>().listen((event) {
      setState(() {
        _isLogin = event.isLogin;
        print("退出登录$_isLogin");
      });
    });
    eventBus.on<OnlyTypeEvent>().listen((event) {
      setState(() {
        if(event.type==0){
          _getCartList();
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
        centerTitle: true,
      ),
      body: !_isLogin
          ? EmptyView():_cartAllEntity==null||_cartAllEntity.data.cartList!=null||_cartAllEntity.data.cartList.length!=0?Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 50.0),
                  child: EasyRefresh(
                    onRefresh: () async{
                      _getCartList();
                      _controller.finishRefresh();
                    },
                      onLoad: () async{
                        _getCartList();
                      },
                      header: BezierCircleHeader(backgroundColor: Colors.deepOrange),
                      footer: BezierBounceFooter(backgroundColor: Colors.deepOrange),
                      enableControlFinishRefresh: true,
                      enableControlFinishLoad: false,
                      controller: _controller,
                      child: _cartAllEntity.data.cartList.length==0||_cartAllEntity.data.cartList==null?EmptyView():ListView.builder(
                        shrinkWrap: false,
                        scrollDirection: Axis.vertical,
                        itemCount: _cartAllEntity.data.cartList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            background: Container(alignment: Alignment.centerRight,width: double.infinity,color: Colors.red,child: Text('滑动删除'),),
                            onDismissed: (direction){
                              _deleteGoods(index);
                            },
                            key: Key("key_$index"),
                            child: Container(
                              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0,color: Colors.grey))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 50.0,
                                    child: Checkbox(
                                      value: _cartAllEntity.data.cartList[index].isCheck,
                                      activeColor: Colors.blue,
                                      onChanged: (bool val) {
                                        // val 是布尔值
                                        this.setState(() {
                                          _cartAllEntity.data.cartList[index].isCheck = !_cartAllEntity.data.cartList[index].isCheck;
                                          _checkList();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(padding: EdgeInsets.only(right: 10.0),child: CachedImageView(50.0, 50.0, _cartAllEntity.data.cartList[index].picUrl)),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(_cartAllEntity
                                            .data.cartList[index].goodsName),
                                        Wrap(
                                          alignment: WrapAlignment.start,
                                                children: [
                                                  Text(
                                                      "￥${_cartAllEntity.data.cartList[index].price}元"),
                                                  Text("规格："+_cartAllEntity
                                                      .data
                                                      .cartList[index]
                                                      .specifications[0],style: TextStyle(color: Colors.red),),

                                                ],
                                              ),
                                            ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    height: 25.0,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              _cartAllEntity.data
                                                  .cartList[index].number++;
                                            });
                                            _addOrCut();
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(left: 10.0),
                                            width: 20.0,
                                            height: 20.0,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: new Border.all(
                                                  width: 1, color: Colors.grey),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5.0),
                                                bottomLeft:
                                                    Radius.circular(5.0),
                                              ),
                                            ),
                                            child: Text('+'),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          height: 20.0,
                                          alignment: Alignment.center,
                                          child: Wrap(
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text(
                                                  "${_cartAllEntity.data.cartList[index].number}")
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              _cartAllEntity.data
                                                  .cartList[index].number--;
                                              // ignore: unnecessary_statements
                                              _cartAllEntity.data.cartList[index].number <= 0 ? _cartAllEntity.data.cartList[index].number = 1
                                                  // ignore: unnecessary_statements
                                                  : _cartAllEntity.data.cartList[index].number;
                                              _addOrCut();
                                            });
                                          },
                                          child: Container(
                                            width: 20.0,
                                            height: 20.0,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: new Border.all(
                                                  width: 1, color: Colors.grey),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5.0),
                                                bottomRight:
                                                    Radius.circular(5.0),
                                              ),
                                            ),
                                            child: Text('-'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.0),
                      border: Border.all(color: Colors.grey, width: 1.0),
                      // border: Border(top: BorderSide(width: 1.0,color: Colors.deepOrange),bottom: BorderSide(width: 1.0,color: Colors.deepOrange)),//这么写出bug了为啥？
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _isCheck,
                          activeColor: Colors.blue,
                          onChanged: (bool val) {
                            // val 是布尔值
                            this.setState(() {
                              _isCheck = !_isCheck;
                              setCheckAll(_isCheck);
                            });
                          },
                        ),
                        Expanded(flex: 2, child: Text("共计：$_lastMoney元")),
                        Expanded(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.only(right: 20.0),
                              child: RaisedButton(
                                ///备注如果当前按钮onpressed执行方法为空或者未定义，则默认当前按钮处于禁用状态，任何改动设置均不生效，比如颜色
                                onPressed: () {
                                  Toast.show("点击结算", context);
                                  _getCartList();
                                },
                                color: Colors.deepOrange,
                                child: Text(
                                  '结算',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ):LoadingDialog(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // eventBus.destroy();
  }
}
