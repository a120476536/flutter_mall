import 'package:flutter_mall_self/entity/order_submit_entity.dart';

orderSubmitEntityFromJson(OrderSubmitEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new OrderSubmitData().fromJson(json['data']);
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> orderSubmitEntityToJson(OrderSubmitEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

orderSubmitDataFromJson(OrderSubmitData data, Map<String, dynamic> json) {
	if (json['orderId'] != null) {
		data.orderId = json['orderId']?.toInt();
	}
	return data;
}

Map<String, dynamic> orderSubmitDataToJson(OrderSubmitData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['orderId'] = entity.orderId;
	return data;
}