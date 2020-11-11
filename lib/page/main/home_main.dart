import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/entity/home_entity.dart';
import 'package:flutter_mall_self/utils/http_manager.dart';
import 'package:flutter_mall_self/utils/toast_utils.dart';
import 'package:flutter_mall_self/widget/gird_menu.dart';
import 'package:flutter_mall_self/widget/loading_dialog.dart';
import 'package:flutter_mall_self/widget/product_view.dart';
import 'package:flutter_mall_self/widget/swiper_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  HomeEntity _entity;
  EasyRefreshController _controller = EasyRefreshController();

  void _queryHomeData() async {
    HttpManager.getInstance().get(Api.BASE_URL + Api.HOME_URL).then((value) => {
          _controller.finishRefresh(),
          if (value != null)
            {
              setState(() {
                _entity = HomeEntity().fromJson(json.decode(value));
              })
            }
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _queryHomeData();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('商城首页'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              ToastUtils.showToast(context, "暂未实现");
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: _contentWidget(),
    );
  }

  Widget _contentWidget() {
    return _entity == null
        ? LoadingDialog()
        : Container(
            child: EasyRefresh(
              onRefresh: () async {
                _queryHomeData();
                _controller.finishRefresh();
              },
              header: BezierCircleHeader(backgroundColor: Colors.deepOrange),
              footer: BezierBounceFooter(backgroundColor: Colors.deepOrange),
              enableControlFinishRefresh: true,
              enableControlFinishLoad: false,
              controller: _controller,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SwiperView(
                      _entity.data.banner,
                      _entity.data.banner.length,
                      ScreenUtil.instance.setHeight(360.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    GridMenu(_entity.data.channel),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Center(
                      child: Text('热门'),
                    ),
                    ProductView(1, _entity.data.newGoodsList,
                        _entity.data.hotGoodsList, _entity.data.topicList),
                    Center(
                      child: Text('新品'),
                    ),
                    ProductView(1, _entity.data.newGoodsList,
                        _entity.data.hotGoodsList, _entity.data.topicList),
                    Center(
                      child: Text('推荐'),
                    ),
                    ProductView(2, _entity.data.newGoodsList,
                        _entity.data.hotGoodsList, _entity.data.topicList),
                  ],
                ),
              ),
            ),
          );
  }
}
