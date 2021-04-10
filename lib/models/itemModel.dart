import 'package:flutter/cupertino.dart';

class ItemModel {
  String name = '';
  double factor = 1.0;
  int value = 0;
  int total = 0;
  int factorPor;
  Column columnDescrip;

  ItemModel({this.name, this.factor, this.factorPor, this.columnDescrip});
}
