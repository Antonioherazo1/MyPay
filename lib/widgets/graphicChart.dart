import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pago/models/itemData.dart';
import 'package:mi_pago/models/chartItemModel.dart';
import 'dart:math';

class GraficChart extends StatefulWidget {
  @override
  _GraficChartState createState() => _GraficChartState();
}

class _GraficChartState extends State<GraficChart> {
  var data;

  @override
  void initState() {
    super.initState();
    var r = Random();
    data = List<double>.generate(30, (i) => r.nextDouble() * 1500);
  }

  _onSelectionChanged(SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    var time;
    final measures = <String, double>{};

    if (selectedDatum.isNotEmpty) {
      time = selectedDatum.first.datum;
      selectedDatum.forEach((SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ChartItem> list = Provider.of<ItemData>(context).charItemsList;

    List<Series<double, num>> series = [
      Series<double, int>(
          id: 'Sales',
          colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
          domainFn: (value, index) => index,
          measureFn: (value, _) => value,
          data: data,
          strokeWidthPxFn: (_, __) => 4)
    ];

    return LineChart(
      series,
      animate: false,
      selectionModels: [
        SelectionModelConfig(
          type: SelectionModelType.info,
          changedListener: _onSelectionChanged,
        )
      ],
      domainAxis: NumericAxisSpec(
        tickProviderSpec: StaticNumericTickProviderSpec(
          [
            TickSpec(0, label: '01'),
            TickSpec(4, label: '05'),
            TickSpec(9, label: '10'),
            TickSpec(14, label: '15'),
            TickSpec(19, label: '20'),
            TickSpec(24, label: '25'),
            TickSpec(29, label: '30'),
          ],
        ),
      ),
      primaryMeasureAxis: NumericAxisSpec(
        tickProviderSpec: BasicNumericTickProviderSpec(
          desiredTickCount: 4,
        ),
      ),
    );
  }
}
