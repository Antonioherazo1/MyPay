class ItemModel {
  int itemType; 
  bool itemFijo = false;
  String name = '';
  double factor = 1.0;
  String middleItemDescrip;
  int value = 0;
  int total = 0;

  ItemModel({this.itemType, this.itemFijo, this.name,this.factor, this.middleItemDescrip});
}
