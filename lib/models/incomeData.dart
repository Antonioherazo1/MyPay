import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mi_pago/models/income.dart';

class IncomeData extends ChangeNotifier {
  List<Income> nameTipoIngresos = [
    Income(name: 'Extras Dirunas'),
  ];

  void addIncome(String newNameIncome, double newFactorincome) {
    final income = Income(name: newNameIncome, factor: newFactorincome);
    nameTipoIngresos.add(income);
    notifyListeners();
  }

  void updateIncome(Income income, String value) {
    double factor = income.factor;
    int valueInt = int.parse(value);
    income.total = (valueInt * factor).toInt();
    notifyListeners();
  }
}
