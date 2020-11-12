import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/entity/address_entity.dart' show AddressDataList;
import 'package:flutter_mall_self/entity/cart_all_entity.dart';
import 'package:flutter_mall_self/entity/good_detail_entity.dart';
import 'package:flutter_mall_self/entity/order_submit_entity.dart';
import 'package:flutter_mall_self/utils/event_bus.dart';
import 'package:flutter_mall_self/utils/http_util.dart';
import 'package:flutter_mall_self/utils/navigator_util.dart';
import 'package:flutter_mall_self/utils/toast_utils.dart';
import 'package:flutter_mall_self/widget/cached_image.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class OrderDetailPage extends StatefulWidget {
  var type = "0";
  var jsonData = "数据暂无";

  OrderDetailPage(this.type, this.jsonData);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  var _couponPrice = 0;
  var type = "0";
  var jsonData = "";
  var _lastPrice = 0;
  GoodDetailEntity _goodDetailEntity;
  List<String> typeList = List();
  int _chooseNum = 0;
  int _chooseIndex = 0;
  AddressDataList addressDataList;
  OrderSubmitEntity _orderSubmitEntity;
  TextEditingController _remarkController = TextEditingController();

  CartAllEntity _cartAllEntity;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    type = widget.type;
    jsonData = widget.jsonData;
    typeList = type.split("-");
    _chooseNum = int.parse(typeList[1]);
    _chooseIndex = int.parse(typeList[2]);
    switch (typeList[0]) {
      case "0":
        _goodDetailEntity = GoodDetailEntity().fromJson(json.decode(jsonData));
        _goodDetailEntity.data.chooseIndex = _chooseIndex;
        _goodDetailEntity.data.chooseNum = _chooseNum;
        print("_entity000.chooseNum=${_goodDetailEntity.data.chooseNum}");
        print("_entity000.chooseIndex=${_goodDetailEntity.data.chooseIndex}");
        _setLastPrice();
        break;
      case "1":
        _cartAllEntity = CartAllEntity().fromJson(json.decode(jsonData));
        _cartAllEntity.data.cartList.removeWhere((element){
          return !element.isCheck;
        });
        print("购物车对象$_cartAllEntity");
        print("购物车对象${_cartAllEntity.data.cartList.length}");
        print("_entity111.chooseNum=$_chooseNum");
        print("_entity111.chooseIndex=$_chooseIndex");
        _setCartLastPrice();
        break;
    }

    _setListener();
  }
  _setCartLastPrice(){
   setState(() {
     _lastPrice = 0;
     for(var item in _cartAllEntity.data.cartList){
       _lastPrice += item.price*item.number;
     }
   });
  }
  void _setLastPrice() {
    setState(() {
      _lastPrice = 0;
      _lastPrice = _goodDetailEntity.data.chooseNum*_goodDetailEntity.data.info.retailPrice;
    });
  }
  _setListener(){
    eventBus.on<AddresEvent>().listen((event) {
      setState(() {
        addressDataList = event.addressData;
      });
    });
  }
  _submitOrder(){
    if(addressDataList==null){
      ToastUtils.showFlutterToast("地址暂未选择");
      return;
    }
    var parameters = {
      "cartId":_cartAllEntity.data.cartList,
      "addressId":addressDataList.id,
      "couponId":0,
      "message":_remarkController.text.isEmpty?"":_remarkController.text.toString(),
      "grouponRulesId":0,
      "grouponLinkId":0,
    };
    HttpUtil.instance
        .post(Api.BASE_URL + Api.SUBMIT_ORDER, parameters: parameters)
        .then((value) => {
      if (value != null)
        {
          _orderSubmitEntity = OrderSubmitEntity().fromJson(json.decode(value.toString())),
          if(_orderSubmitEntity!=null){
            if(_orderSubmitEntity.errno==0){
              ToastUtils.showFlutterToast("下单成功"),
              NavigatorUtil.goMallPage(context),
            }else{
              ToastUtils.showFlutterToastLong("${_orderSubmitEntity.errmsg} API参数异常就当成功了跳转首页"),
              NavigatorUtil.goMallPage(context),
            }
          }
        }
    });
  }

  void _addOrCut(){
    _setCartLastPrice();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单详情'),
        centerTitle: true,
      ),
      body: typeList[0] == "0"
          ? buildType0CustomScrollView()
          : buildType1CustomScrollView(),
      bottomNavigationBar: buildBottomAppBar(context),
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 45.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("实付：￥$_lastPrice"),
            ),
            Container(
              height: 45.0,
              width: 60.0,
              alignment: Alignment.center,
              color: Colors.deepOrange,
              child: GestureDetector(
                onTap: () {
                  // Toast.show("去付款", context);
                  _submitOrder();
                },
                child: Text(
                  '付款',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomScrollView buildType1CustomScrollView() {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        // SliverList(
        //   delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        //       return _topWidgets[index];
        //     },
        //     childCount: _topWidgets.length,
        //   ),
        // ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (){
                    NavigatorUtil.goAddressPage(context,"1");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(addressDataList==null?'个人信息':"${addressDataList.name} ${addressDataList.tel}"),
                          Text(addressDataList==null?'地址详情':"${addressDataList.province} ${addressDataList.city} ${addressDataList.county} ${addressDataList.addressDetail}"),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Toast.show("1", context);
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          size: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('无可用优惠卷'),
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10.0),
                            child: Text('$_couponPrice元')),
                        Icon(
                          Icons.arrow_forward,
                          size: 15.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      '备注',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, top: 9.0),
                        height: 30.0,
                        child: TextField(
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            textBaseline: TextBaseline.alphabetic, //用于提示文字对齐
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            isDense: true,
                            //重要 用于编辑框对齐
                            contentPadding: EdgeInsets.zero,
                            hintText: "备注",
                            border: InputBorder.none,
                            //去除编辑框下划线
                            hintStyle: TextStyle(
                                fontSize: 15.0,
                                textBaseline: TextBaseline.alphabetic,
                                //用于提示文字对齐
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('商品合计'), Text("$_lastPrice元")],
                  )),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('运费'), Text('￥0')],
                  )),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return

                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0,color: Colors.grey))),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: [
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
                )
                ;
            },
            childCount: _cartAllEntity.data.cartList.length,
          ),
        ),
      ],
    );
  }

  CustomScrollView buildType0CustomScrollView() {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        // SliverList(
        //   delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        //       return _topWidgets[index];
        //     },
        //     childCount: _topWidgets.length,
        //   ),
        // ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding: EdgeInsets.all(10.0),
                child: InkWell(onTap: (){
                  NavigatorUtil.goAddressPage(context,"1");
                },child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(addressDataList==null?'个人信息':"${addressDataList.name} ${addressDataList.tel}"),
                        Text(addressDataList==null?'地址详情':"${addressDataList.province}${addressDataList.city}${addressDataList.county}${addressDataList.addressDetail}"),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 15.0,
                    ),
                  ],
                ),
              ),),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(onTap: (){
                        ToastUtils.showFlutterToast("暂无优惠卷");
                      },child: Text('无可用优惠卷')),
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10.0),
                            child: Text('$_couponPrice元')),
                        Icon(
                          Icons.arrow_forward,
                          size: 15.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      '备注',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, top: 9.0),
                        height: 30.0,
                        child: TextField(
                          controller: _remarkController,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            textBaseline: TextBaseline.alphabetic, //用于提示文字对齐
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            isDense: true,
                            //重要 用于编辑框对齐
                            contentPadding: EdgeInsets.zero,
                            hintText: "备注",
                            border: InputBorder.none,
                            //去除编辑框下划线
                            hintStyle: TextStyle(
                                fontSize: 15.0,
                                textBaseline: TextBaseline.alphabetic,
                                //用于提示文字对齐
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('商品合计'), Text("$_lastPrice元")],
                  )),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('运费'), Text('￥0')],
                  )),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        // SliverPadding(
        //   padding: EdgeInsets.only(top: 30.0),
        // ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CachedImageView(
                            40.0, 40.0, _goodDetailEntity.data.info.picUrl),
                        Container(margin: EdgeInsets.only(left: 10.0),),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${_goodDetailEntity.data.info.name}"),
                            Text(
                                "${_goodDetailEntity.data.specificationList[0].valueList[_chooseIndex].value}"),
                            Text("￥${_goodDetailEntity.data.info.retailPrice}",style: TextStyle(color: Colors.red),),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("X${_goodDetailEntity.data.chooseNum.toString()}"),
                    ),
                  ],
                ),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
