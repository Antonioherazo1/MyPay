class Income {
  String name;
  double factor;
  int value;
  int total = 0;

  Income({this.name, this.factor =1.0});

  void computeIncome() {
    total = value*factor.toInt();    
  }
}
