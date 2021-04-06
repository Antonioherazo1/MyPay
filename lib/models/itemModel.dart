class Item_Model {
  String name;
  double factor;
  int value = 0;
  int total = 0;

  Item_Model({this.name, this.factor =1.0});

  void computeIncome() {
    total = value*factor.toInt();    
  }
}
