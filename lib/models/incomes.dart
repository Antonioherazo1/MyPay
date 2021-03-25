class Income {
  String name;
  double factor;
  int value;
  int total;
   

  Income({this.value, this.name, this.factor = 1.0});

  void computeIncome() {
    total = (value * factor).toInt();
  }
}
