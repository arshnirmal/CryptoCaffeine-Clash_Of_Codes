import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:defi/models/data_loader.dart';
import 'package:defi/models/datum.dart';

class CrytoChart extends StatefulWidget {
  const CrytoChart({super.key});

  @override
  State<CrytoChart> createState() => _CrytoChartState();
}

class _CrytoChartState extends State<CrytoChart> {
  final int _divider = 25;
  final int _leftLabelsCount = 6;
  List<FlSpot> _values = const [];

  double _minX = 0;
  double _maxX = 0;
  double _minY = 0;
  double _maxY = 0;
  double _leftTitlesInterval = 0;

  @override
  void initState() {
    super.initState();
    _prepareData();
  }

  void _prepareData() async {
    final List<Datum> data = await loadData();

    double minY = double.maxFinite;
    double maxY = double.minPositive;

    _values = data.map(
      (datum) {
        if (minY > datum.close) minY = datum.close;
        if (maxY < datum.close) maxY = datum.close;
        return FlSpot(
          datum.date.millisecondsSinceEpoch.toDouble(),
          datum.close,
        );
      },
    ).toList();

    _minX = _values.first.x;
    _maxX = _values.last.x;
    _minY = (minY / _divider).floorToDouble() * _divider;
    _maxY = (maxY / _divider).ceilToDouble() * _divider;
    _leftTitlesInterval =
        ((_maxY - _minY) / (_leftLabelsCount - 1)).floorToDouble();

    setState(() {});
  }

  LineChartData _mainData() {
    return LineChartData(
      gridData: _gridData(),
      // titlesData: FlTitlesData(
      //   bottomTitles: AxisTitles(
      //     sideTitles: _bottomTitles(),
      //   ),
      //   leftTitles: AxisTitles(
      //     sideTitles: _leftTitles(),
      //   ),
      // ),
      // borderData: FlBorderData(
      //   border: Border.all(color: Colors.white12, width: 1),
      // ),
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
      lineBarsData: [_lineBarData()],
    );
  }

  LineChartBarData _lineBarData() {
    return LineChartBarData(
      spots: _values,
      dotData: FlDotData(
        show: false,
      ),
      
    );
  }

  FlGridData _gridData() {
    return FlGridData(
      show: false,
      drawVerticalLine: false,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.white,
          strokeWidth: 1,
        );
      },
      checkToShowHorizontalLine: (value) {
        return (value - _minY) % _leftTitlesInterval == 0;
      },
    );
  }

  // SideTitles _leftTitles() {
  //   return SideTitles(
  //     showTitles: true,
  //     reservedSize: 28,
  //     getTitlesWidget: (value, meta) {
  //       return Text(
  //         NumberFormat.compactCurrency(symbol: '\$').format(value),
  //         style: const TextStyle(
  //           color: Colors.white54,
  //           fontSize: 14,
  //         ),
  //       );
  //     },
  //     interval: _leftTitlesInterval,
  //   );
  // }

  // SideTitles _bottomTitles() {
  //   return SideTitles(
  //     showTitles: true,
  //     getTitlesWidget: (value, meta) {
  //       final DateTime date =
  //           DateTime.fromMillisecondsSinceEpoch(value.toInt());
  //       return Text(
  //         DateFormat.MMM().format(date),
  //         style: const TextStyle(
  //           color: Colors.white54,
  //           fontSize: 14,
  //         ),
  //       );
  //     },
  //     interval: (_maxX - _minX) / 6,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        child: _values.isEmpty
            ? const Placeholder()
            : LineChart(
                _mainData(),
              ),
      ),
    );
  }
}
