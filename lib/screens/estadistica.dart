import 'package:flutter/material.dart';
import 'package:mi_pago/models/cicloDataModel.dart';
import 'package:mi_pago/models/itemData.dart';
import 'package:mi_pago/models/monthDataModel.dart';
import 'package:provider/provider.dart';

class Estadistica extends StatefulWidget {
  @override
  _EstadisticaState createState() => _EstadisticaState();
}

class _EstadisticaState extends State<Estadistica> {
  String idMonthChoosen = '0';
  String idCicleChoosen = '0';
  int idMonthChoosenInt = 0;
  int idCicleChoosenInt = 0;

  @override
  Widget build(BuildContext context) {
    ItemData provider = Provider.of<ItemData>(context);
    List<Map<String, dynamic>> cicloDataList =
        provider.monthDataList[idMonthChoosenInt].ciclosDataList;
    MonthDataModel monthData = provider.monthDataList[idMonthChoosenInt];
    return Scaffold(
        appBar: AppBar(
          title: Text('Visualización de Datos'),
        ),
        body: Container(
          child: Column(
            children: [
              ListTile(
                  title: Text('Elige el mes',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                  trailing: DropdownButton(
                    hint: Text('mes'),
                    value: idMonthChoosen,
                    items: provider.monthDataList.map((month) {
                      return DropdownMenuItem(
                        value: '${month.id}',
                        child: Text('${month.yearMonth}: ${month.id}',
                            style: TextStyle(fontWeight: FontWeight.w800)),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        idMonthChoosen = newValue;
                        idMonthChoosenInt = int.parse(idMonthChoosen);
                      });
                    },
                    //---------------------
                  )),
              Text(
                'Pago total Mes: \$ ${monthData.totalPago}',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 450, minHeight: 56.0),
                  child: ListView.builder(
                      itemCount: Provider.of<ItemData>(context)
                          .monthDataList[idMonthChoosenInt]
                          .ciclosDataList
                          .length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(
                              '${monthData.frecPago.replaceAll("l", "")} ${index + 1}',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Total Devengados:  \$ ${cicloDataList[index]['sumIncome']}\nTotal Deducciones:  \$ ${cicloDataList[index]['sumEgress']}',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            trailing: Text(
                                ' Pago Total ${monthData.frecPago.replaceAll("l", "")}: \n \$ ${cicloDataList[index]['totalPago']}',
                                style: TextStyle(fontWeight: FontWeight.w800)));
                      }))
            ],
          ),
        ));
  }
}
