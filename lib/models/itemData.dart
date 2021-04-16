// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mi_pago/models/itemModel.dart';

class ItemData extends ChangeNotifier {
  int horasLaboralesDiarias = 8;
  int valorUnitario = 0;
  int totalizador = 0;
  int sumIncome = 0;
  int sumEgress = 0;
  int cicloPago;
  bool ingresoFijoExist = false;
  String factorPo = 'Valor hora';
  int indexIngFijo = 0;
  String subTypeItem = '';

  List<ItemModel> incomeList = [];
  List<ItemModel> egressList = [];

  void addIncomeItem(ItemModel newItem) {
    // Se añade el nuevo item a Egresos
    incomeList.add(newItem);
    //se notifican los Consumidores del provider
    notifyListeners();
  }

  void addEgressItem(ItemModel newItem) {
    // Se añade el nuevo item a Egresos
    egressList.add(newItem);
    //se notifican los Consumidores del provider
    notifyListeners();
  }

  void updateItem(ItemModel item, String value) {
    double factor = item.factor;
    int valueInt = int.parse(value);
    //------------------
    item.value = valueInt;
    item.total = (valueInt * factor * valorUnitario).toInt();
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
