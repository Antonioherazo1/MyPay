import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mi_pago/models/itemModel.dart';

class ItemData extends ChangeNotifier {
  List cicloDePago = ['Semanal', 'Quincenal', 'Mensual'];
  List<ItemModel> incomeList = [];
  List<ItemModel> egressList = [];
  int valorUnitario = 0;
  int totalizador = 0;
  int diasCicloPago;

  void addItem(String newNameItem, double newFactorItem, bool incomee) {
    final income = ItemModel(name: newNameItem, factor: newFactorItem);
    if (incomee) {
      incomeList.add(income);
    } else {
      egressList.add(income);
    }
    notifyListeners();
  }

  void updateItem(ItemModel income, String value) {
    double factor = income.factor;
    int valueInt = int.parse(value);
    income.value = valueInt;
    income.total = (valueInt * factor * valorUnitario).toInt();
    updateTotal();
  }

  void updateValorUnit(int valorUnitario) {
    this.valorUnitario = valorUnitario;
    incomeList.forEach((income) {
      int producto = (valorUnitario * income.value * income.factor).toInt();
      income.total = producto;
      updateTotal();
    });
    egressList.forEach((egress) {
      int producto = (valorUnitario * egress.value * egress.factor).toInt();
      egress.total = producto;
      updateTotal();
    });
  }

  void updateTotal() {
    int sumIncome = 0;
    int sumEgress = 0;
    incomeList.forEach((income) {
      sumIncome += income.total;
    });
    egressList.forEach((egress) {
      sumEgress += egress.total;
    });
    totalizador = sumIncome - sumEgress;
    notifyListeners();
  }
}
