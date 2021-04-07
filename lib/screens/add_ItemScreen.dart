import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_pago/models/itemData.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/widgets/dropDownList.dart';

class AddItemScreen extends StatefulWidget {
  String tipo;

  AddItemScreen({this.tipo});

  @override
  _AddIncomeScreenState createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddItemScreen> {
  List factorMultiplicaAEgre = ['Valor hora', 'Valor dia', 'Pago total'];
  String newNameIncome = 'Default';
  double newFactorIncome = 1.0;
  String valueChoosen = 'Valor hora';

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
            //-------Titulo Nuevo Item a agregar ------------
            Text(
              'AÑADIR NUEVO ${widget.tipo}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            //--------------Elegir Nombre ------------
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
            //-------------Elegir Factor -------------
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
            //---------------- Elegir "Factor por"--------------
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: widget.tipo == 'EGRESO'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text(
                            ' FACTOR POR ? :',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          DroppDownList(
                            listItem: factorMultiplicaAEgre,
                            callBackValueChoosen: (newValue) {
                              setState(() {
                                Provider.of<ItemData>(context)
                                    .dropDownChoosenValue = newValue;
                                valueChoosen = newValue;
                              });
                            },
                          )
                        ])
                  : null,
            ),
            //-------- Boton Añadir ---------------
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
                  Provider.of<ItemData>(context)
                      .addItem(newNameIncome, newFactorIncome, widget.tipo, valueChoosen);
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
