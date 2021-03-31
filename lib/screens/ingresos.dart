import 'package:flutter/material.dart';
import 'package:mi_pago/widgets/newIncomeButtom.dart';
import 'package:mi_pago/widgets/income_List.dart';
import 'package:mi_pago/widgets/valor_unitario.dart';

class Ingresos extends StatefulWidget {
  @override
  _IngresosState createState() => _IngresosState();
}

class _IngresosState extends State<Ingresos> {
  var txt = TextEditingController();
  var txt2 = TextEditingController();
  int valueUnitar = 0;
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
          children: [
            ValorUnitario(txt: txt),
            //-------------List Builder -----------//
            Income_List(),
            //-------------List Builder -----------//
            NewIncomeButtom()
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
