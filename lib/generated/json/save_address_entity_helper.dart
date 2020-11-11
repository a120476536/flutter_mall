import 'package:flutter_mall_self/entity/save_address_entity.dart';

saveAddressEntityFromJson(SaveAddressEntity data, Map<String, dynamic> json) {
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

Map<String, dynamic> saveAddressEntityToJson(SaveAddressEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	data['data'] = entity.data;
	data['errmsg'] = entity.errmsg;
	return data;
}