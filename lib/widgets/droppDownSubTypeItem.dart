import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';

class DroppDownSubTypeItem extends StatefulWidget {

  @override
  _DroppDownSubTypeItemState createState() => _DroppDownSubTypeItemState();
}

class _DroppDownSubTypeItemState extends State<DroppDownSubTypeItem> {
  List<String> subTypeItem = [
    '''Cantidad 
Fija''',
    '''Fracción 
Ingresos 
del ciclo''',
    '''Fracción 
Ingresos 
mensuales 
Exedidos'''
  ];

  String valueChoosen;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ' TIPO EGRESO:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          DropdownButton(
            hint: Text('Elige una opcion'),
            //---------------------
            value: valueChoosen,
            //---------------------
            items: subTypeItem.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Container(
                  width: 150.0,
                  child: Text(valueItem),
                ),
              );
            }).toList(),
            //---------------------
            onChanged: (newValue) {
              setState(() {
                // Provider.of<ItemData>(context).factorPor = newValue;
                Provider.of<ItemData>(context).subTypeItem = newValue;
                valueChoosen = newValue;
              });
            },
            //---------------------
          ),
        ],
      ),
    );
  }
}