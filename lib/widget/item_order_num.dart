import 'package:flutter/material.dart';

class ItemOrderNum extends StatefulWidget {
  var orderNum;

  ItemOrderNum(this.orderNum);

  @override
  _ItemOrderNumState createState() => _ItemOrderNumState();
}

class _ItemOrderNumState extends State<ItemOrderNum> {
  var orderNum;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderNum = widget.orderNum;
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Icon(Icons.indeterminate_check_box),
          Text('Mall'),
        ],),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Text('订单编号:$orderNum'),
          Icon(Icons.arrow_right_alt,size:15.0),
        ],),
      )
    ],),);
  }
}
