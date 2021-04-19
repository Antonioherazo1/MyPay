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
    incomeList.add(newItem); // Se añade el nuevo item a Egresos
    notifyListeners(); //se notifican los Consumidores del provider
  }

  void addEgressItem(ItemModel newItem) {
    egressList.add(newItem); // Se añade el nuevo item a Egresos
    notifyListeners(); //se notifican los Consumidores del provider
  }

  void updateItem(ItemModel item, String value) {
    double factor = item.factor;
    int valueInt = int.parse(value);
    //Actualizamos Intem de ingresos
    item.value = valueInt;
    item.total = (valueInt * factor * valorUnitario).toInt();
    updateTotal();
    //Actualizar todos Item de egresos
    egressList.forEach(
      (egressItem) {
        egressItem.itemSubtypeInt == 2
            ? egressItem.total = (egressItem.factor * sumIncome).toInt()
            : egressItem.itemSubtypeInt == 3
                ? egressItem.total = 9999 // TO_DO
                : egressItem.total = egressItem.value;

        // Actulizamos las decripciones de cada ITEM de Egress
        egressItem.middleItemDescrip = updateDescripEgress(egressItem.itemType, egressItem.factor,
            egressItem.itemSubtypeInt, egressItem.value);
      },
    );
    updateTotal();
  }

  String updateDescripEgress(
      int tipo, double factor, int supTypeItemInt, int value) {
    String factorDescrip = '';
    tipo == 1
        ? factorDescrip = '''Por  $factor
Por Valor 
de la Hora''' // descripcion para ingresos
        : supTypeItemInt == 1
            ? factorDescrip = '$subTypeItem' // Descrip Egresos Fijos
            : supTypeItemInt == 2
                ? factorDescrip = '''$factor por
los Ingresos 
del ciclo: $sumIncome''' // descripcion Egresos Fraccion de Ingresos del ciclo
                : factorDescrip = '''$factor por
Ingresos Mensuales
exedidos en: $value '''; // descripcion Egresos Fraccion de Ingresos Mensuales exedidos
    return factorDescrip;
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
    print('sumincome: $sumIncome');
    egressList.forEach((egress) {
      sumEgress += egress.total;
    });
    print('SumEgress: $sumEgress');
    totalizador = sumIncome - sumEgress;
    notifyListeners();
  }
}
