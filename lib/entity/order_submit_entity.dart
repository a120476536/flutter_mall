import 'package:flutter_mall_self/generated/json/base/json_convert_content.dart';

class OrderSubmitEntity with JsonConvert<OrderSubmitEntity> {
	int errno;
	OrderSubmitData data;
	String errmsg;
}

class OrderSubmitData with JsonConvert<OrderSubmitData> {
	int orderId;
}
