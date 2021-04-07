import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mi_pago/models/itemModel.dart';

class ItemData extends ChangeNotifier {
  List cicloDePago = ['Semanal', 'Quincenal', 'Mensual'];
  List<ItemModel> incomeList = [];
  List<ItemModel> egressList = [];
  int horasLaboralesDiarias = 8;
  int valorUnitario = 0;
  int totalizador = 0;
  int sumIncome = 0;
  int sumEgress = 0;
  String dropDownChoosenValue;

  void addItem(String newNameItem, double newFactorItem, String tipo,
      String factorMultiplicaA) {
    //Se crea un objeto tipo ItemModel y se le
    // pasan los parametros desde el constructor
    final newItem = ItemModel(
        name: newNameItem,
        factor: newFactorItem,
        factorMultiplicaA: factorMultiplicaA);
    // se elige a que lista se agrega el nuevo
    //item a Ingresos o a Egresos
    if (tipo == 'INGRESO') {
      incomeList.add(newItem);
    } else {
      egressList.add(newItem);
    }
    //se notifican los Consumidores del provider
    notifyListeners();
  }

  void updateItem(ItemModel income, String value) {
    double factor = income.factor;
    int valueInt = int.parse(value);
    int factorrMultiplicaA;
    //--Traducir el "factorMultiplicaA" de String a su equivalente en números ----------
    if (income.factorMultiplicaA == 'Valor hora') {
      factorrMultiplicaA = 1;
    } else if (income.factorMultiplicaA == 'Valor dia') {
      factorrMultiplicaA = 8;
    } else {
      factorrMultiplicaA = this.totalizador;
    }
    //------------------
    income.value = valueInt;
    income.total =
        (valueInt * factor * valorUnitario * factorrMultiplicaA).toInt();
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
    sumIncome = 0;
    sumEgress = 0;
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
