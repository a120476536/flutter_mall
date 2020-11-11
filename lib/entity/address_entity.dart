import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';
import 'package:flutter_mall_self/generated/json/base/json_field.dart';

class AddressEntity with JsonConvert<AddressEntity> {
	int errno;
	AddressData data;
	String errmsg;
}

class AddressData with JsonConvert<AddressData> {
	int total;
	int pages;
	int limit;
	int page;
	@JSONField(name: "list")
	List<AddressDataList> xList;
}

class AddressDataList with JsonConvert<AddressDataList> {
	int id;
	String name;
	int userId;
	String province;
	String city;
	String county;
	String addressDetail;
	String areaCode;
	String tel;
	bool isDefault;
	String addTime;
	String updateTime;
	bool deleted;
}
