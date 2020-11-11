import 'package:flutter/material.dart';
import 'package:flutter_mall_self/entity/home_entity.dart'
    show HomeDataNewGoodsList, HomeDataHotGoodsList, HomeDataTopicList;
import 'package:flutter_mall_self/page/goods/good_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cached_image.dart';

class ProductView extends StatelessWidget {
  var type = 0; //0 goodListHot  1 goodListnew 2 goodListTop
  List<HomeDataNewGoodsList> goodListnew = List();
  List<HomeDataHotGoodsList> goodListHot = List();
  List<HomeDataTopicList> goodListTop = List();

  ProductView(this.type, this.goodListnew, this.goodListHot, this.goodListTop);

  @override
  Widget build(BuildContext context) {
    if (type == 0) {
      return type0();
    } else if (type == 1) {
      return type1();
    } else if (type == 2) {
      return type2();
    }
    // return _setWidget();
  }

  Container type2() {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: goodListTop.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.90),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return GoodDetail(goodListTop[index].id.toString());
                },),);
              },
              child: Card(
                elevation: 2.0,
                margin: EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(5.0),
                        child: CachedImageView(
                            ScreenUtil.instance.setHeight(200.0),
                            ScreenUtil.instance.setHeight(200.0),
                            goodListTop[index].picUrl)),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4.0, top: 4.0),
                      alignment: Alignment.centerLeft,
                      child: Center(
                        child: Text(
                          goodListTop[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4.0, top: 4.0),
                      alignment: Alignment.center,
                      child: Text(
                        "￥${goodListTop[index].price}",
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container type1() {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: goodListnew.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.90),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return GoodDetail(goodListnew[index].id.toString());
                },),);
              },
              child: Card(
                elevation: 2.0,
                margin: EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(5.0),
                        child: CachedImageView(
                            ScreenUtil.instance.setHeight(200.0),
                            ScreenUtil.instance.setHeight(200.0),
                            goodListnew[index].picUrl)),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4.0, top: 4.0),
                      alignment: Alignment.centerLeft,
                      child: Center(
                        child: Text(
                          goodListnew[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4.0, top: 4.0),
                      alignment: Alignment.center,
                      child: Text(
                        "￥${goodListnew[index].retailPrice}",
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container type0() {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: goodListHot.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.90),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return GoodDetail(goodListHot[index].id.toString());
                },),);
              },
              child: Card(
                elevation: 2.0,
                margin: EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(5.0),
                        child: CachedImageView(
                            ScreenUtil.instance.setHeight(200.0),
                            ScreenUtil.instance.setHeight(200.0),
                            goodListHot[index].picUrl)),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4.0, top: 4.0),
                      alignment: Alignment.centerLeft,
                      child: Center(
                        child: Text(
                          goodListHot[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4.0, top: 4.0),
                      alignment: Alignment.center,
                      child: Text(
                        "￥${goodListHot[index].retailPrice}",
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
