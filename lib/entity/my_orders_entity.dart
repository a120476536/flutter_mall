import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';
import 'package:flutter_mall_self/generated/json/base/json_field.dart';

class MyOrdersEntity with JsonConvert<MyOrdersEntity> {
	int errno;
	MyOrdersData data;
	String errmsg;
}

class MyOrdersData with JsonConvert<MyOrdersData> {
	int total;
	int pages;
	int limit;
	int page;
	@JSONField(name: "list")
	List<MyOrdersDataList> xList;
}

class MyOrdersDataList with JsonConvert<MyOrdersDataList> {
	String orderStatusText;
	bool isGroupin;
	String orderSn;
	int actualPrice;
	List<MyOrdersDataListGoodsList> goodsList;
	int id;
	MyOrdersDataListHandleOption handleOption;
}

class MyOrdersDataListGoodsList with JsonConvert<MyOrdersDataListGoodsList> {
	String number;
	String picUrl;
	String price;
	int id;
	String goodsName;
	List<String> specifications;
}

class MyOrdersDataListHandleOption with JsonConvert<MyOrdersDataListHandleOption> {
	bool cancel;
	bool delete;
	bool pay;
	bool comment;
	bool confirm;
	bool refund;
	bool rebuy;
}
