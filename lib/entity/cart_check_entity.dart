import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class CartCheckEntity with JsonConvert<CartCheckEntity> {
	int errno;
	CartCheckData data;
	String errmsg;
}

class CartCheckData with JsonConvert<CartCheckData> {
	int grouponRulesId;
	int actualPrice;
	int orderTotalPrice;
	int cartId;
	int couponId;
	int goodsTotalPrice;
	int addressId;
	int grouponPrice;
	CartCheckDataCheckedAddress checkedAddress;
	int couponPrice;
	int availableCouponLength;
	int freightPrice;
	List<CartCheckDataCheckedGoodsList> checkedGoodsList;
}

class CartCheckDataCheckedAddress with JsonConvert<CartCheckDataCheckedAddress> {
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

class CartCheckDataCheckedGoodsList with JsonConvert<CartCheckDataCheckedGoodsList> {
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
}
