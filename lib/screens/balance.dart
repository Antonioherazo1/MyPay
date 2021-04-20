import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';

class BalanceGeneral extends StatefulWidget {
  @override
  _BalanceGeneralState createState() => _BalanceGeneralState();
}

class _BalanceGeneralState extends State<BalanceGeneral> {
  List<String> names = ['name1', 'name2', 'name3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Balance General',
            style: TextStyle(fontFamily: 'Dalgona'),
          ),
          automaticallyImplyLeading: false),
      body: Container(
        padding: EdgeInsets.all(30.0),
        // Main Container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 0.0),
                    child: Text('Ingresos',
                        style:
                            TextStyle(fontSize: 20.0, fontFamily: 'Dalgona')),
                  ),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 200, minHeight: 56.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            Provider.of<ItemData>(context).incomeList.length,
                        itemBuilder: (context, index) {
                          return BalanceITEM(
                              name: Provider.of<ItemData>(context)
                                  .incomeList[index]
                                  .name,
                              value: Provider.of<ItemData>(context)
                                  .incomeList[index]
                                  .total,
                              titleBold: false);
                        }),
                  ),
                  BalanceITEM(
                      name: 'Total Ingresos: ',
                      value: Provider.of<ItemData>(context).sumIncome,
                      titleBold: true),
                  // Container of the list of widgets with the information of Income and Egress
                  Divider(height: 20.0, thickness: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 0.0),
                    child: Text('Egresos',
                        style:
                            TextStyle(fontSize: 20.0, fontFamily: 'Dalgona')),
                  ),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 200, minHeight: 56.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            Provider.of<ItemData>(context).egressList.length,
                        itemBuilder: (context, index) {
                          return BalanceITEM(
                            name: Provider.of<ItemData>(context)
                                .egressList[index]
                                .name,
                            value: Provider.of<ItemData>(context)
                                .egressList[index]
                                .total,
                            titleBold: false,
                          );
                        }),
                  ),
                  BalanceITEM(
                    name: 'Total Egresos: ',
                    value: Provider.of<ItemData>(context).sumEgress,
                    titleBold: true,
                  ),
                ],
              ),
            ),
            RaisedButton(
                padding: EdgeInsets.all(30.0),
                child: Text('Guardar valores del Ciclo',
                    style: TextStyle(color: Colors.white70, fontSize: 26.0)),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class BalanceITEM extends StatelessWidget {
  String name;
  int value;
  bool titleBold = false;
  BalanceITEM({this.name, this.value, this.titleBold});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: 350.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.yellow[50], Colors.yellow[200]]),
          border: Border.all(
            color: Colors.yellow[800],
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$name : ',
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  fontWeight: titleBold ? FontWeight.bold : null)),
          Text('$value', style: TextStyle(fontSize: 20.0))
        ],
      ),
    );
  }
}
