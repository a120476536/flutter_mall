import 'package:flutter_mall_self/entity/register_entity.dart';

registerEntityFromJson(RegisterEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new RegisterData().fromJson(json['data']);
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> registerEntityToJson(RegisterEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

registerDataFromJson(RegisterData data, Map<String, dynamic> json) {
	if (json['userInfo'] != null) {
		data.userInfo = new RegisterDataUserInfo().fromJson(json['userInfo']);
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	return data;
}

Map<String, dynamic> registerDataToJson(RegisterData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.userInfo != null) {
		data['userInfo'] = entity.userInfo.toJson();
	}
	data['token'] = entity.token;
	return data;
}

registerDataUserInfoFromJson(RegisterDataUserInfo data, Map<String, dynamic> json) {
	if (json['nickName'] != null) {
		data.nickName = json['nickName']?.toString();
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> registerDataUserInfoToJson(RegisterDataUserInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['nickName'] = entity.nickName;
	data['avatarUrl'] = entity.avatarUrl;
	return data;
}