import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mi_pago/models/itemModel.dart';

class ItemData extends ChangeNotifier {
  List<Item_Model> nameTipoItem = [];
  int valorUnitario = 0;
  int totalizador = 0;

  void addIncome(String newNameIncome, double newFactorincome) {
    final income = Item_Model(name: newNameIncome, factor: newFactorincome);
    nameTipoItem.add(income);
    notifyListeners();
  }

  void updateItem(Item_Model income, String value) {
    double factor = income.factor;
    int valueInt = int.parse(value);
    income.value = valueInt;
    income.total = (valueInt * factor * valorUnitario).toInt();
    updateTotal();
    // notifyListeners();
  }

  void updateValorUnit(int valorUnitario) {
    this.valorUnitario = valorUnitario;
    nameTipoItem.forEach((income) {
      int producto = (valorUnitario * income.value * income.factor).toInt();
      income.total = producto;
      updateTotal();
      // notifyListeners();
    });
  }

  void updateTotal() {
    int sumatoria = 0;
    nameTipoItem.forEach((income) {
      sumatoria += income.total;
    });
    totalizador = sumatoria;
    notifyListeners();
  }
}
