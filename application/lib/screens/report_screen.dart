import 'dart:async';
import 'package:cornseedapplication/utilities/reportsvariable.dart';
import 'package:cornseedapplication/utilities/texts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // Header row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(8.0)),
                Text(ReportsPage), // Make sure ReportsPage is defined
              ],
            ),
            const SizedBox(height: 8.0), // Space at the top
            // Bar chart
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BarChart(
                BarChartData(
                  maxY: 100, // Maximum value on the Y axis
                  minY: 0,   // Minimum value on the Y axis
                  gridData: const FlGridData(show: false), // Hide background grid lines
                  borderData: FlBorderData(show: false),   // Hide outer borders
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          // Map X-axis indexes to custom labels
                          switch (value.toInt()) {
                            case 0: return const Text('M');
                            case 1: return const Text('T');
                            case 2: return const Text('W');
                            case 3: return const Text('T');
                            case 4: return const Text('F');
                            case 5: return const Text('S');
                            case 6: return const Text('S');
                            default: return const Text('');
                          }
                        },
                      ),
                    ),
                  ),
                  // Map the data list into individual bar groups
                  barGroups: weeklySummary
                      .asMap()
                      .entries
                      .map(
                        (entry) => BarChartGroupData(
                          x: entry.key,
                          barRods: [
                            BarChartRodData(
                              toY: entry.value,
                              color: Colors.blue,
                              width: 16,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}