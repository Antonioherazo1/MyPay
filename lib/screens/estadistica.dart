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
    List<Map<String, dynamic>> cicloDataList;
    MonthDataModel monthData;
    if (provider.monthDataList.length > 0) {
      cicloDataList = provider.monthDataList[idMonthChoosenInt].ciclosDataList;
      monthData = provider.monthDataList[idMonthChoosenInt];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Visualización de Datos'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(height: 30.0, color: Colors.orange[300], thickness: 5.0),
              Text(
                'Pago total Mes Actual: \$ ${provider.sumMonthPagoTotal}',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Divider(height: 30.0, color: Colors.orange[300], thickness: 5.0),
              //-------------------------------
              //-------------------------------
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 450, minHeight: 10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.ciclosDataList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(
                          '${provider.frecPago.replaceAll("l", "")} ${index + 1}',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Total Devengados:  \$ ${provider.ciclosDataList[index].sumIncome}\nTotal Deducciones:  \$ ${provider.ciclosDataList[index].sumEgress}',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        trailing: Text(
                            ' Pago Total ${provider.frecPago.replaceAll("l", "")}: \n \$ ${provider.ciclosDataList[index].totalPago}',
                            style: TextStyle(fontWeight: FontWeight.w800)));
                  },
                ),
              ),
              Divider(height: 30.0, color: Colors.orange[300], thickness: 5.0),

              //-------------------------------
              //-------------------------------
              provider.monthDataList.length < 1
                  ? Text('')
                  : Column(
                      children: [
                        ListTile(
                          title: Text('Elige el mes',
                              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0)),
                          trailing: DropdownButton(
                            hint: Text('mes'),
                            value: idMonthChoosen,
                            items: provider.monthDataList.map((month) {
                              return DropdownMenuItem(
                                value: '${month.id}',
                                child: Text('${month.yearMonth}: ${month.id}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0)),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                idMonthChoosen = newValue;
                                idMonthChoosenInt = int.parse(idMonthChoosen);
                              });
                            },
                          ),
                        ),
                        Divider(height: 30.0, color: Colors.orange[300], thickness: 5.0),
                        Text(
                          'Pago total Mes: \$ ${monthData.totalPago}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 450, minHeight: 56.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: Provider.of<ItemData>(context)
                                .monthDataList[idMonthChoosenInt]
                                .ciclosDataList
                                .length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(
                                    '${monthData.frecPago.replaceAll("l", "")} ${index + 1}',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'Total Devengados:  \$ ${cicloDataList[index]['sumIncome']}\nTotal Deducciones:  \$ ${cicloDataList[index]['sumEgress']}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  trailing: Text(
                                      ' Pago Total ${monthData.frecPago.replaceAll("l", "")}: \n \$ ${cicloDataList[index]['totalPago']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800)));
                            },
                          ),
                        ),
                        Divider(height: 30.0, color: Colors.orange[300], thickness: 5.0),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
