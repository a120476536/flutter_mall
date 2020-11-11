import 'package:flutter_mall_self/entity/my_orders_entity.dart';

myOrdersEntityFromJson(MyOrdersEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new MyOrdersData().fromJson(json['data']);
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> myOrdersEntityToJson(MyOrdersEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

myOrdersDataFromJson(MyOrdersData data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['pages'] != null) {
		data.pages = json['pages']?.toInt();
	}
	if (json['limit'] != null) {
		data.limit = json['limit']?.toInt();
	}
	if (json['page'] != null) {
		data.page = json['page']?.toInt();
	}
	if (json['list'] != null) {
		data.xList = new List<MyOrdersDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new MyOrdersDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> myOrdersDataToJson(MyOrdersData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['pages'] = entity.pages;
	data['limit'] = entity.limit;
	data['page'] = entity.page;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

myOrdersDataListFromJson(MyOrdersDataList data, Map<String, dynamic> json) {
	if (json['orderStatusText'] != null) {
		data.orderStatusText = json['orderStatusText']?.toString();
	}
	if (json['isGroupin'] != null) {
		data.isGroupin = json['isGroupin'];
	}
	if (json['orderSn'] != null) {
		data.orderSn = json['orderSn']?.toString();
	}
	if (json['actualPrice'] != null) {
		data.actualPrice = json['actualPrice']?.toInt();
	}
	if (json['goodsList'] != null) {
		data.goodsList = new List<MyOrdersDataListGoodsList>();
		(json['goodsList'] as List).forEach((v) {
			data.goodsList.add(new MyOrdersDataListGoodsList().fromJson(v));
		});
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['handleOption'] != null) {
		data.handleOption = new MyOrdersDataListHandleOption().fromJson(json['handleOption']);
	}
	return data;
}

Map<String, dynamic> myOrdersDataListToJson(MyOrdersDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['orderStatusText'] = entity.orderStatusText;
	data['isGroupin'] = entity.isGroupin;
	data['orderSn'] = entity.orderSn;
	data['actualPrice'] = entity.actualPrice;
	if (entity.goodsList != null) {
		data['goodsList'] =  entity.goodsList.map((v) => v.toJson()).toList();
	}
	data['id'] = entity.id;
	if (entity.handleOption != null) {
		data['handleOption'] = entity.handleOption.toJson();
	}
	return data;
}

myOrdersDataListGoodsListFromJson(MyOrdersDataListGoodsList data, Map<String, dynamic> json) {
	if (json['number'] != null) {
		data.number = json['number']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['goodsName'] != null) {
		data.goodsName = json['goodsName']?.toString();
	}
	if (json['specifications'] != null) {
		data.specifications = json['specifications']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> myOrdersDataListGoodsListToJson(MyOrdersDataListGoodsList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['number'] = entity.number;
	data['picUrl'] = entity.picUrl;
	data['price'] = entity.price;
	data['id'] = entity.id;
	data['goodsName'] = entity.goodsName;
	data['specifications'] = entity.specifications;
	return data;
}

myOrdersDataListHandleOptionFromJson(MyOrdersDataListHandleOption data, Map<String, dynamic> json) {
	if (json['cancel'] != null) {
		data.cancel = json['cancel'];
	}
	if (json['delete'] != null) {
		data.delete = json['delete'];
	}
	if (json['pay'] != null) {
		data.pay = json['pay'];
	}
	if (json['comment'] != null) {
		data.comment = json['comment'];
	}
	if (json['confirm'] != null) {
		data.confirm = json['confirm'];
	}
	if (json['refund'] != null) {
		data.refund = json['refund'];
	}
	if (json['rebuy'] != null) {
		data.rebuy = json['rebuy'];
	}
	return data;
}

Map<String, dynamic> myOrdersDataListHandleOptionToJson(MyOrdersDataListHandleOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['cancel'] = entity.cancel;
	data['delete'] = entity.delete;
	data['pay'] = entity.pay;
	data['comment'] = entity.comment;
	data['confirm'] = entity.confirm;
	data['refund'] = entity.refund;
	data['rebuy'] = entity.rebuy;
	return data;
}