class ChartItem {
  dynamic id;
  dynamic value;

  ChartItem({this.id, this.value});

  Map<String, dynamic> toMap() => {
        'id': id,
        'value': value,
      };


}
