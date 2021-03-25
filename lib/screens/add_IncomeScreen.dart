import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddIncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    onEditingComplete: () => {},
                  ),
                ),
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
                    onEditingComplete: () => {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: FlatButton(
                  onPressed: () {},
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'Añadir',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
