import 'package:flutter/material.dart';
import 'package:mi_pago/models/itemData.dart';
import 'package:provider/provider.dart';

class Estadistica extends StatefulWidget {
  @override
  _EstadisticaState createState() => _EstadisticaState();
}

class _EstadisticaState extends State<Estadistica> {
  List<String> listStrings = ['uno', 'dos', 'tres', 'cuatro'];
  String idMonthChoosen = '0';
  String idCicleChoosen = '0';
  int idMonthChoosenInt = 0;
  int idCicleChoosenInt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Visualización de Datos'),
        ),
        body: Container(
          child: Column(
            children: [
              ListTile(
                  title: Text('Elige el mes'),
                  trailing: DropdownButton(
                    hint: Text('mes'),
                    value: idMonthChoosen,
                    items: Provider.of<ItemData>(context)
                        .monthDataList
                        .map((month) {
                      return DropdownMenuItem(
                        value: '${month.id}',
                        child: Text('${month.yearMonth}: ${month.id}'),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        idMonthChoosen = newValue;
                        idMonthChoosenInt = int.parse(idMonthChoosen);
                        print('idMonthChoosen: $idMonthChoosenInt');
                        print(
                            ' datalist Length: ${Provider.of<ItemData>(context).monthDataList[idMonthChoosenInt].ciclosDataList.length}');
                      });
                    },
                    //---------------------
                  )),
              ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 450, minHeight: 56.0),
                  child: ListView.builder(
                      itemCount: Provider.of<ItemData>(context).monthDataList[idMonthChoosenInt].ciclosDataList.length,                      
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text('Ciclo de Pago ${index + 1}'),
                            subtitle: Text(
                                'Suma Devengos:  ${Provider.of<ItemData>(context).monthDataList[idMonthChoosenInt].ciclosDataList[index]['sumIncome']}'),
                            trailing: Text(
                                ' Pago: ${Provider.of<ItemData>(context).monthDataList[idMonthChoosenInt].yearMonth}'));
                      }))
            ],
          ),
        ));
  }
}
