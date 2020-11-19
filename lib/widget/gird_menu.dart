import 'package:flutter/material.dart';
import 'package:flutter_mall_self/category/sub_category.dart';
import 'package:flutter_mall_self/entity/home_entity.dart' show HomeDataChannel;
import 'package:flutter_mall_self/utils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cached_image.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class GridMenu extends StatelessWidget {
  List<HomeDataChannel> categoryList;

  GridMenu(this.categoryList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoryList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //单个子Widget的水平最大宽度
          crossAxisCount: 5,
          //水平单个子Widget之间间距
          mainAxisSpacing: ScreenUtil.instance.setWidth(20.0),
          //垂直单个子Widget之间间距
          crossAxisSpacing: ScreenUtil.instance.setWidth(20.0),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: InkWell(
              onTap: (){
                NavigatorUtil.goSubcategoryPage(context, categoryList[index].id.toString(), categoryList[index].name);
              },
              child: Column(
                children: [
                  CachedImageView(
                      ScreenUtil.instance.setWidth(60.0),
                      ScreenUtil.instance.setWidth(60.0),
                      categoryList[index].iconUrl),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(10.0)),
                  ),
                  Text(
                    categoryList[index].name,
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(26.0),
                        color: Colors.black87),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
