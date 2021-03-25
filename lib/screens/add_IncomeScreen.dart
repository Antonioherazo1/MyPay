import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_pago/models/incomeData.dart';
import 'package:provider/provider.dart';

class AddIncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newNameIncome = 'Default';
    double newFactorIncome = 1.0;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'AÑADIR NUEVO INGRESO',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, right: 30.0),
                  child: Text(
                    'NOMBRE',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: TextField(
                      style: TextStyle(fontSize: 20.0),
                      autofocus: true,
                      textAlign: TextAlign.center,
                      onChanged: (newName) {
                        newNameIncome = newName;
                      },
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, right: 30.0),
                  child: Text(
                    'FACTOR',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20.0),
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (newFactor) =>
                        newFactorIncome = double.parse(newFactor),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: FlatButton(
                color: Colors.lightBlueAccent,
                child: Text('Añadir',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  print(newNameIncome);
                  print(newFactorIncome);
                  Provider.of<IncomeData>(context)
                      .addIncome(newNameIncome, newFactorIncome);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
