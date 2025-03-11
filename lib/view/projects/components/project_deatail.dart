import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/projects/components/project_link.dart';

import '../../../model/project_model.dart';
import '../../../res/constants.dart';

class ProjectDetail extends StatefulWidget {
  final int index;

  const ProjectDetail({super.key, required this.index});

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  // Programming Language Icons with Continuous Animation
  // Définir des tailles spécifiques pour chaque projet
  Map<String, double> logoSizes = {
    'SCALIA Mobile': 45,
    'TekNow': 35,
    'Election Prediction AI': 45, // Projet avec des icônes plus grandes
    'Connected socket - ADEE': 50,
    'Logiciel ALX Technology': 40,
    'Customer File Management': 40,
    'Espana Cultura': 40,
    'Agile IT Project Management': 40,
  };

// Taille par défaut si un projet n'est pas dans la liste
  double defaultSize = 40;

  Map<String, double> projectLogoSizes = {
    'SCALIA Mobile': 70,
    'TekNow': 55,
    'Election Prediction AI': 80, // Projet avec un logo plus grand
    'Connected socket - ADEE': 80,
    'Logiciel ALX Technology': 70,
    'Customer File Management': 75,
    'Espana Cultura': 75,
    'Agile IT Project Management': 60,
  };

// Taille par défaut si un projet n'est pas dans la liste
  double defaultProjectLogoSize = 70;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4), // Adjust the duration as needed
      vsync: this,
    )..repeat(reverse: true); // Continuous animation

    int logoCount = projectList[widget.index].languages.length;
    double startOffset =
        0.1 + (logoCount * 0.05); // Adjust start offset based on logo count
    double endOffset =
        0 - (logoCount * 0.05); // Adjust end offset based on logo count

    _animation = Tween<Offset>(
      begin: Offset(startOffset, 0.0), // Start from the far right
      end: Offset(endOffset, 0.0), // Move to the far left
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  bool isLargeMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 900;
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900 &&
      MediaQuery.of(context).size.width < 1200;
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  // Ajuster les tailles en fonction du type d'écran
  double getProjectLogoSize() {
    double baseSize = projectLogoSizes[projectList[widget.index].name] ??
        defaultProjectLogoSize;

    if (isMobile(context)) {
      return baseSize * 0.8; // Réduire la taille des logos pour mobile
    } else if (isTablet(context)) {
      return baseSize * 0.9; // Taille légèrement réduite pour les tablettes
    }
    return baseSize; // Taille normale pour Desktop
  }

  double getLanguageLogoSize() {
    double baseSize = logoSizes[projectList[widget.index].name] ?? defaultSize;

    if (isMobile(context)) {
      return baseSize * 0.75; // Réduction pour mobile
    } else if (isTablet(context)) {
      return baseSize * 0.85; // Taille ajustée pour tablette
    }
    return baseSize; // Taille normale pour Desktop
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Project Name
        Align(
          alignment: Alignment.topCenter,
          child: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [Colors.pink, Colors.blue],
              ).createShader(bounds);
            },
            child: Text(
              projectList[widget.index].name,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        if (isMobile(context) || isDesktop(context))
          const SizedBox(height: defaultPadding),

        // Project Description
        Text(projectList[widget.index].description,
            style:
                const TextStyle(color: Colors.white, height: 1.5, fontSize: 12),
            maxLines: size.width > 700 && size.width < 750
                ? 3
                : size.width < 470
                    ? 2
                    : size.width > 600 && size.width < 700
                        ? 6
                        : size.width > 900 && size.width < 1060
                            ? 6
                            : 4,
            overflow: TextOverflow.ellipsis),
        const SizedBox(height: defaultPadding / 5),

        // Project Logo
        Center(
          child: Image.asset(
            projectList[widget.index].image,
            width: getProjectLogoSize(),
            height: getProjectLogoSize(),
          ),
        ),

        if (isMobile(context) || isDesktop(context))
          const SizedBox(height: defaultPadding / 10),

        SizedBox(
          height: 80, // Adapter la hauteur pour éviter les coupures
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return FractionalTranslation(
                translation: _animation.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: projectList[widget.index].languages.map((logo) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          logo,
                          width: getLanguageLogoSize(),
                          height: getLanguageLogoSize(),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: defaultPadding),
        // Project Links
        ProjectLinks(
          project: projectList[widget.index],
        ),
      ],
    );
  }
}
