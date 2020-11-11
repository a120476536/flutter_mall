import 'package:flutter_mall_self/entity/home_entity.dart';

homeEntityFromJson(HomeEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new HomeData().fromJson(json['data']);
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> homeEntityToJson(HomeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

homeDataFromJson(HomeData data, Map<String, dynamic> json) {
	if (json['newGoodsList'] != null) {
		data.newGoodsList = new List<HomeDataNewGoodsList>();
		(json['newGoodsList'] as List).forEach((v) {
			data.newGoodsList.add(new HomeDataNewGoodsList().fromJson(v));
		});
	}
	if (json['couponList'] != null) {
		data.couponList = new List<HomeDataCouponList>();
		(json['couponList'] as List).forEach((v) {
			data.couponList.add(new HomeDataCouponList().fromJson(v));
		});
	}
	if (json['channel'] != null) {
		data.channel = new List<HomeDataChannel>();
		(json['channel'] as List).forEach((v) {
			data.channel.add(new HomeDataChannel().fromJson(v));
		});
	}
	if (json['grouponList'] != null) {
		data.grouponList = new List<HomeDataGrouponList>();
		(json['grouponList'] as List).forEach((v) {
			data.grouponList.add(new HomeDataGrouponList().fromJson(v));
		});
	}
	if (json['banner'] != null) {
		data.banner = new List<HomeDataBanner>();
		(json['banner'] as List).forEach((v) {
			data.banner.add(new HomeDataBanner().fromJson(v));
		});
	}
	if (json['brandList'] != null) {
		data.brandList = new List<HomeDataBrandList>();
		(json['brandList'] as List).forEach((v) {
			data.brandList.add(new HomeDataBrandList().fromJson(v));
		});
	}
	if (json['hotGoodsList'] != null) {
		data.hotGoodsList = new List<HomeDataHotGoodsList>();
		(json['hotGoodsList'] as List).forEach((v) {
			data.hotGoodsList.add(new HomeDataHotGoodsList().fromJson(v));
		});
	}
	if (json['topicList'] != null) {
		data.topicList = new List<HomeDataTopicList>();
		(json['topicList'] as List).forEach((v) {
			data.topicList.add(new HomeDataTopicList().fromJson(v));
		});
	}
	if (json['floorGoodsList'] != null) {
		data.floorGoodsList = new List<HomeDataFloorGoodsList>();
		(json['floorGoodsList'] as List).forEach((v) {
			data.floorGoodsList.add(new HomeDataFloorGoodsList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeDataToJson(HomeData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.newGoodsList != null) {
		data['newGoodsList'] =  entity.newGoodsList.map((v) => v.toJson()).toList();
	}
	if (entity.couponList != null) {
		data['couponList'] =  entity.couponList.map((v) => v.toJson()).toList();
	}
	if (entity.channel != null) {
		data['channel'] =  entity.channel.map((v) => v.toJson()).toList();
	}
	if (entity.grouponList != null) {
		data['grouponList'] =  entity.grouponList.map((v) => v.toJson()).toList();
	}
	if (entity.banner != null) {
		data['banner'] =  entity.banner.map((v) => v.toJson()).toList();
	}
	if (entity.brandList != null) {
		data['brandList'] =  entity.brandList.map((v) => v.toJson()).toList();
	}
	if (entity.hotGoodsList != null) {
		data['hotGoodsList'] =  entity.hotGoodsList.map((v) => v.toJson()).toList();
	}
	if (entity.topicList != null) {
		data['topicList'] =  entity.topicList.map((v) => v.toJson()).toList();
	}
	if (entity.floorGoodsList != null) {
		data['floorGoodsList'] =  entity.floorGoodsList.map((v) => v.toJson()).toList();
	}
	return data;
}

homeDataNewGoodsListFromJson(HomeDataNewGoodsList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['brief'] != null) {
		data.brief = json['brief']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['isNew'] != null) {
		data.isNew = json['isNew'];
	}
	if (json['isHot'] != null) {
		data.isHot = json['isHot'];
	}
	if (json['counterPrice'] != null) {
		data.counterPrice = json['counterPrice']?.toInt();
	}
	if (json['retailPrice'] != null) {
		data.retailPrice = json['retailPrice']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeDataNewGoodsListToJson(HomeDataNewGoodsList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['brief'] = entity.brief;
	data['picUrl'] = entity.picUrl;
	data['isNew'] = entity.isNew;
	data['isHot'] = entity.isHot;
	data['counterPrice'] = entity.counterPrice;
	data['retailPrice'] = entity.retailPrice;
	return data;
}

homeDataCouponListFromJson(HomeDataCouponList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['tag'] != null) {
		data.tag = json['tag']?.toString();
	}
	if (json['discount'] != null) {
		data.discount = json['discount']?.toInt();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	if (json['days'] != null) {
		data.days = json['days']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeDataCouponListToJson(HomeDataCouponList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['desc'] = entity.desc;
	data['tag'] = entity.tag;
	data['discount'] = entity.discount;
	data['min'] = entity.min;
	data['days'] = entity.days;
	return data;
}

homeDataChannelFromJson(HomeDataChannel data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['iconUrl'] != null) {
		data.iconUrl = json['iconUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> homeDataChannelToJson(HomeDataChannel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['iconUrl'] = entity.iconUrl;
	return data;
}

homeDataGrouponListFromJson(HomeDataGrouponList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['brief'] != null) {
		data.brief = json['brief']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['counterPrice'] != null) {
		data.counterPrice = json['counterPrice']?.toInt();
	}
	if (json['retailPrice'] != null) {
		data.retailPrice = json['retailPrice']?.toInt();
	}
	if (json['grouponPrice'] != null) {
		data.grouponPrice = json['grouponPrice']?.toInt();
	}
	if (json['grouponDiscount'] != null) {
		data.grouponDiscount = json['grouponDiscount']?.toInt();
	}
	if (json['grouponMember'] != null) {
		data.grouponMember = json['grouponMember']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeDataGrouponListToJson(HomeDataGrouponList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['brief'] = entity.brief;
	data['picUrl'] = entity.picUrl;
	data['counterPrice'] = entity.counterPrice;
	data['retailPrice'] = entity.retailPrice;
	data['grouponPrice'] = entity.grouponPrice;
	data['grouponDiscount'] = entity.grouponDiscount;
	data['grouponMember'] = entity.grouponMember;
	return data;
}

homeDataBannerFromJson(HomeDataBanner data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['link'] != null) {
		data.link = json['link']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['position'] != null) {
		data.position = json['position']?.toInt();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['enabled'] != null) {
		data.enabled = json['enabled'];
	}
	if (json['addTime'] != null) {
		data.addTime = json['addTime']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toString();
	}
	if (json['deleted'] != null) {
		data.deleted = json['deleted'];
	}
	return data;
}

Map<String, dynamic> homeDataBannerToJson(HomeDataBanner entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['link'] = entity.link;
	data['url'] = entity.url;
	data['position'] = entity.position;
	data['content'] = entity.content;
	data['enabled'] = entity.enabled;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}

homeDataBrandListFromJson(HomeDataBrandList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['floorPrice'] != null) {
		data.floorPrice = json['floorPrice']?.toDouble();
	}
	return data;
}

Map<String, dynamic> homeDataBrandListToJson(HomeDataBrandList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['desc'] = entity.desc;
	data['picUrl'] = entity.picUrl;
	data['floorPrice'] = entity.floorPrice;
	return data;
}

homeDataHotGoodsListFromJson(HomeDataHotGoodsList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['brief'] != null) {
		data.brief = json['brief']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['isNew'] != null) {
		data.isNew = json['isNew'];
	}
	if (json['isHot'] != null) {
		data.isHot = json['isHot'];
	}
	if (json['counterPrice'] != null) {
		data.counterPrice = json['counterPrice']?.toInt();
	}
	if (json['retailPrice'] != null) {
		data.retailPrice = json['retailPrice']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeDataHotGoodsListToJson(HomeDataHotGoodsList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['brief'] = entity.brief;
	data['picUrl'] = entity.picUrl;
	data['isNew'] = entity.isNew;
	data['isHot'] = entity.isHot;
	data['counterPrice'] = entity.counterPrice;
	data['retailPrice'] = entity.retailPrice;
	return data;
}

homeDataTopicListFromJson(HomeDataTopicList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['subtitle'] != null) {
		data.subtitle = json['subtitle']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['readCount'] != null) {
		data.readCount = json['readCount']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> homeDataTopicListToJson(HomeDataTopicList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['subtitle'] = entity.subtitle;
	data['price'] = entity.price;
	data['readCount'] = entity.readCount;
	data['picUrl'] = entity.picUrl;
	return data;
}

homeDataFloorGoodsListFromJson(HomeDataFloorGoodsList data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['goodsList'] != null) {
		data.goodsList = new List<HomeDataFloorGoodsListGoodsList>();
		(json['goodsList'] as List).forEach((v) {
			data.goodsList.add(new HomeDataFloorGoodsListGoodsList().fromJson(v));
		});
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeDataFloorGoodsListToJson(HomeDataFloorGoodsList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	if (entity.goodsList != null) {
		data['goodsList'] =  entity.goodsList.map((v) => v.toJson()).toList();
	}
	data['id'] = entity.id;
	return data;
}

homeDataFloorGoodsListGoodsListFromJson(HomeDataFloorGoodsListGoodsList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['brief'] != null) {
		data.brief = json['brief']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['isNew'] != null) {
		data.isNew = json['isNew'];
	}
	if (json['isHot'] != null) {
		data.isHot = json['isHot'];
	}
	if (json['counterPrice'] != null) {
		data.counterPrice = json['counterPrice']?.toInt();
	}
	if (json['retailPrice'] != null) {
		data.retailPrice = json['retailPrice']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeDataFloorGoodsListGoodsListToJson(HomeDataFloorGoodsListGoodsList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['brief'] = entity.brief;
	data['picUrl'] = entity.picUrl;
	data['isNew'] = entity.isNew;
	data['isHot'] = entity.isHot;
	data['counterPrice'] = entity.counterPrice;
	data['retailPrice'] = entity.retailPrice;
	return data;
}