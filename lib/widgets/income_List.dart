import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/incomeData.dart';
import 'itemIngresos.dart';

class Income_List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<IncomeData>(
      builder: (context, incomeData, child) {
        return Center(
          child: Container(
              height: 500.0,
              margin: EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: incomeData.nameTipoIngresos.length,
                  itemBuilder: (context, index) {
                    return ItemIngresos(
                        income: incomeData.nameTipoIngresos[index],
                        textFieldCallback: (newValue) {
                          incomeData.updateIncome(
                              incomeData.nameTipoIngresos[index], newValue);
                        });
                  })),
        );
      },
    );
  }
}
