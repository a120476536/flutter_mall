import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/entity/left_category_entity.dart';
import 'package:flutter_mall_self/entity/right_content_entity.dart';
import 'package:flutter_mall_self/utils/http_util.dart';
import 'package:flutter_mall_self/utils/navigator_util.dart';
import 'package:flutter_mall_self/widget/cached_image.dart';
import 'package:flutter_mall_self/widget/empty_view.dart';

class ClassificationPage extends StatefulWidget {
  @override
  _ClassificationPageState createState() => _ClassificationPageState();
}

class _ClassificationPageState extends State<ClassificationPage> {
  LeftCategoryEntity _leftCategoryEntity;
  RightContentEntity _rightContentEntity;
  var _clickIndex = 0;
  var _topImg = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLeftCategory();
  }

  void _getRightContent(int id) {
    var params = {"id": id};
    HttpUtil.instance
        .get(Api.BASE_URL + Api.HOME_SECOND_CATEGORY, parameters: params)
        .then((value) => {
              print("右侧内容$value"),
              if (value != null)
                {
                  setState(() {
                    _rightContentEntity = RightContentEntity().fromJson(json.decode(value.toString()));
                  }),
                }
            });
  }

  void _getLeftCategory() {
    HttpUtil.instance
        .get(Api.BASE_URL + Api.HOME_FIRST_CATEGORY)
        .then((value) => {
              print("左侧导航$value"),
              if (value != null)
                {
                  setState(() {
                    _leftCategoryEntity = LeftCategoryEntity().fromJson(json.decode(value.toString()));
                    if(_leftCategoryEntity!=null){
                      _getRightContent(_leftCategoryEntity.data[0].id);
                      _topImg = _leftCategoryEntity.data[_clickIndex].picUrl;
                    }
                  },),
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商城'),
        centerTitle: true,
      ),
      body: _leftCategoryEntity == null
          ? EmptyView()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _leftCategoryEntity.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              _clickIndex = index;
                              _topImg = _leftCategoryEntity.data[_clickIndex].picUrl;
                              _getRightContent(_leftCategoryEntity.data[_clickIndex].id);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(color: _clickIndex==index?Colors.redAccent:Colors.white,border: Border.all(width: 1.0,color: Colors.white)),
                            height: 80.0,
                            alignment: Alignment.center,
                            child: Text(_leftCategoryEntity.data[index].name,style: TextStyle(color:_clickIndex==index?Colors.white:Colors.black,decoration: TextDecoration.underline,fontSize: 20.0),),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Container(margin: EdgeInsets.all(10.0),decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0),),),child: CachedImageView(double.maxFinite, 200.0, _topImg)),
                      Expanded(
                        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //横轴元素个数
                            crossAxisCount: 3,
                            //纵轴间距
                            mainAxisSpacing: 20.0,
                            //横轴间距
                            crossAxisSpacing: 10.0,
                            //子组件宽高长度比例
                            childAspectRatio: 1.0),itemCount: _rightContentEntity.data.length,itemBuilder: (BuildContext context,int index){
                          return InkWell(
                            onTap: (){
                              NavigatorUtil.goSubcategoryPage(context, _rightContentEntity.data[index].id.toString(),_rightContentEntity.data[index].name);
                            },
                            child: Column(
                                children: [
                                  CachedImageView(50.0, 50.0, _rightContentEntity.data[index].picUrl),
                                  Text(_rightContentEntity.data[index].name),
                                ],
                              ),
                          );
                          },),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
