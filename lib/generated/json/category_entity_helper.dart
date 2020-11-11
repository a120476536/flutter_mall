import 'package:flutter_mall_self/entity/category_entity.dart';

categoryEntityFromJson(CategoryEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new CategoryData().fromJson(json['data']);
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> categoryEntityToJson(CategoryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

categoryDataFromJson(CategoryData data, Map<String, dynamic> json) {
	if (json['currentCategory'] != null) {
		data.currentCategory = new CategoryDataCurrentCategory().fromJson(json['currentCategory']);
	}
	if (json['brotherCategory'] != null) {
		data.brotherCategory = new List<CategoryDataBrotherCategory>();
		(json['brotherCategory'] as List).forEach((v) {
			data.brotherCategory.add(new CategoryDataBrotherCategory().fromJson(v));
		});
	}
	if (json['parentCategory'] != null) {
		data.parentCategory = new CategoryDataParentCategory().fromJson(json['parentCategory']);
	}
	return data;
}

Map<String, dynamic> categoryDataToJson(CategoryData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.currentCategory != null) {
		data['currentCategory'] = entity.currentCategory.toJson();
	}
	if (entity.brotherCategory != null) {
		data['brotherCategory'] =  entity.brotherCategory.map((v) => v.toJson()).toList();
	}
	if (entity.parentCategory != null) {
		data['parentCategory'] = entity.parentCategory.toJson();
	}
	return data;
}

categoryDataCurrentCategoryFromJson(CategoryDataCurrentCategory data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['keywords'] != null) {
		data.keywords = json['keywords']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['pid'] != null) {
		data.pid = json['pid']?.toInt();
	}
	if (json['iconUrl'] != null) {
		data.iconUrl = json['iconUrl']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toString();
	}
	if (json['sortOrder'] != null) {
		data.sortOrder = json['sortOrder']?.toInt();
	}
	if (json['addTime'] != null) {
		data.addTime = json['addTime']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toString();
	}
	if (json['deleted'] != null) {
		data.deleted = json['deleted'];
	}
	return data;
}

Map<String, dynamic> categoryDataCurrentCategoryToJson(CategoryDataCurrentCategory entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['keywords'] = entity.keywords;
	data['desc'] = entity.desc;
	data['pid'] = entity.pid;
	data['iconUrl'] = entity.iconUrl;
	data['picUrl'] = entity.picUrl;
	data['level'] = entity.level;
	data['sortOrder'] = entity.sortOrder;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}

categoryDataBrotherCategoryFromJson(CategoryDataBrotherCategory data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['keywords'] != null) {
		data.keywords = json['keywords']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['pid'] != null) {
		data.pid = json['pid']?.toInt();
	}
	if (json['iconUrl'] != null) {
		data.iconUrl = json['iconUrl']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toString();
	}
	if (json['sortOrder'] != null) {
		data.sortOrder = json['sortOrder']?.toInt();
	}
	if (json['addTime'] != null) {
		data.addTime = json['addTime']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toString();
	}
	if (json['deleted'] != null) {
		data.deleted = json['deleted'];
	}
	return data;
}

Map<String, dynamic> categoryDataBrotherCategoryToJson(CategoryDataBrotherCategory entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['keywords'] = entity.keywords;
	data['desc'] = entity.desc;
	data['pid'] = entity.pid;
	data['iconUrl'] = entity.iconUrl;
	data['picUrl'] = entity.picUrl;
	data['level'] = entity.level;
	data['sortOrder'] = entity.sortOrder;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}

categoryDataParentCategoryFromJson(CategoryDataParentCategory data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['keywords'] != null) {
		data.keywords = json['keywords']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['pid'] != null) {
		data.pid = json['pid']?.toInt();
	}
	if (json['iconUrl'] != null) {
		data.iconUrl = json['iconUrl']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toString();
	}
	if (json['sortOrder'] != null) {
		data.sortOrder = json['sortOrder']?.toInt();
	}
	if (json['addTime'] != null) {
		data.addTime = json['addTime']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toString();
	}
	if (json['deleted'] != null) {
		data.deleted = json['deleted'];
	}
	return data;
}

Map<String, dynamic> categoryDataParentCategoryToJson(CategoryDataParentCategory entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['keywords'] = entity.keywords;
	data['desc'] = entity.desc;
	data['pid'] = entity.pid;
	data['iconUrl'] = entity.iconUrl;
	data['picUrl'] = entity.picUrl;
	data['level'] = entity.level;
	data['sortOrder'] = entity.sortOrder;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}