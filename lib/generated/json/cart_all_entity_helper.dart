import 'package:flutter_mall_self/entity/cart_all_entity.dart';

cartAllEntityFromJson(CartAllEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new CartAllData().fromJson(json['data']);
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> cartAllEntityToJson(CartAllEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

cartAllDataFromJson(CartAllData data, Map<String, dynamic> json) {
	if (json['cartTotal'] != null) {
		data.cartTotal = new CartAllDataCartTotal().fromJson(json['cartTotal']);
	}
	if (json['cartList'] != null) {
		data.cartList = new List<CartAllDataCartList>();
		(json['cartList'] as List).forEach((v) {
			data.cartList.add(new CartAllDataCartList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> cartAllDataToJson(CartAllData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.cartTotal != null) {
		data['cartTotal'] = entity.cartTotal.toJson();
	}
	if (entity.cartList != null) {
		data['cartList'] =  entity.cartList.map((v) => v.toJson()).toList();
	}
	return data;
}

cartAllDataCartTotalFromJson(CartAllDataCartTotal data, Map<String, dynamic> json) {
	if (json['goodsCount'] != null) {
		data.goodsCount = json['goodsCount']?.toInt();
	}
	if (json['checkedGoodsCount'] != null) {
		data.checkedGoodsCount = json['checkedGoodsCount']?.toInt();
	}
	if (json['goodsAmount'] != null) {
		data.goodsAmount = json['goodsAmount']?.toInt();
	}
	if (json['checkedGoodsAmount'] != null) {
		data.checkedGoodsAmount = json['checkedGoodsAmount']?.toInt();
	}
	return data;
}

Map<String, dynamic> cartAllDataCartTotalToJson(CartAllDataCartTotal entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['goodsCount'] = entity.goodsCount;
	data['checkedGoodsCount'] = entity.checkedGoodsCount;
	data['goodsAmount'] = entity.goodsAmount;
	data['checkedGoodsAmount'] = entity.checkedGoodsAmount;
	return data;
}

cartAllDataCartListFromJson(CartAllDataCartList data, Map<String, dynamic> json) {
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
	if (json['isCheck'] != null) {
		data.isCheck = json['isCheck'];
	}
	return data;
}

Map<String, dynamic> cartAllDataCartListToJson(CartAllDataCartList entity) {
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
	data['isCheck'] = entity.isCheck;
	return data;
}