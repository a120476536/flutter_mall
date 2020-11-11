import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class LeftCategoryEntity with JsonConvert<LeftCategoryEntity> {
	int errno;
	List<LeftCategoryData> data;
	String errmsg;
}

class LeftCategoryData with JsonConvert<LeftCategoryData> {
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
