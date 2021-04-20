import 'package:flutter/material.dart';
import 'package:mi_pago/screens/archivos.dart';
import 'package:mi_pago/screens/sideMenu.dart';
import 'package:mi_pago/widgets/logoNameHeader.dart';
import 'package:mi_pago/screens/balance.dart';
import 'package:mi_pago/screens/tapBar.dart';
import 'package:mi_pago/screens/estadistica.dart';
import 'package:mi_pago/widgets/valor_unitario.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';
import 'package:mi_pago/widgets/dropDownCiclopago.dart';

class HomeScreem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Pago',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text(
              'Home',
              style: TextStyle(fontFamily: 'Dalgona'),
            ),
          ),
          drawer: SideMenu(),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  LogoNameWidget(),
                  ValorUnitario(
                      initValue:
                          '${Provider.of<ItemData>(context).valorUnitario}'),
                  DroppDownCiclopago(),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 80.0,
                          width: 350.0,
                          margin: EdgeInsets.all(5.0),
                          child: RaisedButton(
                            padding: EdgeInsets.all(20.0),
                            color: Colors.green[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Text(
                              'Ingresos',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TapBarPage()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100.0,
                    width: 350.0,
                    margin: EdgeInsets.all(20),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BalanceGeneral()));
                      },
                      color: Colors.blue,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.account_balance,
                              color: Colors.white70,
                              size: 55.0,
                            ),
                          ),
                          Text(
                            'Balance General',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100.0,
                    width: 350.0,
                    margin: EdgeInsets.all(20),
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Estadistica()));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.assessment,
                              size: 55.0,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            'Estadística',
                            style: TextStyle(fontSize: 30, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100.0,
                    width: 350.0,
                    margin: EdgeInsets.all(20.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Archivos()));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.backup,
                              size: 55.0,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            'Archivos',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
