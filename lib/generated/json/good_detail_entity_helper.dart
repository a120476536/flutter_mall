import 'package:flutter_mall_self/entity/good_detail_entity.dart';

goodDetailEntityFromJson(GoodDetailEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new GoodDetailData().fromJson(json['data']);
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> goodDetailEntityToJson(GoodDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

goodDetailDataFromJson(GoodDetailData data, Map<String, dynamic> json) {
	if (json['specificationList'] != null) {
		data.specificationList = new List<GoodDetailDataSpecificationList>();
		(json['specificationList'] as List).forEach((v) {
			data.specificationList.add(new GoodDetailDataSpecificationList().fromJson(v));
		});
	}
	if (json['groupon'] != null) {
		data.groupon = new List<dynamic>();
		data.groupon.addAll(json['groupon']);
	}
	if (json['issue'] != null) {
		data.issue = new List<GoodDetailDataIssue>();
		(json['issue'] as List).forEach((v) {
			data.issue.add(new GoodDetailDataIssue().fromJson(v));
		});
	}
	if (json['userHasCollect'] != null) {
		data.userHasCollect = json['userHasCollect']?.toInt();
	}
	if (json['shareImage'] != null) {
		data.shareImage = json['shareImage']?.toString();
	}
	if (json['comment'] != null) {
		data.comment = new GoodDetailDataComment().fromJson(json['comment']);
	}
	if (json['share'] != null) {
		data.share = json['share'];
	}
	if (json['attribute'] != null) {
		data.attribute = new List<GoodDetailDataAttribute>();
		(json['attribute'] as List).forEach((v) {
			data.attribute.add(new GoodDetailDataAttribute().fromJson(v));
		});
	}
	if (json['brand'] != null) {
		data.brand = new GoodDetailDataBrand().fromJson(json['brand']);
	}
	if (json['productList'] != null) {
		data.productList = new List<GoodDetailDataProductList>();
		(json['productList'] as List).forEach((v) {
			data.productList.add(new GoodDetailDataProductList().fromJson(v));
		});
	}
	if (json['info'] != null) {
		data.info = new GoodDetailDataInfo().fromJson(json['info']);
	}
	if (json['chooseNum'] != null) {
		data.chooseNum = json['chooseNum']?.toInt();
	}
	if (json['chooseIndex'] != null) {
		data.chooseIndex = json['chooseIndex']?.toInt();
	}
	return data;
}

Map<String, dynamic> goodDetailDataToJson(GoodDetailData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.specificationList != null) {
		data['specificationList'] =  entity.specificationList.map((v) => v.toJson()).toList();
	}
	if (entity.groupon != null) {
		data['groupon'] =  [];
	}
	if (entity.issue != null) {
		data['issue'] =  entity.issue.map((v) => v.toJson()).toList();
	}
	data['userHasCollect'] = entity.userHasCollect;
	data['shareImage'] = entity.shareImage;
	if (entity.comment != null) {
		data['comment'] = entity.comment.toJson();
	}
	data['share'] = entity.share;
	if (entity.attribute != null) {
		data['attribute'] =  entity.attribute.map((v) => v.toJson()).toList();
	}
	if (entity.brand != null) {
		data['brand'] = entity.brand.toJson();
	}
	if (entity.productList != null) {
		data['productList'] =  entity.productList.map((v) => v.toJson()).toList();
	}
	if (entity.info != null) {
		data['info'] = entity.info.toJson();
	}
	data['chooseNum'] = entity.chooseNum;
	data['chooseIndex'] = entity.chooseIndex;
	return data;
}

goodDetailDataSpecificationListFromJson(GoodDetailDataSpecificationList data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['valueList'] != null) {
		data.valueList = new List<GoodDetailDataSpecificationListValueList>();
		(json['valueList'] as List).forEach((v) {
			data.valueList.add(new GoodDetailDataSpecificationListValueList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> goodDetailDataSpecificationListToJson(GoodDetailDataSpecificationList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	if (entity.valueList != null) {
		data['valueList'] =  entity.valueList.map((v) => v.toJson()).toList();
	}
	return data;
}

goodDetailDataSpecificationListValueListFromJson(GoodDetailDataSpecificationListValueList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toInt();
	}
	if (json['specification'] != null) {
		data.specification = json['specification']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
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

Map<String, dynamic> goodDetailDataSpecificationListValueListToJson(GoodDetailDataSpecificationListValueList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['goodsId'] = entity.goodsId;
	data['specification'] = entity.specification;
	data['value'] = entity.value;
	data['picUrl'] = entity.picUrl;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}

goodDetailDataIssueFromJson(GoodDetailDataIssue data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['question'] != null) {
		data.question = json['question']?.toString();
	}
	if (json['answer'] != null) {
		data.answer = json['answer']?.toString();
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

Map<String, dynamic> goodDetailDataIssueToJson(GoodDetailDataIssue entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['question'] = entity.question;
	data['answer'] = entity.answer;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}

goodDetailDataCommentFromJson(GoodDetailDataComment data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new List<dynamic>();
		data.data.addAll(json['data']);
	}
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	return data;
}

Map<String, dynamic> goodDetailDataCommentToJson(GoodDetailDataComment entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] =  [];
	}
	data['count'] = entity.count;
	return data;
}

goodDetailDataAttributeFromJson(GoodDetailDataAttribute data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toInt();
	}
	if (json['attribute'] != null) {
		data.attribute = json['attribute']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
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

Map<String, dynamic> goodDetailDataAttributeToJson(GoodDetailDataAttribute entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['goodsId'] = entity.goodsId;
	data['attribute'] = entity.attribute;
	data['value'] = entity.value;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}

goodDetailDataBrandFromJson(GoodDetailDataBrand data, Map<String, dynamic> json) {
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
	if (json['sortOrder'] != null) {
		data.sortOrder = json['sortOrder']?.toInt();
	}
	if (json['floorPrice'] != null) {
		data.floorPrice = json['floorPrice']?.toDouble();
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

Map<String, dynamic> goodDetailDataBrandToJson(GoodDetailDataBrand entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['desc'] = entity.desc;
	data['picUrl'] = entity.picUrl;
	data['sortOrder'] = entity.sortOrder;
	data['floorPrice'] = entity.floorPrice;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}

goodDetailDataProductListFromJson(GoodDetailDataProductList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toInt();
	}
	if (json['specifications'] != null) {
		data.specifications = json['specifications']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toInt();
	}
	if (json['number'] != null) {
		data.number = json['number']?.toInt();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
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

Map<String, dynamic> goodDetailDataProductListToJson(GoodDetailDataProductList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['goodsId'] = entity.goodsId;
	data['specifications'] = entity.specifications;
	data['price'] = entity.price;
	data['number'] = entity.number;
	data['url'] = entity.url;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}

goodDetailDataInfoFromJson(GoodDetailDataInfo data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['goodsSn'] != null) {
		data.goodsSn = json['goodsSn']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['categoryId'] != null) {
		data.categoryId = json['categoryId']?.toInt();
	}
	if (json['brandId'] != null) {
		data.brandId = json['brandId']?.toInt();
	}
	if (json['gallery'] != null) {
		data.gallery = json['gallery']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['keywords'] != null) {
		data.keywords = json['keywords']?.toString();
	}
	if (json['brief'] != null) {
		data.brief = json['brief']?.toString();
	}
	if (json['isOnSale'] != null) {
		data.isOnSale = json['isOnSale'];
	}
	if (json['sortOrder'] != null) {
		data.sortOrder = json['sortOrder']?.toInt();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['shareUrl'] != null) {
		data.shareUrl = json['shareUrl']?.toString();
	}
	if (json['isNew'] != null) {
		data.isNew = json['isNew'];
	}
	if (json['isHot'] != null) {
		data.isHot = json['isHot'];
	}
	if (json['unit'] != null) {
		data.unit = json['unit']?.toString();
	}
	if (json['counterPrice'] != null) {
		data.counterPrice = json['counterPrice']?.toInt();
	}
	if (json['retailPrice'] != null) {
		data.retailPrice = json['retailPrice']?.toInt();
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
	if (json['detail'] != null) {
		data.detail = json['detail']?.toString();
	}
	return data;
}

Map<String, dynamic> goodDetailDataInfoToJson(GoodDetailDataInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['goodsSn'] = entity.goodsSn;
	data['name'] = entity.name;
	data['categoryId'] = entity.categoryId;
	data['brandId'] = entity.brandId;
	data['gallery'] = entity.gallery;
	data['keywords'] = entity.keywords;
	data['brief'] = entity.brief;
	data['isOnSale'] = entity.isOnSale;
	data['sortOrder'] = entity.sortOrder;
	data['picUrl'] = entity.picUrl;
	data['shareUrl'] = entity.shareUrl;
	data['isNew'] = entity.isNew;
	data['isHot'] = entity.isHot;
	data['unit'] = entity.unit;
	data['counterPrice'] = entity.counterPrice;
	data['retailPrice'] = entity.retailPrice;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	data['detail'] = entity.detail;
	return data;
}