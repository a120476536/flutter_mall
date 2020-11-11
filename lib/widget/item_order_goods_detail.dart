import 'package:flutter/material.dart';
import 'package:flutter_mall_self/widget/cached_image.dart';

class ItemOrderGoodsDetail extends StatelessWidget {
  var imgUrl;
  var goodName;
  var goodType;
  var goodPrice;
  var goodNums;

  ItemOrderGoodsDetail(
      this.imgUrl, this.goodName, this.goodType, this.goodPrice, this.goodNums);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              CachedImageView(50.0, 50.0, imgUrl),
              Expanded(
                flex: 1,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(goodName),
                    Text(goodType),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            '无忧购',
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            '七天无理由退换',
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("￥$goodPrice"),
                    Text("X$goodNums"),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 10.0),
          child: Divider(color: Colors.grey,height: 1.0,),
        ),
      ],
    );
  }
}
