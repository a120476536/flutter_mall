import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class RightContentEntity with JsonConvert<RightContentEntity> {
	int errno;
	List<RightContentData> data;
	String errmsg;
}

class RightContentData with JsonConvert<RightContentData> {
	int id;
	String name;
	String keywords;
	String desc;
	int pid;
	String iconUrl;
	String picUrl;
	String level;
	int sortOrder;
	String addTime;
	String updateTime;
	bool deleted;
}
