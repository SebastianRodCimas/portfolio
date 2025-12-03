import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_portfolio/res/constants.dart';

import 'package:flutter_portfolio/view%20model/responsive.dart';

import 'package:flutter_portfolio/view/main/components/navigation_button_list.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  SkillsPageState createState() => SkillsPageState();
}

class SkillsPageState extends State<SkillsPage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _ticker = createTicker((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.offset + 1);
        if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent) {
          _scrollController.jumpTo(0);
        }
      }
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  double getFontSize(String text, double maxWidth) {
    // Réduire la taille de la police en fonction de la longueur du texte
    if (text.length > 10) {
      return maxWidth /
          text.length.clamp(10, 15); // Minimum 10, maximum 15 caractères
    }
    return 14; // Taille par défaut
  }

  List<Widget> buildSkillRows(
      BuildContext context, List<SkillCategoryWidget> skillWidgets) {
    List<Widget> rows = [];
    bool isMobile = Responsive.isTablet(context) ||
        Responsive.isMobile(context) ||
        Responsive.isLargeMobile(context);

    for (int i = 0; i < skillWidgets.length; i += isMobile ? 1 : 2) {
      rows.add(
        Row(
          children: [
            Expanded(child: skillWidgets[i]),
            if (!isMobile && i + 1 < skillWidgets.length) ...[
              const SizedBox(width: 20),
              Expanded(child: skillWidgets[i + 1]),
            ],
          ],
        ),
      );
      rows.add(const SizedBox(height: 20)); // Espace entre les lignes
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    List<SkillCategoryWidget> skillWidgets = const [
      SkillCategoryWidget(
        title: 'Programming Languages & Frameworks',
        skills: {
          '.NET 8': 3.2,
          'C#': 3.4,
          'Kotlin/Swift': 3.6,
          'SQL': 3.9,
          'Flutter': 4.6,
        },
      ),
      SkillCategoryWidget(
        title: 'Databases & IA',
        skills: {
          'Tensor\nFlow': 2.5,
          'Pandas': 3,
          'API': 3.5,
          'UML': 4,
          'PL/SQL': 4.5,
        },
      ),
      SkillCategoryWidget(
        title: 'Methodologies & Tools',
        skills: {
          'SAFe': 3.0,
          'V-cycle': 3,
          'Scrum': 3.5,
          'Jira': 4,
          'Kanban': 4.5,
        },
      ),
      SkillCategoryWidget(
        title: 'Stores & Publication',
        skills: {
          'TestFlight': 2,
          'OVH': 3,
          'App\nStore': 4.2,
          'Google\nPlay': 4.7,
          '02Switch': 5,
        },
      ),
      SkillCategoryWidget(
        title: 'Management Tools',
        skills: {
          'SharePoint': 3.0,
          'Confluence': 3.3,
          'Jira': 4.0,
          'BitBucket': 4.5,
        },
      ),
      SkillCategoryWidget(
        title: 'Project Organization',
        skills: {
          'Data\nCollection': 3.5,
          'Technology\nWatch': 4.0,
          'Task\nPlanning': 4.7,
        },
      ),
      SkillCategoryWidget(
        title: 'Modeling',
        skills: {
          'UX/UI': 2,
          'BPMN': 3,
          'UML\nDiagrams': 3.5,
          'Database\nModeling': 3.8,
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: const Padding(
          padding: EdgeInsets.all(1.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Row(
              children: [Spacer(), NavigationButtonList(), Spacer()],
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20), // Ajouter de l'espace avant le logo
            buildSoftwareLogos(),
            const SizedBox(height: 40), // Ajouter de l'espace après le logo
            ...buildSkillRows(context, skillWidgets),
          ],
        ),
      ),
    );
  }

  Widget buildSoftwareLogos() {
    List<String> softwareLogos = [
      'assets/images/logiciel/xcode.png',
      'assets/images/logiciel/android_studio.png',
      'assets/images/logiciel/vs_code.png',
      'assets/images/logiciel/sonarqube.png',
      'assets/images/logiciel/docker.png',
      'assets/images/logiciel/bitbucket.png',
      'assets/images/logiciel/eclipse.png',
      'assets/images/logiciel/power_bi.png',
      'assets/images/logiciel/colab.png',
      'assets/images/logiciel/sql_server.png',
      'assets/images/logiciel/mongo_db.png',
      'assets/images/logiciel/swagger.png',
      'assets/images/logiciel/Notion.png',
      'assets/images/logiciel/figma.png',
      'assets/images/logiciel/Vmware.png',
    ];

    return SizedBox(
      height: 100,
      width: 1000,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: softwareLogos.length + 1,
        itemBuilder: (context, index) {
          if (index == softwareLogos.length) {
            return const SizedBox(width: 100);
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset(
                softwareLogos[index],
                width: 75,
                height: 75,
              ),
            ),
          );
        },
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
                              gradient: const LinearGradient(
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
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
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
                  gridData: const FlGridData(show: true),
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
