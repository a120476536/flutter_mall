import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall_self/entity/good_detail_entity.dart';
import 'package:flutter_mall_self/router/application.dart';
import 'package:flutter_mall_self/router/routers.dart';

class NavigatorUtil {
  static goMallPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.mallPage,
        transition: TransitionType.inFromRight,
        replace: true,
        clearStack: true);
  }

  static goLoginPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.login,
        transition: TransitionType.inFromRight);
  }

  static goGoodsDetails(BuildContext context, var id) {
    ///flutter路由跳转fluro 传参无法跳转 传的值一定要用 Uri.encodeComponent() 包裹一下 ,同时注意 fluro仅仅接收String类型传值
    Application.router.navigateTo(
        context, Routers.goodsDetail + "?id=${Uri.encodeComponent(id)}",
        transition: TransitionType.inFromRight);
  }

  static goSubcategoryPage(BuildContext context, var id, var title) {
    Application.router.navigateTo(
        context,
        Routers.subcategory +
            "?id=${Uri.encodeComponent(id)}&title=${Uri.encodeComponent(title)}",
        transition: TransitionType.inFromRight);
  }

  // ignore: non_constant_identifier_names
  static goOrderDetailPage(BuildContext context, var type, var jsonData) {

    // GoodDetailEntity _enty = GoodDetailEntity().fromJson(jsonDecode(jsonData));
    // print("type=$type");
    // print("json=${_enty.data.toString()}");
    // print("jsonData=$jsonData}");
    // print("jsonDatachooseNum=${jsonData.indexof("chooseNum")}}");
    // print("_enty.chooseNum=${int.parse(_enty.data.chooseNum.toString()).toString()}");
    // print("_enty.chooseIndex=${_enty.data.chooseIndex.toString()}");
    Application.router.navigateTo(
        context,
        Routers.orderDetail +
            "?type=${Uri.encodeComponent(type)}"
                "&jsonData=${Uri.encodeComponent(jsonData)}"
        ,
        transition: TransitionType.inFromRight);
  }

  static goMyOrderPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.myOrder,
        transition: TransitionType.inFromRight);
  }

  static goSupportPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.supportPage,
        transition: TransitionType.inFromRight);
  }

  static goAddressPage(BuildContext context,var type) {
    Application.router.navigateTo(context, Routers.addressPage+"?type=${Uri.encodeComponent(type)}",
        transition: TransitionType.inFromRight);
  }

  static goAddressAddPage(BuildContext context,var addressjson) {
    Application.router.navigateTo(context, Routers.addressAddPage+"?addressjson=${Uri.encodeComponent(addressjson)}", transition: TransitionType.inFromRight);
  }
}
