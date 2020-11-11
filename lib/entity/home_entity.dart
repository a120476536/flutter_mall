import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class HomeEntity with JsonConvert<HomeEntity> {
	int errno;
	HomeData data;
	String errmsg;

	@override
  String toString() {
    return 'HomeEntity{errno: $errno, data: $data, errmsg: $errmsg}';
  }
}

class HomeData with JsonConvert<HomeData> {
	List<HomeDataNewGoodsList> newGoodsList;
	List<HomeDataCouponList> couponList;
	List<HomeDataChannel> channel;
	List<HomeDataGrouponList> grouponList;
	List<HomeDataBanner> banner;
	List<HomeDataBrandList> brandList;
	List<HomeDataHotGoodsList> hotGoodsList;
	List<HomeDataTopicList> topicList;
	List<HomeDataFloorGoodsList> floorGoodsList;

	@override
  String toString() {
    return 'HomeData{newGoodsList: $newGoodsList, couponList: $couponList, channel: $channel, grouponList: $grouponList, banner: $banner, brandList: $brandList, hotGoodsList: $hotGoodsList, topicList: $topicList, floorGoodsList: $floorGoodsList}';
  }
}

class HomeDataNewGoodsList with JsonConvert<HomeDataNewGoodsList> {
	int id;
	String name;
	String brief;
	String picUrl;
	bool isNew;
	bool isHot;
	int counterPrice;
	int retailPrice;

	@override
  String toString() {
    return 'HomeDataNewGoodsList{id: $id, name: $name, brief: $brief, picUrl: $picUrl, isNew: $isNew, isHot: $isHot, counterPrice: $counterPrice, retailPrice: $retailPrice}';
  }
}

class HomeDataCouponList with JsonConvert<HomeDataCouponList> {
	int id;
	String name;
	String desc;
	String tag;
	int discount;
	int min;
	int days;

	@override
  String toString() {
    return 'HomeDataCouponList{id: $id, name: $name, desc: $desc, tag: $tag, discount: $discount, min: $min, days: $days}';
  }
}

class HomeDataChannel with JsonConvert<HomeDataChannel> {
	int id;
	String name;
	String iconUrl;

	@override
  String toString() {
    return 'HomeDataChannel{id: $id, name: $name, iconUrl: $iconUrl}';
  }
}

class HomeDataGrouponList with JsonConvert<HomeDataGrouponList> {
	int id;
	String name;
	String brief;
	String picUrl;
	int counterPrice;
	int retailPrice;
	int grouponPrice;
	int grouponDiscount;
	int grouponMember;

	@override
  String toString() {
    return 'HomeDataGrouponList{id: $id, name: $name, brief: $brief, picUrl: $picUrl, counterPrice: $counterPrice, retailPrice: $retailPrice, grouponPrice: $grouponPrice, grouponDiscount: $grouponDiscount, grouponMember: $grouponMember}';
  }
}

class HomeDataBanner with JsonConvert<HomeDataBanner> {
	int id;
	String name;
	String link;
	String url;
	int position;
	String content;
	bool enabled;
	String addTime;
	String updateTime;
	bool deleted;

	@override
  String toString() {
    return 'HomeDataBanner{id: $id, name: $name, link: $link, url: $url, position: $position, content: $content, enabled: $enabled, addTime: $addTime, updateTime: $updateTime, deleted: $deleted}';
  }
}

class HomeDataBrandList with JsonConvert<HomeDataBrandList> {
	int id;
	String name;
	String desc;
	String picUrl;
	double floorPrice;

	@override
  String toString() {
    return 'HomeDataBrandList{id: $id, name: $name, desc: $desc, picUrl: $picUrl, floorPrice: $floorPrice}';
  }
}

class HomeDataHotGoodsList with JsonConvert<HomeDataHotGoodsList> {
	int id;
	String name;
	String brief;
	String picUrl;
	bool isNew;
	bool isHot;
	int counterPrice;
	int retailPrice;

	@override
  String toString() {
    return 'HomeDataHotGoodsList{id: $id, name: $name, brief: $brief, picUrl: $picUrl, isNew: $isNew, isHot: $isHot, counterPrice: $counterPrice, retailPrice: $retailPrice}';
  }
}

class HomeDataTopicList with JsonConvert<HomeDataTopicList> {
	int id;
	String title;
	String subtitle;
	double price;
	String readCount;
	String picUrl;

	@override
  String toString() {
    return 'HomeDataTopicList{id: $id, title: $title, subtitle: $subtitle, price: $price, readCount: $readCount, picUrl: $picUrl}';
  }
}

class HomeDataFloorGoodsList with JsonConvert<HomeDataFloorGoodsList> {
	String name;
	List<HomeDataFloorGoodsListGoodsList> goodsList;
	int id;

	@override
  String toString() {
    return 'HomeDataFloorGoodsList{name: $name, goodsList: $goodsList, id: $id}';
  }
}

class HomeDataFloorGoodsListGoodsList with JsonConvert<HomeDataFloorGoodsListGoodsList> {
	int id;
	String name;
	String brief;
	String picUrl;
	bool isNew;
	bool isHot;
	int counterPrice;
	int retailPrice;

	@override
  String toString() {
    return 'HomeDataFloorGoodsListGoodsList{id: $id, name: $name, brief: $brief, picUrl: $picUrl, isNew: $isNew, isHot: $isHot, counterPrice: $counterPrice, retailPrice: $retailPrice}';
  }
}
