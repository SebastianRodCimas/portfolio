import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';

class SkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionHeader(context, 'Technical Skills'),
            SizedBox(height: 10),
            SkillCategoryWidget(
              title: 'Programming Languages & Frameworks',
              skills: {
                'Python': 4.5,
                'PHP': 4.0,
                'JavaScript': 4.2,
                'Flutter': 4.8,
                'Laravel': 4.3,
              },
            ),
            SizedBox(height: 20),
            buildSectionHeader(context, 'Project Management & Methodologies'),
            SizedBox(height: 10),
            SkillCategoryWidget(
              title: 'Methodologies',
              skills: {
                'Agile': 4.7,
                'Scrum': 4.5,
                'Extreme Programming': 4.3,
              },
            ),
            SizedBox(height: 20),
            buildSectionHeader(context, 'Design & Analysis'),
            SizedBox(height: 10),
            SkillCategoryWidget(
              title: 'Design Expertise',
              skills: {
                'UML Diagrams': 4.6,
                'Database Modeling': 4.5,
                'Beta Testing Analysis': 4.4,
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(BuildContext context, String title) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [Colors.pink, Colors.blue],
        ).createShader(bounds);
      },
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
      ),
    );
  }
}

class SkillCategoryWidget extends StatelessWidget {
  final String title;
  final Map<String, double> skills;

  SkillCategoryWidget({required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [Colors.pink, Colors.blue],
                ).createShader(bounds);
              },
              child: Text(
                title,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: skills.entries
                      .map(
                        (entry) => BarChartGroupData(
                          x: skills.keys.toList().indexOf(entry.key),
                          barRods: [
                            BarChartRodData(
                              toY: entry.value,
                              width: 16,
                              color: Colors.teal[400],
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toString(),
                            style: TextStyle(
                                color: const Color.fromARGB(255, 3, 32, 31),
                                fontSize: 12),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              skills.keys.toList()[value.toInt()],
                              style: TextStyle(
                                  color: Colors.teal[700],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.teal[200],
                      strokeWidth: 0.8,
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.teal[300]!, width: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
