import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';
import 'item.dart';
import 'package:mi_pago/widgets/totalizador.dart';

class ItemList extends StatelessWidget {
  final TextEditingController txtController = TextEditingController();

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
                      itemCount: itemData.nameTipoItem.length,
                      itemBuilder: (context, index) {
                        return Item(
                          initValue: '${itemData.nameTipoItem[index].value}',
                          //---------------------------
                          item: itemData.nameTipoItem[index],
                          //---------------------------
                          textFieldCallback: (newValue) {
                            itemData.updateItem(
                                itemData.nameTipoItem[index], newValue);
                          },
                          //---------------------------
                            );
                      })),
              Totalizador(total: itemData.totalizador),
            ],
          ),
        );
      },
    );
  }
}
