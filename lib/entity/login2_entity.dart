import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class Login2Entity with JsonConvert<Login2Entity> {
	Login2UserInfo userInfo;
	String token;
}

class Login2UserInfo with JsonConvert<Login2UserInfo> {
	String nickName;
	String avatarUrl;
}
