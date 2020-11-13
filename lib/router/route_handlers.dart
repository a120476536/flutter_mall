import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall_self/category/sub_category.dart';
import 'package:flutter_mall_self/page/address/addres_add_page.dart';
import 'package:flutter_mall_self/page/address/address_page.dart';
import 'package:flutter_mall_self/page/cart/cart_page.dart';
import 'package:flutter_mall_self/page/goods/good_detail.dart';
import 'package:flutter_mall_self/page/home/mall.dart';
import 'package:flutter_mall_self/page/home/splash_page.dart';
import 'package:flutter_mall_self/page/login/login_view.dart';
import 'package:flutter_mall_self/page/login/register_page.dart';
import 'package:flutter_mall_self/page/my/mine_page.dart';
import 'package:flutter_mall_self/page/my/support_page.dart';
import 'package:flutter_mall_self/page/order/my_order_page.dart';
import 'package:flutter_mall_self/page/order/order_detail.dart';

//首页tab
var mallPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return MallPage();
});
//登录页面
var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LoginView();
});
var goodsDetailHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var goodsId = parameters["id"].first;
  return GoodDetail(goodsId);
});
//购物车
var cartPageHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return CartPage();
});
var minePageHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return MinePage();
});
var subcategoryPageHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      var id = parameters["id"].first;
      var title = parameters["title"].first;
  return SubCategory(id, title);
});
var orderDetailPageHandler = Handler(handlerFunc: (BuildContext context,Map<String, List<String>> parameters){
  String type = parameters["type"].first;
  String jsonData = parameters["jsonData"].first;
  return OrderDetailPage(type,jsonData);
});
var myOrderPageHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>> parameters){
  return MyOrderPage();
});
var supportPageHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>> parameters){
  return SupportPage();
});
var addressPageHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>> parameters){
  String type = parameters["type"].first;
  return AddressPage(type);
});
var addressAddPageHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>> parameters){
  String addressjson = parameters["addressjson"].first;
  return AddressAddPage(addressjson);
});
var registerPageHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>> parameters){
  return RegisterPage();
});
var splashPageHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>> parameters){
  return SplashPage();
});
