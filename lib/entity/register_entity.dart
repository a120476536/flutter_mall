import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class RegisterEntity with JsonConvert<RegisterEntity> {
	int errno;
	RegisterData data;
	String errmsg;
}

class RegisterData with JsonConvert<RegisterData> {
	RegisterDataUserInfo userInfo;
	String token;
}

class RegisterDataUserInfo with JsonConvert<RegisterDataUserInfo> {
	String nickName;
	String avatarUrl;
}
