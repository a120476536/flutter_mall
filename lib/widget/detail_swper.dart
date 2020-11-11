import 'package:flutter/material.dart';
import 'package:flutter_mall_self/constant/strings.dart';
import 'package:flutter_mall_self/entity/good_detail_entity.dart'
    show GoodDetailDataInfo;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'cached_image.dart';

// ignore: must_be_immutable
class DetailSwiper extends StatelessWidget {
  GoodDetailDataInfo _info;
  double _viewheight = 300;
  DetailSwiper(this._info,this._viewheight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _viewheight,
      child: _info==null||_info.gallery == null || _info.gallery.length == 0
          ? Container(
              height: ScreenUtil.instance.setHeight(_viewheight),
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text(Strings.NO_DATA_TEXT),
            )
          : Swiper(
              itemCount: _info.gallery.length,
              scrollDirection: Axis.horizontal,
              loop: true,
              index: 0,
              autoplay: true,
              duration: 1000,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                    size: 8.0,
                    color: Colors.white,
                    activeColor: Colors.deepOrangeAccent),
              ),
              itemBuilder: (BuildContext context, int index) {
                return CachedImageView(
                    double.infinity, double.infinity, _info.gallery[index]);
              },
            ),
    );
  }
}
