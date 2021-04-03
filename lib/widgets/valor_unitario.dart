import 'package:flutter/material.dart';
import 'package:mi_pago/models/incomeData.dart';
import 'package:provider/provider.dart';

class ValorUnitario extends StatelessWidget {
  // const ValorUnitario({
  //   Key key,
  //   @required this.txt,
  // }) : super(key: key);

  final TextEditingController txt = TextEditingController();  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Valor Hora:  \$ ',
            style:
                TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
        SizedBox(
          width: 100.0,
          height: 50.0,
          child: TextField(
            style:
            TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            controller: txt,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<IncomeData>(context)
                  .updateValorUnit(int.parse(value));
            },
          ),
        ),
      ],
    );
  }
}