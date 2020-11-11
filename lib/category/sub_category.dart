import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/entity/category_entity.dart';
import 'package:flutter_mall_self/entity/categorydata_entity.dart';
import 'package:flutter_mall_self/utils/http_manager.dart';
import 'package:flutter_mall_self/widget/empty_view.dart';
import 'package:flutter_mall_self/widget/gridview_content.dart';
import 'package:flutter_mall_self/widget/loading_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategory extends StatefulWidget {
  var id = "0";
  var title = "分类";

  @override
  _SubCategoryState createState() => _SubCategoryState();

  SubCategory(this.id, this.title);
}

class _SubCategoryState extends State<SubCategory> {
  var id = "0";
  var title = "分类";
  var _selectIndex = 0;
  var _page = 1;
  var _limit = 100;
  CategoryEntity _entity;
  CategorydataEntity _entityList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id; //通过widget可以拿到当前widget上所有数据
    title = widget.title;
    _queryCategory();
  }

  void _queryCategory() async {
    HttpManager.getInstance()
        .get(Api.BASE_URL + Api.CATEGORY_LIST + "?id=$id")
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    _entity = CategoryEntity().fromJson(json.decode(value));
                    _queryCategorylist(_entity.data.brotherCategory[0].id);
                  })
                }
            });
  }

  void _queryCategorylist(var currentId) async {
    HttpManager.getInstance()
        .get(Api.BASE_URL +
            Api.GOODS_LIST_URL +
            "?categoryId=$currentId&page=$_page&limit=$_limit")
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    _entityList =
                        CategorydataEntity().fromJson(json.decode(value));
                    print("==-->${_entityList.data.xList}");
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      body: _entity == null
          ? LoadingDialog()
          : Column(
              children: [
                Container(
                  height: ScreenUtil.instance.setHeight(85.0),
                  child: ListView.builder(
                    reverse: false,//这个反向排序
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: _entity.data.brotherCategory.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectIndex = index;
                                _queryCategorylist(_entity.data.brotherCategory[_selectIndex].id);
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 80.0,
                              height: ScreenUtil.instance.setHeight(80.0),
                              color: Colors.blue,
                              child: Text(
                                _entity.data.brotherCategory[index].name,
                                style: TextStyle(
                                  color: _selectIndex == index
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          _selectIndex == index
                              ? Container(
                                  width: 80.0,
                                  height: ScreenUtil.instance.setHeight(2.0),
                                  color: Colors.red,
                                )
                              : Container(
                                  width: 80.0,
                                  height: ScreenUtil.instance.setHeight(2.0),
                                  color: Colors.blue,
                                )
                        ],
                      );
                    },
                  ),
                ),

                // flutter Vertical viewport was given unbounded height // 异常出现可以使用 Expanded 包裹
                _entityList == null||_entityList.data.xList.length==0
                    ? EmptyView()
                    : Expanded(
                        child: GridviewContent(_entityList.data.xList),/*GridView.builder()*/
                      ),
              ],
            ),
    );
  }
}
