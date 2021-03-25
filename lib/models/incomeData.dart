import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:mi_pago/models/incomes.dart';

class IncomeData extends ChangeNotifier {
  List<Income> nameTipoIngresos = [
    Income(name: 'Extras Dirunas'),
    Income(name: 'Recargos Nocturnos'),
    Income(name: 'Diurnas Festivas'),
    Income(name: 'Extras Dominicales')
  ];

  void addIncome(String newNameIncome, double newFactorincome) {
    final income = Income(name: newNameIncome, factor: newFactorincome);
    nameTipoIngresos.add(income);
    notifyListeners();
    // print('$newNameIncome $newFactorincome');
  }
}
