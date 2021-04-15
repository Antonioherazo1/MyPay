import 'package:flutter/material.dart';
import 'package:mi_pago/widgets/addNewItemButtom.dart';
import 'package:mi_pago/widgets/itemList.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';
import 'package:mi_pago/models/itemModel.dart';
import 'package:after_init/after_init.dart';

class Ingresos extends StatefulWidget {
  List<ItemModel> incomeList;

  @override
  _IngresosState createState() => _IngresosState();
}

class _IngresosState extends State<Ingresos> {
  var txt = TextEditingController();
  var txt2 = TextEditingController();
  int valueUnitar = 0;
  

  void didChangeDependencies() {
    // widget.incomeList = Provider.of<ItemData>(context)
    //     .incomeList
    //     .where((item) => item.itemType > 0)
    //     .toList();
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
