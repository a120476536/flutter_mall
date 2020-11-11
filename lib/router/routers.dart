import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_mall_self/router/route_handlers.dart';
class Routers {
  static String root = "/";
  static String mallPage = "/mallPage";
  static String categoryGoodsList = "/categoryGoodsList";
  static String subcategory = "/subcategory";
  static String goodsDetail = "/goodsDetail";
  static String login = "/loginView";
  static String register = "/register";
  static String fillInOrder = "/fillInOrder";
  static String address = "/myAddress";
  static String addressEdit = "/addressEdit";
  static String feedback = "/feedback";
  static String mineCoupon = "/mineCoupon";
  static String mineFootprint = "/mineFootprint";
  static String mineCollect = "/mineCollect";
  static String aboutUs = "/aboutUs";
  static String mineOrder = "/mineOrder";
  static String mineOrderDetail = "/mineOrderDetail";
  static String searchGoods = "/searchGoods";
  static String projectSelectionDetail = "/projectSelectionDetail";
  static String webView = "/webView";
  static String brandDetail = "/brandDetail";

  ////////////////////////////

  static String orderDetail ="/orderDetail";
  static String myOrder ="/myOrder";
  static String supportPage ="/supportPage";
  static String addressPage ="/addressPage";
  static String addressAddPage ="/addressAddPage";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc:
        // ignore: missing_return
        (BuildContext context, Map<String, List<String>> parameters) {
      print("handler not find");
    });

    router.define(root, handler: mallPageHandler);
    router.define(mallPage, handler: mallPageHandler);
    router.define(goodsDetail, handler: goodsDetailHandler);
    router.define(login, handler: loginHandler);
    router.define(subcategory, handler: subcategoryPageHandler);
    router.define(orderDetail, handler: orderDetailPageHandler);
    router.define(myOrder, handler: myOrderPageHandler);
    router.define(supportPage, handler: supportPageHandler);
    router.define(addressPage, handler: addressPageHandler);
    router.define(addressAddPage, handler: addressAddPageHandler);
  }
}