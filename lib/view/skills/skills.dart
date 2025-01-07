import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});
  double getFontSize(String text, double maxWidth) {
    // Réduire la taille de la police en fonction de la longueur du texte
    if (text.length > 10) {
      return maxWidth /
          text.length.clamp(10, 15); // Minimum 10, maximum 15 caractères
    }
    return 14; // Taille par défaut
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            SkillCategoryWidget(
              title: 'Programming Languages & Frameworks',
              skills: {
                'PHP': 2.0,
                'TypeScript': 2.5,
                'C#': 3.2,
                'SQL': 3.6,
                'CSS/XML': 3.9,
                'Flutter': 4.6,
              },
            ),
            SizedBox(height: 20),
            SizedBox(height: 10),
            SizedBox(height: 20),
            SkillCategoryWidget(
              title: 'Databases & APIs',
              skills: {
                'REST API': 2.5,
                'Firebase': 2.5,
                'UML': 3.0,
                'SQL Server': 3.5,
                'MySQL': 3.8,
                'Postman': 4.2,
              },
            ),
            SizedBox(height: 20),
            SkillCategoryWidget(
              title: 'Methodologies & Tools',
              skills: {
                'GitLab': 1.5,
                'Scrum': 2.5,
                'Git': 3.0,
                'MPM': 4,
                'Kanban': 4.5,
                'Gantt': 5,
              },
            ),
            SizedBox(height: 20),
            SkillCategoryWidget(
              title: 'Stores & Publication',
              skills: {
                'TestFlight': 3,
                'App Store': 4.2,
                'Google Play Console': 4.7,
              },
            ),
            SizedBox(height: 20),
            SkillCategoryWidget(
              title: 'Management Tools',
              skills: {
                'SharePoint': 2.0,
                'Confluence': 3.3,
                'Jira': 4.0,
                'BitBucket': 4.5,
              },
            ),
            SizedBox(height: 20),
            SkillCategoryWidget(
              title: 'Project Organization',
              skills: {
                'Data Collection': 3.5,
                'Technology Watch': 4.0,
                'Task Planning': 4.7,
              },
            ),
            SizedBox(height: 20),
            SkillCategoryWidget(
              title: 'Design Expertise',
              skills: {
                'UML Diagrams': 3.0,
                'Database Modeling': 3.4,
                'UI Design': 4,
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

Color getGradientColor(double percentage) {
  return Color.lerp(Colors.pinkAccent, Colors.blueAccent, percentage)!;
}

double getResponsiveFontSize(List<String> skillNames, double chartWidth) {
  // Trouver la longueur maximale des compétences
  final int maxLength =
      skillNames.map((name) => name.length).reduce((a, b) => a > b ? a : b);

  // Ajuster dynamiquement la taille de la police pour tous les noms en fonction de la longueur maximale
  double fontSize =
      chartWidth / maxLength.clamp(10, 20); // Taille adaptée à l'écran

  // Appliquer des limites cohérentes pour éviter des variations extrêmes
  return fontSize.clamp(10, 14); // Taille minimale de 10 et maximale de 14
}

class SkillCategoryWidget extends StatelessWidget {
  final String title;
  final Map<String, double> skills;

  const SkillCategoryWidget({
    super.key,
    required this.title,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final double chartWidth = MediaQuery.of(context).size.width;
    final List<String> skillNames = skills.keys.toList();

    // Calculer une taille de police uniforme pour tous les noms de la catégorie
    final double fontSize = getResponsiveFontSize(skillNames, chartWidth);

    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
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
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.pinkAccent, Colors.blueAccent],
                  stops: [0.2, 0.8],
                ).createShader(bounds);
              },
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 3.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
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
                              gradient: LinearGradient(
                                colors: [Colors.pinkAccent, Colors.blueAccent],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ],
                          barsSpace: 20, // Espacer davantage les barres
                        ),
                      )
                      .toList(),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 50, // Plus d'espace pour les noms
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final skillName = skills.keys.toList()[value.toInt()];

                          return Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: ShaderMask(
                              shaderCallback: (bounds) {
                                return const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.pinkAccent,
                                    Colors.blueAccent
                                  ],
                                  stops: [0.2, 0.8],
                                ).createShader(bounds);
                              },
                              child: Text(
                                skillName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: fontSize, // Taille uniforme
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                  color: Colors.white, // Couleur blanche
                                  shadows: const [
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 2.0,
                                      color: Colors.black26,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.teal.shade700, width: 0.5),
                  ),
                  alignment: BarChartAlignment.spaceAround,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
