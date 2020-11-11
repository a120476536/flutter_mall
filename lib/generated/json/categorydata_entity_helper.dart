import 'package:flutter_mall_self/entity/categorydata_entity.dart';

categorydataEntityFromJson(CategorydataEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new CategorydataData().fromJson(json['data']);
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> categorydataEntityToJson(CategorydataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

categorydataDataFromJson(CategorydataData data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['pages'] != null) {
		data.pages = json['pages']?.toInt();
	}
	if (json['limit'] != null) {
		data.limit = json['limit']?.toInt();
	}
	if (json['page'] != null) {
		data.page = json['page']?.toInt();
	}
	if (json['list'] != null) {
		data.xList = new List<CategorydataDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new CategorydataDataList().fromJson(v));
		});
	}
	if (json['filterCategoryList'] != null) {
		data.filterCategoryList = new List<CategorydataDataFilterCategoryList>();
		(json['filterCategoryList'] as List).forEach((v) {
			data.filterCategoryList.add(new CategorydataDataFilterCategoryList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> categorydataDataToJson(CategorydataData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['pages'] = entity.pages;
	data['limit'] = entity.limit;
	data['page'] = entity.page;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	if (entity.filterCategoryList != null) {
		data['filterCategoryList'] =  entity.filterCategoryList.map((v) => v.toJson()).toList();
	}
	return data;
}

categorydataDataListFromJson(CategorydataDataList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['brief'] != null) {
		data.brief = json['brief']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['isNew'] != null) {
		data.isNew = json['isNew'];
	}
	if (json['isHot'] != null) {
		data.isHot = json['isHot'];
	}
	if (json['counterPrice'] != null) {
		data.counterPrice = json['counterPrice']?.toInt();
	}
	if (json['retailPrice'] != null) {
		data.retailPrice = json['retailPrice']?.toInt();
	}
	return data;
}

Map<String, dynamic> categorydataDataListToJson(CategorydataDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['brief'] = entity.brief;
	data['picUrl'] = entity.picUrl;
	data['isNew'] = entity.isNew;
	data['isHot'] = entity.isHot;
	data['counterPrice'] = entity.counterPrice;
	data['retailPrice'] = entity.retailPrice;
	return data;
}

categorydataDataFilterCategoryListFromJson(CategorydataDataFilterCategoryList data, Map<String, dynamic> json) {
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

Map<String, dynamic> categorydataDataFilterCategoryListToJson(CategorydataDataFilterCategoryList entity) {
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