class ItemModel {
  int itemType;
  int itemSubtypeInt = 1;
  String name = '';
  double factor = 1.0;
  bool fixIncome = false;
  String middleItemDescrip;
  int value = 0;
  int total = 0;

  ItemModel(
      {this.itemType,
      this.itemSubtypeInt,
      this.name,
      this.factor,
      this.middleItemDescrip,
      this.value,
      this.total,
      this.fixIncome
      });
}
