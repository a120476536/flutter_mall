import 'package:flutter_mall_self/entity/address_entity.dart';

addressEntityFromJson(AddressEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new AddressData().fromJson(json['data']);
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	return data;
}

Map<String, dynamic> addressEntityToJson(AddressEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errmsg'] = entity.errmsg;
	return data;
}

addressDataFromJson(AddressData data, Map<String, dynamic> json) {
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
		data.xList = new List<AddressDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new AddressDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> addressDataToJson(AddressData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['pages'] = entity.pages;
	data['limit'] = entity.limit;
	data['page'] = entity.page;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

addressDataListFromJson(AddressDataList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['province'] != null) {
		data.province = json['province']?.toString();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toString();
	}
	if (json['county'] != null) {
		data.county = json['county']?.toString();
	}
	if (json['addressDetail'] != null) {
		data.addressDetail = json['addressDetail']?.toString();
	}
	if (json['areaCode'] != null) {
		data.areaCode = json['areaCode']?.toString();
	}
	if (json['tel'] != null) {
		data.tel = json['tel']?.toString();
	}
	if (json['isDefault'] != null) {
		data.isDefault = json['isDefault'];
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

Map<String, dynamic> addressDataListToJson(AddressDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['userId'] = entity.userId;
	data['province'] = entity.province;
	data['city'] = entity.city;
	data['county'] = entity.county;
	data['addressDetail'] = entity.addressDetail;
	data['areaCode'] = entity.areaCode;
	data['tel'] = entity.tel;
	data['isDefault'] = entity.isDefault;
	data['addTime'] = entity.addTime;
	data['updateTime'] = entity.updateTime;
	data['deleted'] = entity.deleted;
	return data;
}