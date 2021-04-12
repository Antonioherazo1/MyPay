import 'package:flutter/material.dart';
import 'package:mi_pago/widgets/addNewItemButtom.dart';
import 'package:mi_pago/widgets/itemList.dart';

class Ingresos extends StatefulWidget {
  @override
  _IngresosState createState() => _IngresosState();
}

class _IngresosState extends State<Ingresos> {
  var txt = TextEditingController();
  var txt2 = TextEditingController();
  int valueUnitar = 0;

  @override
  void initState() {
    super.initState();
    // Provider.of<IncomeData>(context).addIncome('wwww', 1.2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Ingresos',
            style: TextStyle(fontFamily: 'Dalgona'),
          ),
          automaticallyImplyLeading: false),
      body: Container(
        child: Column(
          children: [ItemList(income: true), AddNewItemButtom(tipo: 'INGRESO')],
        ),
      ),
    );
  }
}
