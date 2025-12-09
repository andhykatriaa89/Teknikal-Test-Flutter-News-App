import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color.fromRGBO(83, 157, 243, 1),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: DropdownButton<String>(
              value: '7d',
              underline: const SizedBox(),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              dropdownColor: const Color.fromRGBO(83, 157, 243, 1),
              style: const TextStyle(color: Colors.white),
              items: ['7d', '30d', '90d', '1y'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('View: $value'),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // TODO: Implement view change logic
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Corrective (Machine)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildCard(
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  DropdownButton<String>(value: 'Building A', underline: const SizedBox(), items: ['Building A','Building B'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (_) {}),
                  DropdownButton<String>(value: '2024', underline: const SizedBox(), items: ['2023','2024','2025'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (_) {}),
                ]),
                const SizedBox(height: 20),
                SizedBox(
                  height: 220,
                  child: PieChart(PieChartData(sections: [
                    PieChartSectionData(value: 43, color: Colors.pink[300], title: '43%', radius: 60),
                    PieChartSectionData(value: 33, color: Colors.black87, title: '33%', radius: 60),
                    PieChartSectionData(value: 20, color: Colors.orange[300], title: '20%', radius: 60),
                    PieChartSectionData(value: 15, color: Colors.blue[300], title: '15%', radius: 60),
                    PieChartSectionData(value: 10, color: Colors.cyan[300], title: '10%', radius: 60),
                    PieChartSectionData(value: 5, color: Colors.teal[300], title: '5%', radius: 60),
                  ])),
                ),
                const SizedBox(height: 20),
                _buildLegend(),
              ]),
            ),
            const SizedBox(height: 24),
            const Text('Trouble by Area', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Row(
                      children: [
                        Icon(Icons.calendar_today, size: 18, color: Colors.black54),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '01/09/2024 - 01/09/2024',
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 260,
                    child: Stack(
                      children: [
                        BarChart(
                          BarChartData(
                            maxY: 16,
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(show: true, drawVerticalLine: false, horizontalInterval: 4),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 32)),
                              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 32)),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 28,
                                  getTitlesWidget: (value, meta) {
                                    const labels = [
                                      '22/08/2024',
                                      '25/08/2024',
                                      '26/08/2024',
                                      '27/08/2024',
                                      '28/08/2024',
                                      '29/08/2024',
                                    ];
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Text(labels[value.toInt() % labels.length], style: const TextStyle(fontSize: 10)),
                                    );
                                  },
                                ),
                              ),
                              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            ),
                            barGroups: [
                              BarChartGroupData(x: 0, barRods: [
                                BarChartRodData(
                                  toY: 8,
                                  width: 16,
                                  rodStackItems: [
                                    BarChartRodStackItem(0, 2, Colors.cyan[300]!),
                                    BarChartRodStackItem(2, 6, Colors.blue[300]!),
                                    BarChartRodStackItem(6, 8, Colors.purple[300]!),
                                  ],
                                ),
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(toY: 10, width: 16, rodStackItems: [
                                  BarChartRodStackItem(0, 3, Colors.cyan[300]!),
                                  BarChartRodStackItem(3, 7, Colors.blue[300]!),
                                  BarChartRodStackItem(7, 10, Colors.purple[300]!),
                                ]),
                              ]),
                              BarChartGroupData(x: 2, barRods: [
                                BarChartRodData(toY: 2, width: 16, rodStackItems: [
                                  BarChartRodStackItem(0, 1, Colors.cyan[300]!),
                                  BarChartRodStackItem(1, 2, Colors.blue[300]!),
                                ]),
                              ]),
                              BarChartGroupData(x: 3, barRods: [
                                BarChartRodData(toY: 6, width: 16, rodStackItems: [
                                  BarChartRodStackItem(0, 2, Colors.cyan[300]!),
                                  BarChartRodStackItem(2, 4, Colors.blue[300]!),
                                  BarChartRodStackItem(4, 6, Colors.purple[300]!),
                                ]),
                              ]),
                              BarChartGroupData(x: 4, barRods: [
                                BarChartRodData(toY: 12, width: 16, rodStackItems: [
                                  BarChartRodStackItem(0, 3, Colors.cyan[300]!),
                                  BarChartRodStackItem(3, 7, Colors.blue[300]!),
                                  BarChartRodStackItem(7, 12, Colors.purple[300]!),
                                ]),
                              ]),
                              BarChartGroupData(x: 5, barRods: [
                                BarChartRodData(toY: 9, width: 16, rodStackItems: [
                                  BarChartRodStackItem(0, 2, Colors.cyan[300]!),
                                  BarChartRodStackItem(2, 6, Colors.blue[300]!),
                                  BarChartRodStackItem(6, 9, Colors.purple[300]!),
                                ]),
                              ]),
                            ],
                          ),
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: LineChart(
                            LineChartData(
                              minX: 0,
                              maxX: 5,
                              minY: 0,
                              maxY: 16,
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(show: false),
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: const [
                                    FlSpot(0, 4),
                                    FlSpot(1, 9),
                                    FlSpot(2, 1),
                                    FlSpot(3, 5),
                                    FlSpot(4, 8),
                                    FlSpot(5, 4),
                                  ],
                                  isCurved: true,
                                  color: Colors.blueAccent,
                                  barWidth: 3,
                                  dotData: const FlDotData(show: true),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      const _LegendDot(label: 'Building A', color: Colors.cyan),
                      const _LegendDot(label: 'Building A1', color: Colors.blue),
                      const _LegendDot(label: 'Building B', color: Colors.orange),
                      const _LegendDot(label: 'Building B1', color: Colors.purple),
                      const _LegendDot(label: 'Building C1', color: Colors.indigo),
                      const _LegendDot(label: 'Average', color: Colors.blueAccent),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Spare part Usage', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Spare part Usage', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () {},
                        child: const Text('View All >', style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: 'Alloy Casting',
                          isExpanded: true,
                          items: ['Alloy Casting', 'Other Part'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      DropdownButton<String>(
                        value: '2024',
                        items: ['2023', '2024', '2025'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 220,
                    child: BarChart(
                      BarChartData(
                        maxY: 40,
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: true, drawVerticalLine: false, horizontalInterval: 10),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 32)),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                const labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                                return Text(labels[value.toInt()], style: const TextStyle(fontSize: 12));
                              },
                            ),
                          ),
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        barGroups: List.generate(12, (index) => BarChartGroupData(
                          x: index,
                          showingTooltipIndicators: index == 5 ? [0] : [], // Show tooltip on June
                          barRods: [BarChartRodData(
                            toY: [20, 15, 10, 18, 12, 25, 22, 18, 14, 20, 16, 10][index].toDouble(),
                            color: Colors.cyan,
                            width: 16,
                            borderRadius: BorderRadius.circular(4),
                          )],
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
    }

    Widget _buildCard({required Widget child}) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 12, offset: const Offset(0, 6))
        ]),
        child: child,
      );
    }

    Widget _buildLegend() {
      final data = [
        ('Crane', Colors.pink[300]),
        ('Hoist', Colors.black87),
        ('Air Dryer', Colors.orange[300]),
        ('Compressor', Colors.blue[300]),
        ('Spot Welding', Colors.cyan[300]),
        ('Feeder', Colors.teal[300]),
      ];
      return Wrap(
        spacing: 16,
        runSpacing: 8,
        children: data.map((e) => Row(mainAxisSize: MainAxisSize.min, children: [
          Container(width: 16, height: 16, color: e.$2),
          const SizedBox(width: 6),
          Text(e.$1, style: const TextStyle(fontSize: 13)),
        ])).toList(),
      );
    }
}

class _LegendDot extends StatelessWidget {
  final String label;
  final Color color;

  const _LegendDot({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}