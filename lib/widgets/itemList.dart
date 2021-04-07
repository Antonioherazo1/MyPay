import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';
import 'item.dart';
import 'package:mi_pago/widgets/totalizador.dart';

class ItemList extends StatelessWidget {
  final bool income;

  ItemList({this.income});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
      builder: (context, itemData, child) {
        return Center(
          child: Column(
            children: [
              Container(
                  height: 450.0,
                  margin: EdgeInsets.all(10.0),
                  child: ListView.builder(
                      itemCount: income ? itemData.incomeList.length: itemData.egressList.length ,
                      itemBuilder: (context, index) {
                        return income ? 
                        Item(initValue: '${itemData.incomeList[index].value}',
                              item:itemData.incomeList[index], 
                              textFieldCallback: (newValue) {
                                itemData.updateItem(itemData.incomeList[index], newValue);                                  
                              }) 
                      : Item(initValue: '${itemData.egressList[index].value}',
                              item:itemData.egressList[index], 
                              textFieldCallback: (newValue) {
                                itemData.updateItem(itemData.egressList[index], newValue);                                  
                              });
                        
                      })),
              Totalizador(total: itemData.totalizador),
            ],
          ),
        );
      },
    );
  }
}
