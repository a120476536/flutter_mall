import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class CartAllEntity with JsonConvert<CartAllEntity> {
	int errno;
	CartAllData data;
	String errmsg;

	@override
  String toString() {
    return 'CartAllEntity{errno: $errno, data: $data, errmsg: $errmsg}';
  }
}

class CartAllData with JsonConvert<CartAllData> {
	CartAllDataCartTotal cartTotal;
	List<CartAllDataCartList> cartList;

	@override
  String toString() {
    return 'CartAllData{cartTotal: $cartTotal, cartList: $cartList}';
  }
}

class CartAllDataCartTotal with JsonConvert<CartAllDataCartTotal> {
	int goodsCount;
	int checkedGoodsCount;
	int goodsAmount;
	int checkedGoodsAmount;

	@override
  String toString() {
    return 'CartAllDataCartTotal{goodsCount: $goodsCount, checkedGoodsCount: $checkedGoodsCount, goodsAmount: $goodsAmount, checkedGoodsAmount: $checkedGoodsAmount}';
  }
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

	@override
  String toString() {
    return 'CartAllDataCartList{id: $id, userId: $userId, goodsId: $goodsId, goodsSn: $goodsSn, goodsName: $goodsName, productId: $productId, price: $price, number: $number, specifications: $specifications, checked: $checked, picUrl: $picUrl, addTime: $addTime, updateTime: $updateTime, deleted: $deleted, isCheck: $isCheck}';
  }
}
