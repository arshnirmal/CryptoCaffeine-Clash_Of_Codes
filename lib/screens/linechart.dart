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
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: flBorderData(),
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
      lineBarsData: [_lineBarData()],
      lineTouchData: lineTouchData(),
    );
  }

  FlBorderData flBorderData() {
    return FlBorderData(
      show: false,
    );
  }

  LineChartBarData _lineBarData() {
    return LineChartBarData(
      isCurved: false,
      spots: _values,
      dotData: FlDotData(
        show: false,
      ),
    );
  }

  FlGridData _gridData() {
    return FlGridData(
      show: false,
    );
  }

  LineTouchData lineTouchData() {
    return LineTouchData(
      enabled: true,
      touchCallback: (
        FlTouchEvent event,
        LineTouchResponse? touchResponse,
      ) {},
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.blue,
        tooltipRoundedRadius: 20.0,
        tooltipMargin: 0,
        getTooltipItems: (touchedSpots) {
          return touchedSpots.map(
            (LineBarSpot touchedSpot) {
              const textStyle = TextStyle(
                fontSize: 10,
                color: Colors.white,
              );
              return LineTooltipItem(
                touchedSpot.y.toString(),
                textStyle,
              );
            },
          ).toList();
        },
      ),
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> indicators) {
        return indicators.map(
          (int index) {
            final line = FlLine(
              color: Colors.grey,
              strokeWidth: 1,
              dashArray: [2, 4],
            );
            return TouchedSpotIndicatorData(
              line,
              FlDotData(show: false),
            );
          },
        ).toList();
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
