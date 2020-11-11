import 'package:event_bus/event_bus.dart';
import 'package:flutter_mall_self/entity/address_entity.dart';
import 'package:flutter_mall_self/entity/login_entity.dart';
import 'package:flutter_mall_self/entity/only_code_msg_entity.dart';

//Bus初始化
EventBus eventBus = EventBus();

// LoginEntity
class LoginEvent {
  LoginEntity loginEntity;

  LoginEvent(loginEntity) {
    this.loginEntity = loginEntity;
  }
}

class LoginOutEvent{
  bool isLogin = false;

  LoginOutEvent(this.isLogin);
}

class NotiEvent{
  var index = 0;
  NotiEvent(this.index);
}

class AddresEvent{
  AddressDataList addressData;
  AddresEvent(this.addressData);
}

class SaveAddressEvent{
  bool isSave;
  SaveAddressEvent(this.isSave);
}

class OnlyTypeEvent{
  int type;//type 0 添加购物车 刷新

  OnlyTypeEvent(this.type);
}


