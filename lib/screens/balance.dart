import 'package:flutter/material.dart';

class BalanceGeneral extends StatefulWidget {
  @override
  _BalanceGeneralState createState() => _BalanceGeneralState();
}

class _BalanceGeneralState extends State<BalanceGeneral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Balance General',
            style: TextStyle(fontFamily: 'Dalgona'),
          ),
          automaticallyImplyLeading: false),
    );
  }
}
