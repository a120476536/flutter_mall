import 'package:flutter_mall_self/entity/login2_entity.dart';

login2EntityFromJson(Login2Entity data, Map<String, dynamic> json) {
	if (json['userInfo'] != null) {
		data.userInfo = new Login2UserInfo().fromJson(json['userInfo']);
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	return data;
}

Map<String, dynamic> login2EntityToJson(Login2Entity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.userInfo != null) {
		data['userInfo'] = entity.userInfo.toJson();
	}
	data['token'] = entity.token;
	return data;
}

login2UserInfoFromJson(Login2UserInfo data, Map<String, dynamic> json) {
	if (json['nickName'] != null) {
		data.nickName = json['nickName']?.toString();
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> login2UserInfoToJson(Login2UserInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['nickName'] = entity.nickName;
	data['avatarUrl'] = entity.avatarUrl;
	return data;
}