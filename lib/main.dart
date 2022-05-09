import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RadialTrackerColor(),
    );
  }
}

class RadialTrackerColor extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  RadialTrackerColor({Key? key}) : super(key: key);

  @override
  _RadialTrackerColorState createState() => _RadialTrackerColorState();
}

class _RadialTrackerColorState extends State<RadialTrackerColor> {
  late List<ChartData> chartData;

  @override
  void initState() {
    chartData = <ChartData>[
      ChartData(1, 10, const Color.fromRGBO(248, 177, 149, 1.0)),
      ChartData(2, 11, const Color.fromRGBO(246, 114, 128, 1.0)),
      ChartData(3, 12, const Color.fromRGBO(61, 205, 171, 1.0)),
      ChartData(4, 13, const Color.fromRGBO(1, 174, 190, 1.0))
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCircularChart(series: <RadialBarSeries<ChartData, int>>[
        RadialBarSeries<ChartData, int>(
          dataSource: chartData,
          useSeriesColor: true,
          trackOpacity: 0.4,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (ChartData data, _) => data.color,
        )
      ]),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final int x;
  final double y;
  final Color color;
}
