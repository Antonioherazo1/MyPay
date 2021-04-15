import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_pago/models/itemData.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/widgets/dropDownEgressType.dart';
import 'package:mi_pago/models/itemModel.dart';

class AddItemScreen extends StatefulWidget {
  String tipo;
  double newFactorItem = 1.0;

  AddItemScreen({this.tipo});

  @override
  _AddIncomeScreenState createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddItemScreen> {
  String newNameItem = 'Default';
  int dropDwnFactorNewValue = 1;
  String middleItemDescrip = '';
  String cantidadFija = '''Cantidad 
Fija''';

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
            //--------------TextField Elegir Nombre ------------
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
                      // autofocus: true,
                      textAlign: TextAlign.center,
                      onChanged: (newName) {
                        newNameItem = newName;
                      },
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: widget.tipo == 'EGRESO'
                  ? Column(
                      children: [
                        DroppDownEgressType(), //---DropDwon Elegir Tipo Egreso
                        //Si es elegida "Catidad Fija" no se muestra el TextField 'FACTOR'
                        Provider.of<ItemData>(context).egressType == cantidadFija                                
                            ? Text('')
                            : TFieldFactorWidget(widget: widget),//---TextField Elegir Factor                                 
                      ],
                    )
                  : TFieldFactorWidget(widget: widget),
            ),
            //-------- FlatButton Añadir --------
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
                  // Se traduce la opción seleccionada de opción tipo String
                  // a su valor equivalente en Entero
                  dropDwnFactorNewValue = parseIntFactorPor(
                      Provider.of<ItemData>(context).egressType,
                      Provider.of<ItemData>(context).sumIncome);
                  // se procede a crear el String que describe el factor del item
                  // llamando la funcion factorDescripCreator
                  middleItemDescrip = miiddleItemDescrip(
                      widget.tipo,
                      Provider.of<ItemData>(context).egressType,
                      widget.newFactorItem);
                  //Se procede a añadir el nuevo item con los datos listos,
                  //dependiendo del tipo de item Income o Egress
                  //
                  //
                  final newItem = ItemModel(
                    itemType: widget.tipo == 'INGRESO'? 1:-1,
                    itemFijo: false,
                    name: newNameItem,
                    factor: widget.newFactorItem,
                    middleItemDescrip: middleItemDescrip,
                    );
                  widget.tipo == 'EGRESO'
                      ? Provider.of<ItemData>(context).egressList.add(newItem)                    
                      : Provider.of<ItemData>(context).incomeList.add(newItem);
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

class TFieldFactorWidget extends StatelessWidget {
  const TFieldFactorWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final AddItemScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 30.0),
          child: Text(
            'FACTOR',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 20.0),
            // autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newValue) =>
                widget.newFactorItem = double.parse(newValue),
          ),
        ),
      ],
    );
  }
}

int parseIntFactorPor(String factorPorString, int sumIncome) {
  int factorPorInt = 1;
  factorPorString == 'EGRESO'
      ? factorPorString == 'Valor hora'
          ? factorPorInt = 1
          : factorPorString == 'Valor día'
              ? factorPorInt = 8
              : factorPorInt = sumIncome
      // ignore: unnecessary_statements
      : null;
  return factorPorInt;
}

String miiddleItemDescrip(
  String tipo,
  String factorPor,
  double factor,
) {
  String factorDescrip = '';
  tipo == 'EGRESO'
      ? factorDescrip = '''$factor por
$factorPor'''
      : factorDescrip = '$factor';
  return factorDescrip;
}
