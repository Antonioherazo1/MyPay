import 'package:flutter/material.dart';
import 'package:mi_pago/models/itemData.dart';
import 'package:provider/provider.dart';

class DroppDownList extends StatefulWidget {
  List listItem;
  Function callBackValueChoosen;
  DroppDownList({this.listItem, this.callBackValueChoosen});

  @override
  _DroppDownListState createState() => _DroppDownListState();
}

class _DroppDownListState extends State<DroppDownList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        hint: Text('Elige una opcion'),
        //---------------------
        value: Provider.of<ItemData>(context).dropDownChoosenValue,
        //---------------------
        items: widget.listItem.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
        //---------------------
        onChanged: widget.callBackValueChoosen,
        //---------------------
      ),
    );
  }
}
