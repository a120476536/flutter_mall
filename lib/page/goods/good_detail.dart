import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/constant/strings.dart';
import 'package:flutter_mall_self/entity/add_cart_entity.dart';
import 'package:flutter_mall_self/entity/good_detail_entity.dart';
import 'package:flutter_mall_self/page/home/mall.dart';
import 'package:flutter_mall_self/page/login/login_view.dart';
import 'package:flutter_mall_self/utils/SharePreferenceUtils.dart';
import 'package:flutter_mall_self/utils/event_bus.dart';
import 'package:flutter_mall_self/utils/http_manager.dart';
import 'package:flutter_mall_self/utils/http_util.dart';
import 'package:flutter_mall_self/utils/navigator_util.dart';
import 'package:flutter_mall_self/utils/toast_utils.dart';
import 'package:flutter_mall_self/widget/cached_image.dart';
import 'package:flutter_mall_self/widget/cartnumber_view.dart';
import 'package:flutter_mall_self/widget/detail_swper.dart';
import 'package:flutter_mall_self/widget/empty_view.dart';
import 'package:flutter_mall_self/widget/loading_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class GoodDetail extends StatefulWidget {
  var id = "0";

  GoodDetail(this.id);

  @override
  _GoodDetailState createState() => _GoodDetailState();
}

