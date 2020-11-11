import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class CategoryEntity with JsonConvert<CategoryEntity> {
	int errno;
	CategoryData data;
	String errmsg;
}

class CategoryData with JsonConvert<CategoryData> {
	CategoryDataCurrentCategory currentCategory;
	List<CategoryDataBrotherCategory> brotherCategory;
	CategoryDataParentCategory parentCategory;
}

class CategoryDataCurrentCategory with JsonConvert<CategoryDataCurrentCategory> {
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

class CategoryDataBrotherCategory with JsonConvert<CategoryDataBrotherCategory> {
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

class CategoryDataParentCategory with JsonConvert<CategoryDataParentCategory> {
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
