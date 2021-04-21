import 'package:mi_pago/models/itemModel.dart';

class CicloDataModel {
  List<ItemModel> incomeList;
  List<ItemModel> egressList;
  DateTime date;
  String dateString;
  int total;

  CicloDataModel({this.incomeList, this.egressList, this.date, this.total, this.dateString});
}
