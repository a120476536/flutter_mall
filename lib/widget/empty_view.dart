import 'package:flutter/material.dart';
import 'package:flutter_mall_self/constant/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height-200,
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/no_data.png",
              height: ScreenUtil.instance.setWidth(120.0),
              width: ScreenUtil.instance.setWidth(120.0),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil.instance.setHeight(20.0)),
            ),
            Text(
              Strings.NO_DATA_TEXT,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(28.0),
                  color: Colors.deepOrangeAccent),
            )
          ],
        ),
      ),
    );
  }
}
