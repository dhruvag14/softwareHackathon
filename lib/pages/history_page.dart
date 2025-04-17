import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Statistics', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text('Waste Classification', style: TextStyle(fontSize: 16)),
          SizedBox(height: 200, child: LineChart(_buildLineChartData())),
          const SizedBox(height: 20),
          const Text("This Week's Waste", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text("Organic: 45%"),
          const Text("Recyclable: 35%"),
          const Text("Landfill: 20%"),
        ],
      ),
    );
  }
}

LineChartData _buildLineChartData() {
  return LineChartData(
    lineBarsData: [
      LineChartBarData(
        isCurved: true,
        spots: const [
          FlSpot(0, 3),
          FlSpot(1, 4),
          FlSpot(2, 2),
        ],
        barWidth: 2,
        color: Colors.green,
      ),
    ],
    titlesData: FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            switch (value.toInt()) {
              case 0:
                return const Text('Apr');
              case 1:
                return const Text('May');
              case 2:
                return const Text('Jun');
            }
            return const Text('');
          },
        ),
      ),
    ),
  );
}
