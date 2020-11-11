import 'package:flutter/material.dart';
import 'package:flutter_mall_self/entity/cart_all_entity.dart';

typedef OnNumberChange(int number);
typedef OnCheck(bool isChoose);

// ignore: must_be_immutable
class CartItemView extends StatefulWidget {
  CartAllDataCartList cartItem;
  StateSetter setBottomSheetState;
  CartItemView(this.cartItem,this.setBottomSheetState);

  @override
  _CartItemViewState createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  CartAllDataCartList cartItem;
  StateSetter setBottomSheetState;
  bool _isCheck = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartItem = widget.cartItem;
    setBottomSheetState = widget.setBottomSheetState;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      child: Container(
        child: Row(
          children: [
            Checkbox(
              value: _isCheck,
              activeColor: Colors.blue,
              onChanged: (bool val) {
                // val 是布尔值
                this.setState(() {
                  _isCheck = !_isCheck;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
