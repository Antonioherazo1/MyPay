import 'package:flutter/material.dart';

class DroppDownList extends StatefulWidget {
  List listItem;
  DroppDownList({this.listItem});

  @override
  _DroppDownListState createState() => _DroppDownListState();
}

class _DroppDownListState extends State<DroppDownList> {
  String valueChoose;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        hint: Text('Elige una opcion'),
        //---------------------
        value: valueChoose,
        //---------------------
        items: widget.listItem.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
        //---------------------
        onChanged: (newValue) {
          setState(() {
            valueChoose = newValue;
          });
        },
        //---------------------
      ),
    );
  }
}
