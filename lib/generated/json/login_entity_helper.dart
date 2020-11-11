import 'package:flutter_mall_self/entity/login_entity.dart';

loginEntityFromJson(LoginEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toString();
	}
	if (json['data'] != null) {
		data.data = new LoginData().fromJson(json['data']);
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> loginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

loginDataFromJson(LoginData data, Map<String, dynamic> json) {
	if (json['userInfo'] != null) {
		data.userInfo = new LoginDataUserInfo().fromJson(json['userInfo']);
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	return data;
}

Map<String, dynamic> loginDataToJson(LoginData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.userInfo != null) {
		data['userInfo'] = entity.userInfo.toJson();
	}
	data['token'] = entity.token;
	return data;
}

loginDataUserInfoFromJson(LoginDataUserInfo data, Map<String, dynamic> json) {
	if (json['nickName'] != null) {
		data.nickName = json['nickName']?.toString();
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> loginDataUserInfoToJson(LoginDataUserInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['nickName'] = entity.nickName;
	data['avatarUrl'] = entity.avatarUrl;
	return data;
}