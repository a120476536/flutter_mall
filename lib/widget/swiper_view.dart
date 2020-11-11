import 'package:flutter/material.dart';
import 'package:flutter_mall_self/constant/strings.dart';
import 'package:flutter_mall_self/entity/home_entity.dart' show HomeDataBanner;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'cached_image.dart';

class SwiperView extends StatelessWidget {
  List<HomeDataBanner> bannerData = new List();
  int size;
  double viewHeight;

  SwiperView(this.bannerData, this.size, this.viewHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: viewHeight,
      width: double.infinity,
      child: bannerData == null || bannerData.length == 0
          ? Container(
              height: ScreenUtil.instance.setHeight(400.0),
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text(Strings.NO_DATA_TEXT),
            )
          : Swiper(
              itemCount: bannerData.length,
              scrollDirection: Axis.horizontal,
              loop: true,
              index: 0,
              autoplay: false,
              itemBuilder: (BuildContext context, int index) {
                return CachedImageView(
                    double.infinity, double.infinity, bannerData[index].url);
              },
              duration: 1000,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                    size: 8.0,
                    color: Colors.white,
                    activeColor: Colors.deepOrangeAccent),
              ),
            ),
    );
  }
}
