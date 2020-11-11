import 'package:flutter_mall_self/entity/add_cart_entity.dart';

addCartEntityFromJson(AddCartEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = json['data']?.toInt();
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> addCartEntityToJson(AddCartEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	data['data'] = entity.data;
	data['errmsg'] = entity.errmsg;
	return data;
}