import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mi_pago/models/income.dart';

class IncomeData extends ChangeNotifier {
  List<Income> nameTipoIngresos = [];
  int valorUnitario = 0;
  int totalizador = 0;

  void addIncome(String newNameIncome, double newFactorincome) {
    final income = Income(name: newNameIncome, factor: newFactorincome);
    nameTipoIngresos.add(income);
    notifyListeners();
  }

  void updateIncome(Income income, String value) {
    double factor = income.factor;
    int valueInt = int.parse(value);
    income.value = valueInt;
    income.total = (valueInt * factor * valorUnitario).toInt();
    notifyListeners();
  }

  void updateValorUnit(int valorUnitario) {
    this.valorUnitario = valorUnitario;
    nameTipoIngresos.forEach((income) {
      income.total = valorUnitario * income.value * income.factor.toInt();
      notifyListeners();
    });
  }
}
