import 'package:flutter/material.dart';
import 'package:flutter_mall_self/page/classification/classification_page.dart';
import 'package:flutter_mall_self/page/main/home_main.dart';
import 'package:flutter_mall_self/utils/event_bus.dart';

import '../cart/cart_page.dart';
import '../my/mine_page.dart';

class MallPage extends StatefulWidget {
  @override
  _MallPageState createState() => _MallPageState();
}

class _MallPageState extends State<MallPage> {
  List<Widget> _list = List();
  var _selectIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listener();
    _list = [
      HomeMain(),
      ClassificationPage(),
      CartPage(),
      MinePage(),
    ];
    _list..add(Text('首页'))..add(Text('分类'))..add(Text('购物车'))..add(Text('我的'));
  }

  void _onItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
  void _listener(){
    eventBus.on<NotiEvent>().listen((event) {
      setState(() {
        _selectIndex = event.index;
        print("eventBus通知当前索引$_selectIndex");
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('mall'),
      // ),
      body: IndexedStack(
        index: _selectIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            activeIcon: Icon(Icons.category),
            title: Text('分类'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            activeIcon: Icon(Icons.shopping_cart),
            title: Text('购物车'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person),
            title: Text('我的'),
          ),
        ],
        currentIndex: _selectIndex,
        onTap: _onItem,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
