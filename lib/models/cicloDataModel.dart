import 'package:mi_pago/models/itemModel.dart';

class CicloDataModel {
  List<ItemModel> incomeList;
  List<ItemModel> egressList;
  DateTime fecha;
  int total;

  CicloDataModel({this.incomeList, this.egressList, this.fecha, this.total});
}
