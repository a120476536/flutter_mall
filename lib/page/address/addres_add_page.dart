import 'dart:convert';

import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/entity/address_entity.dart';
import 'package:flutter_mall_self/entity/save_address_entity.dart';
import 'package:flutter_mall_self/utils/event_bus.dart';
import 'package:flutter_mall_self/utils/http_util.dart';
import 'package:flutter_mall_self/utils/toast_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddressAddPage extends StatefulWidget {
  var addressjson;

  AddressAddPage(this.addressjson);

  @override
  _AddressAddPageState createState() => _AddressAddPageState();
}

class _AddressAddPageState extends State<AddressAddPage> {
  TextEditingController _controllerUser = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerAddressDetail = TextEditingController();
  bool choose = false;
  var _cityText;
  var _areaId;
  var _provinceName;
  var _cityName;
  var _countryName;
  var addressjson;
  AddressDataList _addressDataList;
  SaveAddressEntity _saveAddressEntity;
  _saveAddress(){
    if(_controllerUser.text.toString().isEmpty){
      ToastUtils.showToast(context, "联系人姓名不能为空");
      return;
    }else if(_controllerPhone.text.toString().isEmpty){
      ToastUtils.showToast(context, "联系人电话不能为空");
      return;
    }else if(_controllerAddressDetail.text.toString().isEmpty){
      ToastUtils.showToast(context, "联系人地址不能为空");
      return;
    }
    var parameters = {
      "addressDetail": _controllerAddressDetail.text.toString(),
      "areaCode": _areaId,
      "city": _cityName,
      "county": _countryName,
      "id": _addressDataList == null ? 0 : _addressDataList.id,
      "isDefault": choose,
      "name": _controllerUser.text.toString(),
      "province": _provinceName,
      "tel": _controllerPhone.text.toString(),
    };
    HttpUtil.instance
        .post(Api.BASE_URL + Api.ADDRESS_SAVE, parameters: parameters)
        .then((value) => {
              if (value != null)
                {
                  _saveAddressEntity = SaveAddressEntity().fromJson(json.decode(value.toString())),
                  if (_saveAddressEntity.errno == 0){
                      eventBus.fire(SaveAddressEvent(true)),
                      Navigator.pop(context),
                    }else{
                    ToastUtils.showFlutterToast(_saveAddressEntity.errmsg),
                  }
                }
            });
  }

  _showChooseCity(context) async {
    Result temp = await CityPickers.showCityPicker(
      height: ScreenUtil.instance.setHeight(400),
      context: context,
      itemExtent: ScreenUtil.instance.setHeight(80.0),
      itemBuilder: (item, list, index) {
        return Center(
            child: Text(item,
                maxLines: 1,
                style: TextStyle(fontSize: ScreenUtil.instance.setSp(26.0))));
      },);
    print(temp);
    setState(() {
      _cityText = temp.provinceName + temp.cityName + temp.areaName;
      _areaId = temp.areaId;
      _provinceName = temp.provinceName;
      _cityName = temp.cityName;
      _countryName = temp.areaName;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addressjson = widget.addressjson;
    if(addressjson!="1"){
      if(addressjson!=null||addressjson!=""){
        _addressDataList = AddressDataList().fromJson(json.decode(addressjson));
        if(_addressDataList!=null){
          setState(() {
            _controllerUser.text = _addressDataList.name;
            _controllerPhone.text = _addressDataList.tel;
            _controllerAddressDetail.text = _addressDataList.addressDetail;
            _cityText = _addressDataList.province+_addressDataList.city+_addressDataList.county;
            choose = _addressDataList.isDefault;
            _areaId = _addressDataList.areaCode;
            _cityName = _addressDataList.city;
            _countryName = _addressDataList.county;
            _provinceName = _addressDataList.province;

          });
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加地址'),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              controller: _controllerUser,
              maxLength: 30,
              maxLines: 1,
              autofocus: false,
              //是否自动对焦
              autocorrect: true,
              //是否自动更正
              // obscureText: true,//是否是密码
              // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
              enabled: true,
              decoration: InputDecoration(
                hintText: "请输入联系人姓名",
                hintStyle: TextStyle(fontSize: 12.0),
                labelText: "联系人姓名",
                labelStyle: TextStyle(fontSize: 12.0),
              ),
              onChanged: (username) {
                print("地址用户名$username");
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              controller: _controllerPhone,
              maxLength: 11,
              maxLines: 1,
              autofocus: false,
              //是否自动对焦
              autocorrect: true,
              //是否自动更正
              // obscureText: true,//是否是密码
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              //允许的输入格式
              enabled: true,
              decoration: InputDecoration(
                hintText: "请输入联系人电话",
                hintStyle: TextStyle(fontSize: 12.0),
                labelText: "联系人电话",
                labelStyle: TextStyle(fontSize: 12.0),
              ),
              onChanged: (userphone) {
                print("电话$userphone");
              },
            ),
          ),
          InkWell(
            onTap: (){
              _showChooseCity(context);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              padding: EdgeInsets.only(bottom: 10.0),
              alignment: Alignment.centerLeft,
              child: Text(_cityText==null?'请选择地址':_cityText),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              controller: _controllerAddressDetail,
              maxLength: 11,
              maxLines: 1,
              autofocus: false,
              //是否自动对焦
              autocorrect: true,
              //是否自动更正
              // obscureText: true,//是否是密码
              //允许的输入格式
              enabled: true,
              decoration: InputDecoration(
                hintText: "请输入详细地址如街道、楼栋号等",
                hintStyle: TextStyle(fontSize: 12.0),
                labelText: "详细地址",
                labelStyle: TextStyle(fontSize: 12.0),
              ),
              onChanged: (useraddressDetail) {
                print("详细地址$useraddressDetail");
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('设为默认地址'),
                Switch(
                  value: choose,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      choose = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(child: InkWell(
          onTap: () {
            print('提交保存地址');
            _saveAddress();
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.deepOrange,
            height: 50.0,
            child: Text(
              '提交',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),),),
    );
  }
}
