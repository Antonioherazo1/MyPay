import 'package:flutter/material.dart';
import 'package:mi_pago/widgets/totalizador.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';

class BalanceGeneral extends StatefulWidget {
  @override
  _BalanceGeneralState createState() => _BalanceGeneralState();
}

class _BalanceGeneralState extends State<BalanceGeneral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Balance General',
            style: TextStyle(fontFamily: 'Dalgona'),
          ),
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        //-------Main Container------
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //--- Pago total --------
                  Totalizador(
                    total: Provider.of<ItemData>(context).totalizador,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 0.0),
                    // --- Tìtulo Ingresos ----
                    child: Text('Ingresos'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  //------- Lista Ingresos ------
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
                  //---Total Ingresos ------
                  BalanceITEM(
                      name: 'Total Ingresos: ',
                      value: Provider.of<ItemData>(context).sumIncome,
                      titleBold: true),
                  // ---Linea Divisoria-----
                  Divider(height: 15.0, thickness: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 0.0),
                    //--- Titulo Egresos -----
                    child: Text('Egresos'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  //------- Lista De Ingresos ------
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
                  // ---- Total Egresos -----
                  BalanceITEM(
                    name: 'Total Egresos: ',
                    value: Provider.of<ItemData>(context).sumEgress,
                    titleBold: true,
                  ),
                ],
              ),
            ),
            // --- Boton Guardar Datos de Ciclo ----
            Container(
              padding: EdgeInsets.only(top: 20.0),
              width: double.infinity,
              height: 60.0,
              child: RaisedButton(
                  child: Text('Guardar valores del Ciclo',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 24.0)),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    //--- ventana Emergente GUARDAR CICLO PAGO----
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: ' Se va a Guardar el \n',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                    TextSpan(
                                      text: ' Ciclo de Pago'.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.blue[300],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26.0),
                                    ),
                                  ],
                                ),
                              ),
                              content: Text(
                                'Confirma ?',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 26.0),
                              ),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Provider.of<ItemData>(context)
                                          .saveCiclo();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Aceptar',
                                        style: TextStyle(fontSize: 25.0))),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancelar',
                                        style: TextStyle(fontSize: 25.0)))
                              ],
                            ));
                  }),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              width: double.infinity,
              height: 60.0,
              child: RaisedButton(                  
                  child: Text('Guadar Datos Mes ',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 24.0)),
                  color: Colors.green[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: (){
                     //--- ventana Emergente GUARDAR DATOS MES----
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: ' Se va a Guardar el \n',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                    TextSpan(
                                      text: 'mes'.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.blue[300],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26.0),
                                    ),
                                  ],
                                ),
                              ),
                              content: Text(
                                'Confirma ?',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 26.0),
                              ),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Aceptar',
                                        style: TextStyle(fontSize: 25.0))),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancelar',
                                        style: TextStyle(fontSize: 25.0)))
                              ],
                            ));
                  }),
            ),
            
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

class PopUpWindowConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      
    );
  }
}
