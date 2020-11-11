import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/constant/strings.dart';
import 'package:flutter_mall_self/entity/my_orders_entity.dart';
import 'package:flutter_mall_self/utils/SharePreferenceUtils.dart';
import 'package:flutter_mall_self/utils/http_util.dart';
import 'package:flutter_mall_self/widget/empty_view.dart';
import 'package:flutter_mall_self/widget/item_order_goods_detail.dart';
import 'package:flutter_mall_self/widget/item_order_num.dart';

class MyOrderPage extends StatefulWidget {
  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  var _page = 1;
  var _limit = 10;
  MyOrdersEntity _ordersEntity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharePreference.getShareData(Strings.TOKEN).then((value) => {
          print("token$value"),
          if (value != null)
            {
              _getMyOrder(),
            }
        });
  }

  void _getMyOrder() {
    var parameters = {"page": _page, "limit": _limit};
    HttpUtil.instance
        .get(Api.BASE_URL + Api.MINE_ORDERS, parameters: parameters)
        .then((value) => {
              print("我的订单$value"),
              setState(() {
                _ordersEntity =
                    MyOrdersEntity().fromJson(json.decode(value.toString()));
              }),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的订单'),
        centerTitle: true,
      ),
      body: _ordersEntity == null
          ? EmptyView()
          : SafeArea(
              child: EasyRefresh(
                header: DeliveryHeader(),
                footer: BezierBounceFooter(backgroundColor: Colors.deepOrange),
                child: ListView.builder(
                  itemCount: _ordersEntity.data.xList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ItemOrderNum(_ordersEntity.data.xList[index].orderSn),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              _ordersEntity.data.xList[index].goodsList.length,
                          itemBuilder: (BuildContext context, int insideIndex) {
                            return ItemOrderGoodsDetail(
                                _ordersEntity
                                    .data.xList[index].goodsList[insideIndex].picUrl,
                                _ordersEntity.data.xList[index].goodsList[insideIndex]
                                    .goodsName,
                                _ordersEntity.data.xList[index].goodsList[insideIndex]
                                    .specifications[0],
                                _ordersEntity
                                    .data.xList[index].goodsList[insideIndex].price,
                                _ordersEntity
                                    .data.xList[index].goodsList[insideIndex].number);
                          },
                        )
                      ],
                    );
                  },
                ),
                onRefresh: () async {
                  _page = 1;
                  _getMyOrder();
                },
                onLoad: () async {},
              ),
            ),
    );
  }
}
