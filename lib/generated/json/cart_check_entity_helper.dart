import 'package:flutter_mall_self/entity/cart_check_entity.dart';

cartCheckEntityFromJson(CartCheckEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new CartCheckData().fromJson(json['data']);
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> cartCheckEntityToJson(CartCheckEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

cartCheckDataFromJson(CartCheckData data, Map<String, dynamic> json) {
	if (json['grouponRulesId'] != null) {
		data.grouponRulesId = json['grouponRulesId']?.toInt();
	}
	if (json['actualPrice'] != null) {
		data.actualPrice = json['actualPrice']?.toInt();
	}
	if (json['orderTotalPrice'] != null) {
		data.orderTotalPrice = json['orderTotalPrice']?.toInt();
	}
	if (json['cartId'] != null) {
		data.cartId = json['cartId']?.toInt();
	}
	if (json['couponId'] != null) {
		data.couponId = json['couponId']?.toInt();
	}
	if (json['goodsTotalPrice'] != null) {
		data.goodsTotalPrice = json['goodsTotalPrice']?.toInt();
	}
	if (json['addressId'] != null) {
		data.addressId = json['addressId']?.toInt();
	}
	if (json['grouponPrice'] != null) {
		data.grouponPrice = json['grouponPrice']?.toInt();
	}
	if (json['checkedAddress'] != null) {
		data.checkedAddress = new CartCheckDataCheckedAddress().fromJson(json['checkedAddress']);
	}
	if (json['couponPrice'] != null) {
		data.couponPrice = json['couponPrice']?.toInt();
	}
	if (json['availableCouponLength'] != null) {
		data.availableCouponLength = json['availableCouponLength']?.toInt();
	}
	if (json['freightPrice'] != null) {
		data.freightPrice = json['freightPrice']?.toInt();
	}
	if (json['checkedGoodsList'] != null) {
		data.checkedGoodsList = new List<CartCheckDataCheckedGoodsList>();
		(json['checkedGoodsList'] as List).forEach((v) {
			data.checkedGoodsList.add(new CartCheckDataCheckedGoodsList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> cartCheckDataToJson(CartCheckData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['grouponRulesId'] = entity.grouponRulesId;
	data['actualPrice'] = entity.actualPrice;
	data['orderTotalPrice'] = entity.orderTotalPrice;
	data['cartId'] = entity.cartId;
	data['couponId'] = entity.couponId;
	data['goodsTotalPrice'] = entity.goodsTotalPrice;
	data['addressId'] = entity.addressId;
	data['grouponPrice'] = entity.grouponPrice;
	if (entity.checkedAddress != null) {
		data['checkedAddress'] = entity.checkedAddress.toJson();
	}
	data['couponPrice'] = entity.couponPrice;
	data['availableCouponLength'] = entity.availableCouponLength;
	data['freightPrice'] = entity.freightPrice;
	if (entity.checkedGoodsList != null) {
		data['checkedGoodsList'] =  entity.checkedGoodsList.map((v) => v.toJson()).toList();
	}
	return data;
}

cartCheckDataCheckedAddressFromJson(CartCheckDataCheckedAddress data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['province'] != null) {
		data.province = json['province']?.toString();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toString();
	}
	if (json['county'] != null) {
		data.county = json['county']?.toString();
	}
	if (json['addressDetail'] != null) {
		data.addressDetail = json['addressDetail']?.toString();
	}
	if (json['areaCode'] != null) {
		data.areaCode = json['areaCode']?.toString();
	}
	if (json['tel'] != null) {
		data.tel = json['tel']?.toString();
	}
	if (json['isDefault'] != null) {
		data.isDefault = json['isDefault'];
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

Map<String, dynamic> cartCheckDataCheckedAddressToJson(CartCheckDataCheckedAddress entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['userId'] = entity.userId;
	data['province'] = entity.province;
	data['city'] = entity.city;
	data['county'] = entity.county;
	data['addressDetail'] = entity.addressDetail;
	data['areaCode'] = entity.areaCode;
	data['tel'] = entity.tel;
	data['isDefault'] = entity.isDefault;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}

cartCheckDataCheckedGoodsListFromJson(CartCheckDataCheckedGoodsList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toInt();
	}
	if (json['goodsSn'] != null) {
		data.goodsSn = json['goodsSn']?.toString();
	}
	if (json['goodsName'] != null) {
		data.goodsName = json['goodsName']?.toString();
	}
	if (json['productId'] != null) {
		data.productId = json['productId']?.toInt();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toInt();
	}
	if (json['number'] != null) {
		data.number = json['number']?.toInt();
	}
	if (json['specifications'] != null) {
		data.specifications = json['specifications']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['checked'] != null) {
		data.checked = json['checked'];
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

Map<String, dynamic> cartCheckDataCheckedGoodsListToJson(CartCheckDataCheckedGoodsList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userId'] = entity.userId;
	data['goodsId'] = entity.goodsId;
	data['goodsSn'] = entity.goodsSn;
	data['goodsName'] = entity.goodsName;
	data['productId'] = entity.productId;
	data['price'] = entity.price;
	data['number'] = entity.number;
	data['specifications'] = entity.specifications;
	data['checked'] = entity.checked;
	data['picUrl'] = entity.picUrl;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}