import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';
import 'itemCreator.dart';
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Totalizador(total: itemData.totalizador),
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 450, minHeight: 56.0),
                  // height: 450.0,
                  // margin: EdgeInsets.all(10.0),
                  child: ListView.builder(
                      itemCount: income
                          ? itemData.incomeList.length
                          : itemData.egressList.length,
                      itemBuilder: (context, index) {
                        return
                            income ?
                            ItemCreator(
                                initValue:
                                    '${itemData.incomeList[index].value}',
                                item: itemData.incomeList[index],
                                textFieldCallback: (newValue) {
                                  itemData.incomeList[index].value = int.parse(newValue) ;
                                  itemData.updateItem();
                                  // itemData.updateItem(itemData.incomeList[index], newValue);
                                })
                        : ItemCreator(initValue: '${itemData.egressList[index].value}',
                                item:itemData.egressList[index],
                                textFieldCallback: () {});
                      })),
            ],
          ),
        );
      },
    );
  }
}
