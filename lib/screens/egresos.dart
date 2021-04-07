import 'package:flutter/material.dart';
import 'package:mi_pago/widgets/valor_unitario.dart';
import 'package:mi_pago/widgets/itemList.dart';
import 'package:mi_pago/widgets/addNewItemButtom.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';

class Egresos extends StatefulWidget {
  @override
  _EgresosState createState() => _EgresosState();
}

class _EgresosState extends State<Egresos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Egresos',
          style: TextStyle(
            fontFamily: 'Dalgona',
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          children: [
            ValorUnitario(initValue: '${Provider.of<ItemData>(context).valorUnitario}'), 
            ItemList(income: false), 
            AddNewItemButtom(income: false, tipo: 'EGRESO')
          ],
        ),
      ),
    );
  }
}
