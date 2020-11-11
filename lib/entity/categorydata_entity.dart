import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';
import 'package:flutter_mall_self/generated/json/base/json_field.dart';

class CategorydataEntity with JsonConvert<CategorydataEntity> {
	int errno;
	CategorydataData data;
	String errmsg;

	@override
  String toString() {
    return 'CategorydataEntity{errno: $errno, data: $data, errmsg: $errmsg}';
  }
}

class CategorydataData with JsonConvert<CategorydataData> {
	int total;
	int pages;
	int limit;
	int page;
	@JSONField(name: "list")
	List<CategorydataDataList> xList;
	List<CategorydataDataFilterCategoryList> filterCategoryList;

	@override
  String toString() {
    return 'CategorydataData{total: $total, pages: $pages, limit: $limit, page: $page, xList: $xList, filterCategoryList: $filterCategoryList}';
  }
}

class CategorydataDataList with JsonConvert<CategorydataDataList> {
	int id;
	String name;
	String brief;
	String picUrl;
	bool isNew;
	bool isHot;
	int counterPrice;
	int retailPrice;

	@override
  String toString() {
    return 'CategorydataDataList{id: $id, name: $name, brief: $brief, picUrl: $picUrl, isNew: $isNew, isHot: $isHot, counterPrice: $counterPrice, retailPrice: $retailPrice}';
  }
}

class CategorydataDataFilterCategoryList with JsonConvert<CategorydataDataFilterCategoryList> {
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

	@override
  String toString() {
    return 'CategorydataDataFilterCategoryList{id: $id, name: $name, keywords: $keywords, desc: $desc, pid: $pid, iconUrl: $iconUrl, picUrl: $picUrl, level: $level, sortOrder: $sortOrder, addTime: $addTime, updateTime: $updateTime, deleted: $deleted}';
  }
}
