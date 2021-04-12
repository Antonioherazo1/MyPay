import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';
import 'package:mi_pago/models/itemModel.dart';

class DroppDownCiclopago extends StatefulWidget {
  @override
  _DroppDownCiclopagoState createState() => _DroppDownCiclopagoState();
}

class _DroppDownCiclopagoState extends State<DroppDownCiclopago> {
  final List<String> cicloDePagoList = ['Semanal', 'Quincenal', 'Mensual'];

  String valueChoosen;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ' Periodo de Pago',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          DropdownButton(
            hint: Text('Elige una opcion'),
            //---------------------
            value: valueChoosen,
            //---------------------
            items: cicloDePagoList.map((valueItem) {
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
              String descripFactor = '''Horas
$newValue${'es'}''';

              setState(() {
                ItemData providerData = Provider.of<ItemData>(context);
                newValue == 'Semanal'
                    ? providerData.cicloPago = 56
                    : newValue == 'Semanal'
                        ? providerData.cicloPago = 112
                        : providerData.cicloPago = 224;
                //---------
                valueChoosen = newValue;
                if (providerData.ingresoFijoExist == false) {
                  final fixIncome = ItemModel(
                    name: 'Ingreso Fijo',
                    factor: 1,
                    factorPor: 1,
                    columnFactor: descripFactor,
                    itemFijo: true
                  );
                  providerData.indexIngFijo = providerData.incomeList.length;
                  providerData.ingresoFijoExist = true;
                  providerData.incomeList.add(fixIncome);
                } else {
                  int index = providerData.indexIngFijo;
                  print('valor index: $index');
                  providerData.incomeList[index].columnFactor = descripFactor;
                  providerData.updateItem(providerData.incomeList[index],
                      providerData.incomeList[index].value.toString());
                }
                // Incvocamos la funcion upDateItem de Provider para actualizar cambio de cicloPago
                providerData.updateItem(
                    providerData.incomeList[0],
                    providerData.cicloPago.toString());
                providerData.updateTotal();
              });
            },
            //---------------------
          ),
        ],
      ),
    );
  }
}
