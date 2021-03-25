import 'package:flutter/material.dart';
import '../screens/add_IncomeScreen.dart';
import 'package:mi_pago/widgets/income_List.dart';

class Ingresos extends StatefulWidget {
  @override
  _IngresosState createState() => _IngresosState();
}

class _IngresosState extends State<Ingresos> {
  

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
            //-------------List Builder -----------//
            Income_List(),
            //-------------List Builder -----------//
            FlatButton(
              color: Colors.lightBlueAccent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Nuevo Ingreso',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                            child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: AddIncomeScreen(),
                        )));
              },

            )
          ],
        ),
      ),
    );
  }
}


                // String NewType = 'NewType' + '${nameTipoIngresos.length + 1}';
                // setState(() {
                //   nameTipoIngresos.add(NewType);
                // });