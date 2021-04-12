

class ItemModel {
  String name = '';
  double factor = 1.0;
  int value = 0;
  int total = 0;
  int factorPor;
  String columnFactor;
  bool itemFijo = false;

  ItemModel({this.name, this.factor, this.factorPor, this.columnFactor, this.itemFijo});
}
