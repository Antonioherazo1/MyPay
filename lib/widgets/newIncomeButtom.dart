import 'package:flutter/material.dart';
import '../screens/add_IncomeScreen.dart';

class NewIncomeButtom extends StatelessWidget {
  const NewIncomeButtom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.lightBlueAccent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Nuevo Ingreso',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddIncomeScreen(),
                )));
      },
    );
  }
}