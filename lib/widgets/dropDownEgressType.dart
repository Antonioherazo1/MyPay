import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';

class DroppDownEgressType extends StatefulWidget {
  @override
  _DroppDownEgressTypeState createState() => _DroppDownEgressTypeState();
}

class _DroppDownEgressTypeState extends State<DroppDownEgressType> {
  List<String> factorPorEgresos = [
    'Cantidad Fija',
    'Fracción Ingresos del ciclo',
    'Fracción Ingresos mensuales Exedidos'
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
                // Provider.of<ItemData>(context).factorPor = newValue;
                Provider.of<ItemData>(context).egressType = newValue;
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
