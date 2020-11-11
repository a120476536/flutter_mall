import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/entity/address_entity.dart';
import 'package:flutter_mall_self/utils/event_bus.dart';
import 'package:flutter_mall_self/utils/http_util.dart';
import 'package:flutter_mall_self/utils/navigator_util.dart';
import 'package:flutter_mall_self/utils/toast_utils.dart';
import 'package:flutter_mall_self/widget/cached_image.dart';
import 'package:flutter_mall_self/widget/empty_view.dart';
import 'package:toast/toast.dart';

class AddressPage extends StatefulWidget {
  var type;

  AddressPage(this.type);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {

  List<AddressDataList> xList;
  var type;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    type = widget.type;
    _getAddress();
    _listener();
  }

  _getAddress() {
    HttpUtil.instance.get(Api.BASE_URL + Api.ADDRESS_LIST).then((value) => {
          if (value != null)
            {
              setState(() {
                AddressEntity _addressEntity = AddressEntity().fromJson(json.decode(value.toString()));
                xList = _addressEntity.data.xList;
              }),
            }
        });
  }
  _listener(){
    eventBus.on<SaveAddressEvent>().listen((event) {
      if(event.isSave){
        _getAddress();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的地址'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              // Toast.show("添加新地址", context);
              NavigatorUtil.goAddressAddPage(context,"1");
            },
            child: Container(alignment: Alignment.center,child: Text('添加地址'),),
          ),
        ],
      ),
      body: xList==null||xList.length==0?EmptyView():ListView.builder(
        itemCount: xList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              if(type!="0"){
                eventBus.fire(AddresEvent(xList[index]));
                Navigator.pop(context);
              }

            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  height: 60.0,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10.0,),child: CachedImageView(50.0, 50.0, "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2588814438,603107681&fm=26&gp=0.jpg"),),
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.only(left: 10.0),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${xList[index].name}  ${xList[index].tel}"),
                              Text("${xList[index].province}${xList[index].city}${xList[index].county}${xList[index].addressDetail}"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 40.0,
                        color: Colors.grey,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              ToastUtils.showToast(context, "编辑地址");
                              NavigatorUtil.goAddressAddPage(context,json.encode(xList[index]),);
                            },
                            child: Text('编辑'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
