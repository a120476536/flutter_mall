import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mall_self/api/api.dart';
import 'package:flutter_mall_self/constant/strings.dart';
import 'package:flutter_mall_self/entity/login_entity.dart';
import 'package:flutter_mall_self/entity/only_code_msg_entity.dart';
import 'package:flutter_mall_self/page/login/login_view.dart';
import 'package:flutter_mall_self/utils/SharePreferenceUtils.dart';
import 'package:flutter_mall_self/utils/event_bus.dart';
import 'package:flutter_mall_self/utils/http_util.dart';
import 'package:flutter_mall_self/utils/navigator_util.dart';
import 'package:flutter_mall_self/utils/toast_utils.dart';
import 'package:flutter_mall_self/widget/cached_image.dart';
import 'package:flutter_mall_self/widget/my_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  List<Widget> _list = List();
  var _isLogin = false;
  var _nickName = "昵称";
  var _avatarurl = "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3968417432,4100418615&fm=26&gp=0.jpg";
  LoginEntity _loginEntity;
  OnlyCodeMsgEntity _onlyCodeMsgEntity;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listener();
    _setList();
    SharePreference.getShareData(Strings.TOKEN).then((value) => {
      if(value!=null){
          _isLogin = true,
      }else{
          _isLogin = false,
      }
    });

    SharePreference.getShareData(Strings.NICK_NAME).then((value) => {
      if(value != null){
        setState(() {
          _nickName = value;
    }),
      }
    });
    SharePreference.getShareData(Strings.AVATARURL).then((value) => {
      if(value != null){
        setState(() {
          _avatarurl = value;
        }),
      }
    });
  }

  void _setList() {
    _list.add(MyItem(Icons.bookmark_border_outlined, '我的订单',
        "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"));
    _list.add(MyItem(Icons.access_alarm, '优惠劵',
        "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"));
    _list.add(MyItem(Icons.sports_kabaddi_sharp, '收藏',
        "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"));
    _list.add(MyItem(Icons.add_chart, '地址管理',
        "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"));
    _list.add(MyItem(Icons.emoji_people, '我的足迹',
        "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"));
    _list.add(MyItem(Icons.feedback, '反馈',
        "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"));
    _list.add(MyItem(Icons.account_box_outlined, '关于我们',
        "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"));
  }
  void _loginOut() async{
    HttpUtil.instance.post(Api.BASE_URL+Api.LOGIN_OUT).then((value) => {
      _onlyCodeMsgEntity = OnlyCodeMsgEntity().fromJson(json.decode(value.toString())),
          if (_onlyCodeMsgEntity.errno == 0)
            {
              ToastUtils.showToast(context, "退出登录成功"),
              SharePreference.removeData(),
              eventBus.fire(LoginOutEvent(false)),
              setState(() {
                _isLogin = false;
                _nickName = "";
                _avatarurl = "";
              }),
            }
        });
  }
  void _listener(){
    eventBus.on<LoginEvent>().listen((event) {
      setState(() {
        _loginEntity = event.loginEntity;
        if(_loginEntity.errno=="0"){
          _isLogin = true;
          _nickName = _loginEntity.data.userInfo.nickName;
          _avatarurl = _loginEntity.data.userInfo.avatarUrl;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            stretch: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('我的'),
              // centerTitle: true,
              // collapseMode: CollapseMode.pin,
              // background: Image.network(
              //   "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg",
              //   fit: BoxFit.cover,
              // ),
              background: Container(
                padding: EdgeInsets.only(top: 40.0),
                height: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _avatarurl!=null?CachedImageView(50.0, 50.0, _avatarurl):CachedImageView(50.0, 50.0, "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3968417432,4100418615&fm=26&gp=0.jpg"),
                    InkWell(
                      onTap: (){
                        // Navigator.of(context).push(new MaterialPageRoute(builder: (_){
                        //   return LoginView();
                        // },),);
                        NavigatorUtil.goLoginPage(context);
                        // ToastUtils.showToast(context, "去登陆");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_isLogin?_nickName:"去登陆"),
                      ),
                    ),
                    _isLogin?InkWell(onTap: (){
                      _loginOut();
                    },child: Container(child: Text('退出'),),):Container(),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 10),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            //加载内容
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _list[index];
              },
              //设置显示个数
              childCount: _list.length,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 300),
          ),
          // SliverGrid(
          //   //调整间距
          //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //       crossAxisSpacing: 10,
          //       maxCrossAxisExtent: 200,
          //       mainAxisSpacing: 10,
          //       childAspectRatio: 4.0),
          //   //加载内容
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) {
          //       return Container(
          //         //设置每个item的内容
          //         alignment: Alignment.center,
          //         color: Colors.orangeAccent,
          //         child: Text("$index"),
          //       );
          //     },
          //     childCount: 20, //设置个数
          //   ),
          // ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // eventBus.destroy();
  }
}
