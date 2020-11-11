import 'package:flutter_mall_self/entity/only_code_msg_entity.dart';

onlyCodeMsgEntityFromJson(OnlyCodeMsgEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> onlyCodeMsgEntityToJson(OnlyCodeMsgEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	data['errmsg'] = entity.errmsg;
	return data;
}