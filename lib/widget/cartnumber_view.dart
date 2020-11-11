import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

typedef OnNumberChange(int number);

class CartNumberView extends StatefulWidget {
  OnNumberChange onNumberChange;
  StateSetter setBottomSheetState;

  CartNumberView(this.setBottomSheetState, this.onNumberChange);

  @override
  _CartNumberViewState createState() => _CartNumberViewState();
}

class _CartNumberViewState extends State<CartNumberView> {
  var _currentNum = 1;
  StateSetter setBottomSheetState;
  OnNumberChange onNumberChange;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setBottomSheetState = widget.setBottomSheetState;
    onNumberChange = widget.onNumberChange;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setBottomSheetState(() {
                _currentNum++;
              });
              Toast.show('增加', context);
              onNumberChange(_currentNum);
            },
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              width: 20.0,
              height: 20.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: new Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                ),
              ),
              child: Text('+'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5.0,right: 5.0),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            height: 20.0,
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [Text("$_currentNum")],
            ),
          ),
          InkWell(
            onTap: () {
              setBottomSheetState(() {
                _currentNum--;
                // ignore: unnecessary_statements
                _currentNum <= 1 ? _currentNum = 1 : _currentNum;
              });
              Toast.show('减少', context);
              onNumberChange(_currentNum);
            },
            child: Container(
              width: 20.0,
              height: 20.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: new Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
              child: Text('-'),
            ),
          ),
        ],
      ),
    );
  }
}
