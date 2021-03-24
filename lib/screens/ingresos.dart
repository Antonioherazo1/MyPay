import 'package:flutter/material.dart';
import '../widgets/itemIngresos.dart';

class Ingresos extends StatefulWidget {
  @override
  _IngresosState createState() => _IngresosState();
}

class _IngresosState extends State<Ingresos> {
  List<String> nameTipoIngresos = [
    'Extras Dirunas',
    'Recargos Nocturnos',
    'Diurnas Festivas',
    'Extras Dominicales'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Ingresosss',
            style: TextStyle(fontFamily: 'Dalgona'),
          ),
          automaticallyImplyLeading: false),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                  height: 400.0,
                  margin: EdgeInsets.all(10.0),
                  child: ListView.builder(
                      itemCount: nameTipoIngresos.length,
                      itemBuilder: (context, index) {
                        return ItemIngresos(
                            title: '${nameTipoIngresos[index]}');
                      })),
            ),
            FlatButton(
              onPressed: () {
                String NewType = 'NewType' + '${nameTipoIngresos.length + 1}';
                setState(() {
                  nameTipoIngresos.add(NewType);
                });
              },
              child: Text(
                'Nuevo Tipo de Ingreso',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
