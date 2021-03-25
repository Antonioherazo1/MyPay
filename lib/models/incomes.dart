class Income {
  int value;
  String name;
  double factor;

  Income({this.value, this.name, this.factor = 1.0});

  int computeIncome() {
    return (value * factor).toInt();
  }
}