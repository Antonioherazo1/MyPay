import 'package:flutter/material.dart';
import 'package:mi_pago/widgets/itemList.dart';
import 'package:mi_pago/widgets/addNewItemButtom.dart';

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
            ItemList(income: false), 
            AddNewItemButtom(tipo: 'EGRESO')
          ],
        ),
      ),
    );
  }
}
