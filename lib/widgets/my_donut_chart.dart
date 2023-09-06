import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyDonutChart extends StatelessWidget {
  const MyDonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: 200,
              sectionsSpace: 0,
              centerSpaceRadius: 100,
              sections: [
                PieChartSectionData(
                  value: 40,
                  color: Colors.greenAccent,
                  radius: 25,
                  showTitle: false,
                ),
                PieChartSectionData(
                  value: 20,
                  color: Colors.blue,
                  radius: 25,
                  showTitle: false,
                ),
                PieChartSectionData(
                  value: 10,
                  color: Colors.yellow,
                  radius: 25,
                  showTitle: false,
                ),
                PieChartSectionData(
                  value: 20,
                  color: Colors.red,
                  radius: 25,
                  showTitle: false,
                ),
                PieChartSectionData(
                  value: 10,
                  color: Colors.green,
                  radius: 25,
                  showTitle: false,
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10.0,
                        spreadRadius: 10.0,
                        offset: const Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      " 274\nTotal",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
