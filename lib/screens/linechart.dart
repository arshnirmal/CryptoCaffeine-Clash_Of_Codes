import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineGraph {
  Widget lineChart(BuildContext context) {
    final List<FlSpot> dummyData1 = List.generate(
      5,
      (index) {
        return FlSpot(
          index.toDouble(),
          index == 0
              ? (index + Random().nextInt(5)) * Random().nextDouble()
              : index * Random().nextDouble(),
        );
      },
    );
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: bottomTile()),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: false,
          ),
          lineTouchData: LineTouchData(
            enabled: true,
            touchCallback: (
              FlTouchEvent event,
              LineTouchResponse? touchResponse,
            ) {},
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.blue,
              tooltipRoundedRadius: 20.0,
              showOnTopOfTheChartBoxArea: true,
              fitInsideHorizontally: true,
              tooltipMargin: 0,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map(
                  (LineBarSpot touchedSpot) {
                    const textStyle = TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
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
                      color: Colors.grey, strokeWidth: 1, dashArray: [2, 4]);
                  return TouchedSpotIndicatorData(
                    line,
                    FlDotData(show: false),
                  );
                },
              ).toList();
            },
            getTouchLineEnd: (_, __) => double.infinity,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: dummyData1,
              isCurved: false,
              barWidth: 1,
              color: Colors.black,
              dotData: FlDotData(
                show: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SideTitles bottomTile() {
    return SideTitles(
      showTitles: true,
      reservedSize: 30,
      getTitlesWidget: (value, meta) {
        String title = '';
        switch (value.toInt()) {
          case 0:
            title = 'Medicine';
            break;
          case 1:
            title = 'Health';
            break;
          case 2:
            title = 'Technology';
            break;
          case 3:
            title = 'Sports';
            break;
          case 4:
            title = 'Entertainment';
            break;
          case 5:
            title = 'Politics';
            break;
          case 6:
            title = 'Science';
            break;
          case 7:
            title = 'Business';
            break;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  value % 2 == 0 ? title : "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  value % 2 != 0 ? title : "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
