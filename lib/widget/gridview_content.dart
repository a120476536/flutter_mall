import 'package:flutter/material.dart';
import 'package:flutter_mall_self/entity/categorydata_entity.dart';
import 'package:flutter_mall_self/page/goods/good_detail.dart';
import 'package:flutter_mall_self/utils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cached_image.dart';

class GridviewContent extends StatelessWidget {
  List<CategorydataDataList> xList;
  GridviewContent(this.xList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: xList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //单个子Widget的水平最大宽度
          crossAxisCount: 2,
          //水平单个子Widget之间间距
          mainAxisSpacing: ScreenUtil.instance.setWidth(20.0),
          //垂直单个子Widget之间间距
          crossAxisSpacing: ScreenUtil.instance.setWidth(20.0),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: InkWell(
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (_){
                //   return GoodDetail(xList[index].id);
                // },),);
                NavigatorUtil.goGoodsDetails(context, xList[index].id.toString());
              },
              child: Column(
                children: [
                  CachedImageView(
                      ScreenUtil.instance.setWidth(200.0),
                      ScreenUtil.instance.setWidth(200.0),
                      xList[index].picUrl),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(10.0)),
                  ),
                  Text(
                    xList[index].name,
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(26.0),
                        color: Colors.black87),
                  ),
                  Text(
                    xList[index].counterPrice.toString(),
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(26.0),
                        color: Colors.red),
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
