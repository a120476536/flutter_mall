import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class LoginEntity with JsonConvert<LoginEntity> {
	String errno;
	LoginData data;
	String errmsg;

	@override
  String toString() {
    return 'LoginEntity{errno: $errno, data: $data, errmsg: $errmsg}';
  }
}

class LoginData with JsonConvert<LoginData> {
	LoginDataUserInfo userInfo;
	String token;

	@override
  String toString() {
    return 'LoginData{userInfo: $userInfo, token: $token}';
  }
}

class LoginDataUserInfo with JsonConvert<LoginDataUserInfo> {
	String nickName;
	String avatarUrl;

	@override
  String toString() {
    return 'LoginDataUserInfo{nickName: $nickName, avatarUrl: $avatarUrl}';
  }
}
