import 'package:flutter/material.dart';
import 'package:flutter_bmfbase/BaiduMap/bmfmap_base.dart';
import 'package:flutter_bmfmap/BaiduMap/bmfmap_map.dart';

/// State 基类
class BMFBaseMapState<T extends StatefulWidget> extends State<T> {
  BMFMapController myMapController;

  Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(),
    );
  }

  /// 创建完成回调
  void onBMFMapCreated(BMFMapController controller) {
    myMapController = controller;

    /// 地图加载回调
    myMapController?.setMapDidLoadCallback(callback: () {
      print('mapDidLoad-地图加载完成');
    });
  }

  /// 设置地图参数
  BMFMapOptions initMapOptions() {
    BMFMapOptions mapOptions = BMFMapOptions(
        center: BMFCoordinate(39.917215, 116.380341),
        zoomLevel: 12,
        mapPadding: BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0));
    return mapOptions;
  }

  /// 创建地图
  Container generateMap() {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      child: BMFMapWidget(
        onBMFMapCreated: (controller) {
          onBMFMapCreated(controller);
        },
        mapOptions: initMapOptions(),
      ),
    );
  }

  /// 创建控制栏
  Widget generateControlBar() {
    throw UnimplementedError();
  }
}
