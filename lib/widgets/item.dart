import 'package:flutter/material.dart';
import 'package:mi_pago/models/itemModel.dart';

class Item extends StatefulWidget {
  final Item_Model item;
  final Function textFieldCallback;
  String initValue;

  Item({this.item, this.textFieldCallback, this.initValue});

  @override
  _ItemIngresosState createState() => _ItemIngresosState();
}

class _ItemIngresosState extends State<Item> {
  var txtController = TextEditingController();
  @override
  void initState() {
    super.initState();
    txtController.text = this.widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Container(
            height: 30.0,
            width: 300.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.yellow[50], Colors.yellow[200]]),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              border: Border.all(
                color: Colors.yellow[800],
                width: 2.0,
              ),
            ),
            child: Center(
              child: Text(
                '${widget.item.name}'.toUpperCase(),
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
          Container(
            height: 70.0,
            width: 350.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.yellow[200], Colors.yellow[600]]),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.yellow[800],
                width: 2.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child: TextField(
                    controller: txtController,
                    style: TextStyle(fontSize: 30.0),
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: widget.textFieldCallback,
                  ),
                ),
                Text('${widget.item.factor}'),
                Text("=", style: TextStyle(fontSize: 50.0)),
                Text('${widget.item.total}', style: TextStyle(fontSize: 40.0))
              ],
            ),
          )
        ],
      ),
    );
  }
}
