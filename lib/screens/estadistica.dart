import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';
import 'package:mi_pago/models/cicloDataModel.dart';

class Estadistica extends StatefulWidget {
  @override
  _EstadisticaState createState() => _EstadisticaState();
}

class _EstadisticaState extends State<Estadistica> {
  List<String> lista1 = ['item1', 'item2', 'item3', 'item4', 'item5'];
  List<String> lista2 = ['item10', 'item20', 'item30', 'item40', 'item50'];
  String valChoosen1;
  String valChoosen2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estadistica'),
      ),
      body: Container(
        // child: ListView.builder(
        //   itemCount: Provider.of<ItemData>(context).ciclosDataList.length,
        //   itemBuilder: (context, index){
        //     ListView.builder(
        //       itemCount: Provider.of<ItemData>(context).ciclosDataList.
        //       itemBuilder: null)
        //   }
        //   ),

        child: DropdownButton(
          hint: Text('Elige el ciclo'),
          value: valChoosen1,
          // items: Provider.of<ItemData>(context).ciclosDataList.map((ciclo) {
          items: lista1.map((e){
            return DropdownMenuItem(
              // value: ciclo.date,
              value: e,
              child: Expanded(
                // width: 150.0,
              // child: Text('${ciclo.dateString} - \$ ${ciclo.total}'),
              child: Text('$e'),
              ),
            );
          }).toList(),
          //---------------------
          onChanged: (newValue) {
            setState(() {
              valChoosen1 = newValue;
            });
          },
          //---------------------
        ),
      ),
    );
  }
}
