import 'package:flutter/material.dart';
import 'package:mi_pago/screens/pantallaInicio.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantallaInicio(),
    );
  }
}

