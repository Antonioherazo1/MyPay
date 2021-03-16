import 'package:flutter/material.dart';
import '../widgets/itemIngresos.dart';

class Ingresos extends StatefulWidget {
  @override
  _IngresosState createState() => _IngresosState();
}

//var _categoryList = ['cat1', 'cat2', 'cat3'];

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
            Center(
              child: Container(
                height: 400.0,
                margin: EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ItemIngresos();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
