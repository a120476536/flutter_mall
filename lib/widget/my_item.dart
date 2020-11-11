import 'package:flutter/material.dart';
import 'package:flutter_mall_self/utils/navigator_util.dart';
import 'package:flutter_mall_self/utils/toast_utils.dart';

import 'cached_image.dart';

class MyItem extends StatelessWidget {
  var _lineNotice;
  var _imgUrl;
  IconData _iconData;

  MyItem(this._iconData, this._lineNotice, this._imgUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: () {
        // Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("我的订单")));

        switch (_lineNotice) {
          case "我的订单":
            NavigatorUtil.goMyOrderPage(context);
            break;
          case "优惠劵":
            ToastUtils.showToast(context, "$_lineNotice暂未开发");
            break;
          case "收藏":
            ToastUtils.showToast(context, "$_lineNotice暂未开发");
            break;
          case "地址管理":
            NavigatorUtil.goAddressPage(context,"0");
            break;
          case "我的足迹":
            ToastUtils.showToast(context, "$_lineNotice暂未开发");
            break;
          case "反馈":
            ToastUtils.showToast(context, "$_lineNotice暂未开发");
            break;
          case "关于我们":
            NavigatorUtil.goSupportPage(context);

            break;
        }
      },
      child: Row(
        children: [
          Icon(_iconData),
          Expanded(flex: 1, child: Text(_lineNotice)),
        ],
      ),
    ));
  }
}
