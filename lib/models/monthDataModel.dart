import 'package:mi_pago/models/cicloDataModel.dart';

class MonthDataModel {
  List<Map<String, dynamic>> ciclosDataList;
  int id;
  String yearMonth;
  int sumIncomesMonth;
  int totalPago;

  MonthDataModel(
      {this.ciclosDataList,
      this.yearMonth,
      this.sumIncomesMonth,
      this.totalPago,
      this.id});

  Map toJson() => {
        'ciclosDataList': ciclosDataList,
        'yearMonth': yearMonth,
        'sumIncomesMonth': sumIncomesMonth,
        'totalPago': totalPago,
        'id': id
      };
}