class _GoodDetailState extends State<GoodDetail> {
  GoodDetailEntity _entity;
  var isLoading = true;
  var id = "0";
  var _chooseModel = "";
  var _specificationIndex = 0;
  var _chooseNum = 1;
  var parameters;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id;
    print("商品id$id");
    _getGoodDetail();
  }

  void _getGoodDetail() {
    isLoading = true;
    HttpManager.getInstance()
        .get(Api.BASE_URL + Api.GOODS_DETAILS_URL + "?id=$id")
        .then((value) => {
              setState(() {
                isLoading = false;
              }),
              if (value != null)
                {
                  setState(() {
                    _entity = GoodDetailEntity().fromJson(json.decode(value));
                    if (_entity.errno != 0) {
                      Toast.show(_entity.errmsg, context);
                    }
                  })
                }
            });
  }

  void _addCart() async{
    parameters = {
      "goodsId": _entity.data.info.id,
      "productId": _entity.data.specificationList[_specificationIndex].valueList[0].id,
      "number": _chooseNum
    };
    var response = await HttpUtil.instance.post(Api.BASE_URL+Api.ADD_CART, parameters: parameters);
    AddCartEntity _addCart = AddCartEntity().fromJson(json.decode(response.toString()));
    if(_addCart.errno==0){
      Toast.show("添加购物车成功", context);
      eventBus.fire(OnlyTypeEvent(0));
    }else{
      Toast.show(_addCart.errmsg, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          InkWell(
            onTap: () {
              Share.share("${_entity.data.info.name} \n ${_entity.data.info.picUrl} ");
            },
            child: IconButton(
              icon: Icon(Icons.share),
            ),
          ),
        ],
      ),
      body: isLoading
          ? LoadingDialog()
          : _entity == null || _entity.errno != 0
              ? EmptyView()
              : _buildSizedBox(),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  SizedBox _buildSizedBox() {
    return SizedBox(
      child: ListView(
        shrinkWrap: false,
        children: [
          DetailSwiper(_entity.data.info, 280.0),
          Divider(
            height: 2.0,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _entity.data.info.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  _entity.data.info.brief,
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
                _rowPrice(),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                _entity.data.attribute == null ||
                        _entity.data.attribute.length == 0
                    ? Divider()
                    : _goodAttribute(),
                _attributeView(),
                Html(data: _entity.data.info.detail),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '常见问题',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0,
                        color: Colors.black),
                  ),
                ),
                _bottomQuestion(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _rowPrice() {
    return Row(
      children: [
        Text(
          "原价:${_entity.data.info.counterPrice}元",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.grey),
        ),
        Container(
          width: 10.0,
        ),
        Text(
          "现价:${_entity.data.info.retailPrice}元",
          style: TextStyle(
            color: Colors.red,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }

  Container _goodAttribute() {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              '商品参数',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
        ],
      ),
    );
  }

  /// 注意 showModalBottomSheet 里边涉及到数据刷新的 直接setState是不生效的，样例是这样
  List<Widget> _checkModel(StateSetter setBottomSheetState) {
    List<Widget> allModel = List();
    for (int i = 0;
        i < _entity.data.productList[0].specifications.length;
        i++) {
      allModel.add(Container(
        child: InkWell(
          onTap: () {
            setBottomSheetState(() {
              _specificationIndex = i;
              _entity.data.chooseIndex = _specificationIndex;
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: 3.0),
            child: Chip(
              label: Text(
                _entity.data.productList[0].specifications[i],
                style: TextStyle(
                    color:
                        i == _specificationIndex ? Colors.white : Colors.white),
              ),
              backgroundColor: i == _specificationIndex
                  ? Colors.deepOrangeAccent
                  : Colors.grey,
            ),
          ),
        ),
      ));
    }
    return allModel;
  }

  void _openBottom(bool isCart, BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setBottomSheetState) {
              return SizedBox(
                height: ScreenUtil.instance.setHeight(600),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          CachedImageView(50.0, 50.0, _entity.data.info.picUrl),
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("价格：${_entity.data.info.retailPrice}"),
                                _chooseModel == null
                                    ? Text("已选择：暂无")
                                    : Text("已选择：$_chooseModel"),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context); //弹窗消失
                              },
                              child: Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, top: 10.0),
                      width: double.infinity,
                      child: Text('规格'),
                    ),
                    Container(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: _checkModel(setBottomSheetState),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, top: 20.0),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      child: Text('数量'),
                    ),
                    CartNumberView(setBottomSheetState, (number) {
                      _chooseNum = number;
                      _entity.data.chooseNum = _chooseNum;
                      print('选择加减购买数量：$number');
                    }),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            SharePreference.getShareData(Strings.TOKEN)
                                .then((value) => {
                                      print("_entity.chooseNum=${_entity.data.chooseNum}"),
                                      print("_entity.chooseIndex=${_entity.data.chooseIndex}"),
                                      if (value != null)
                                        {isCart?_addCart():NavigatorUtil.goOrderDetailPage(context,"0-$_chooseNum-$_specificationIndex",json.encode(_entity))}
                                      else
                                        {
                                          // ToastUtils.showToast(context, "尚未登录,去登陆"),//开放当前toast会提示找不到context
                                          NavigatorUtil.goLoginPage(context),
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (_) {
                                          //       return LoginView();
                                          //     },
                                          //   ),
                                          // ),

                                          // NavigatorUtil.goLoginPage(context),
                                        }
                                    });
                          },
                          child: Container(
                            height: 40.0,
                            width: double.maxFinite,
                            decoration: BoxDecoration(color: Colors.deepOrangeAccent),
                            child: Center(
                              child: isCart
                                  ? Text(
                                      '加入购物车',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : Text(
                                      '立即购买',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                // width: 50.0,
                // height: 50.0,
                child: InkWell(
                  onTap: () {
                    Toast.show('点击收藏', context);
                  },
                  child: Icon(Icons.star_border),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // width: 50.0,
                // height: 50.0,
                child: InkWell(
                  onTap: () {
                    // Toast.show('点击购物车', context);
                    // _openBottom(context);
                    // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_){
                    //   return MallPage();
                    // }),(route) => false);
                    NavigatorUtil.goMallPage(context);
                    eventBus.fire(NotiEvent(2));
                  },
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Container(
              height: 50.0,
              width: 280.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Expanded  flex  则内部自动填充
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        _openBottom(true, context);
                      },
                      child: Container(
                        // width: 140.0,
                        // height: 50.0,
                        alignment: Alignment.center,
                        color: Colors.deepOrangeAccent,
                        child: Text(
                          '加入购物车',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        // Toast.show('立即购买', context);
                        _openBottom(false, context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.deepOrange,
                        child: Text(
                          '立即购买',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _bottomQuestion() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: _entity.data.issue.length,
      itemBuilder: (BuildContext context, int index) {
        return _bottomQuestionItem(index);
      },
    );
  }

  Container _bottomQuestionItem(int index) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_entity.data.issue[index].question),
          Text(
            _entity.data.issue[index].answer,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  SizedBox _attributeView() {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _entity.data.attribute.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _attributeItemView(index, context);
        },
      ),
    );
  }

  Container _attributeItemView(int index, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.0),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            width: 80.0,
            child: Text(_entity.data.attribute[index].attribute),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 130.0,
            child: Text(_entity.data.attribute[index].value),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
          ),
        ],
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
