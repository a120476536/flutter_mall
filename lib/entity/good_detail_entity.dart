import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class GoodDetailEntity with JsonConvert<GoodDetailEntity> {
	int errno;
	GoodDetailData data;
	String errmsg;

	@override
  String toString() {
    return 'GoodDetailEntity{errno: $errno, data: $data, errmsg: $errmsg}';
  }
}

class GoodDetailData with JsonConvert<GoodDetailData> {
	List<GoodDetailDataSpecificationList> specificationList;
	List<dynamic> groupon;
	List<GoodDetailDataIssue> issue;
	int userHasCollect;
	String shareImage;
	GoodDetailDataComment comment;
	bool share;
	List<GoodDetailDataAttribute> attribute;
	GoodDetailDataBrand brand;
	List<GoodDetailDataProductList> productList;
	GoodDetailDataInfo info;
	int chooseNum;//购买规格数量
	int chooseIndex;

	@override
  String toString() {
    return 'GoodDetailData{chooseNum: $chooseNum, chooseIndex: $chooseIndex}';
  } //购买规格

}

class GoodDetailDataSpecificationList with JsonConvert<GoodDetailDataSpecificationList> {
	String name;
	List<GoodDetailDataSpecificationListValueList> valueList;
}

class GoodDetailDataSpecificationListValueList with JsonConvert<GoodDetailDataSpecificationListValueList> {
	int id;
	int goodsId;
	String specification;
	String value;
	String picUrl;
	String addTime;
	String updateTime;
	bool deleted;
}

class GoodDetailDataIssue with JsonConvert<GoodDetailDataIssue> {
	int id;
	String question;
	String answer;
	String addTime;
	String updateTime;
	bool deleted;
}

class GoodDetailDataComment with JsonConvert<GoodDetailDataComment> {
	List<dynamic> data;
	int count;
}

class GoodDetailDataAttribute with JsonConvert<GoodDetailDataAttribute> {
	int id;
	int goodsId;
	String attribute;
	String value;
	String addTime;
	String updateTime;
	bool deleted;
}

class GoodDetailDataBrand with JsonConvert<GoodDetailDataBrand> {
	int id;
	String name;
	String desc;
	String picUrl;
	int sortOrder;
	double floorPrice;
	String addTime;
	String updateTime;
	bool deleted;
}

class GoodDetailDataProductList with JsonConvert<GoodDetailDataProductList> {
	int id;
	int goodsId;
	List<String> specifications;
	int price;
	int number;
	String url;
	String addTime;
	String updateTime;
	bool deleted;
}

class GoodDetailDataInfo with JsonConvert<GoodDetailDataInfo> {
	int id;
	String goodsSn;
	String name;
	int categoryId;
	int brandId;
	List<String> gallery;
	String keywords;
	String brief;
	bool isOnSale;
	int sortOrder;
	String picUrl;
	String shareUrl;
	bool isNew;
	bool isHot;
	String unit;
	int counterPrice;
	int retailPrice;
	String addTime;
	String updateTime;
	bool deleted;
	String detail;
}
