import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';

class DroppDownFactorPor extends StatefulWidget {
  @override
  _DroppDownFactorPorState createState() => _DroppDownFactorPorState();
}

class _DroppDownFactorPorState extends State<DroppDownFactorPor> {
    List<String> factorPorEgresos = [
    'Valor hora',
    'Valor día',
    'Total ingresos'
  ];

  String valueChoosen;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ' FACTOR POR ? :',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          DropdownButton(
            hint: Text('Elige una opcion'),
            //---------------------
            value: valueChoosen,
            //---------------------
            items: factorPorEgresos.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Container(
                  width: 100.0,
                  child: Text(valueItem),
                ),
              );
            }).toList(),
            //---------------------
            onChanged: (newValue) {
              setState(() {
                Provider.of<ItemData>(context).factorPor =
                    newValue;
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
