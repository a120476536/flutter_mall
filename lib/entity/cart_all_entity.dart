import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class CartAllEntity with JsonConvert<CartAllEntity> {
	int errno;
	CartAllData data;
	String errmsg;
}

class CartAllData with JsonConvert<CartAllData> {
	CartAllDataCartTotal cartTotal;
	List<CartAllDataCartList> cartList;
}

class CartAllDataCartTotal with JsonConvert<CartAllDataCartTotal> {
	int goodsCount;
	int checkedGoodsCount;
	int goodsAmount;
	int checkedGoodsAmount;
}

class CartAllDataCartList with JsonConvert<CartAllDataCartList> {
	int id;
	int userId;
	int goodsId;
	String goodsSn;
	String goodsName;
	int productId;
	int price;
	int number;
	List<String> specifications;
	bool checked;
	String picUrl;
	String addTime;
	String updateTime;
	bool deleted;
	bool isCheck = false;
}
