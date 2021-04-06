import 'package:flutter/material.dart';
import 'package:mi_pago/models/itemData.dart';
import 'package:provider/provider.dart';

class ValorUnitario extends StatefulWidget {
  final String initValue;
  ValorUnitario({this.initValue});

  @override
  _ValorUnitarioState createState() => _ValorUnitarioState();
}

class _ValorUnitarioState extends State<ValorUnitario> {
  var txtController = TextEditingController();

  @override
  void initState() {
    super.initState();

    txtController.text = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Valor Hora:  \$ ',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
        SizedBox(
          width: 100.0,
          height: 50.0,
          child: TextField(
            controller: txtController,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<ItemData>(context)
                  .updateValorUnit(int.parse(value));
            },
          ),
        ),
      ],
    );
  }
}
