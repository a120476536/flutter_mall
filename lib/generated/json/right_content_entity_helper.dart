import 'package:flutter_mall_self/entity/right_content_entity.dart';

rightContentEntityFromJson(RightContentEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new List<RightContentData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new RightContentData().fromJson(v));
		});
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> rightContentEntityToJson(RightContentEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

rightContentDataFromJson(RightContentData data, Map<String, dynamic> json) {
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

Map<String, dynamic> rightContentDataToJson(RightContentData entity) {
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