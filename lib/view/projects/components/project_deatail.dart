import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/projects/components/project_link.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/project_model.dart';

class ProjectDetail extends StatefulWidget {
  final int index;

  const ProjectDetail({super.key, required this.index});

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Programming Language Icons with Continuous Animation
  // Définir des tailles spécifiques pour chaque projet
  Map<String, double> logoSizes = {
    'SCALIA Mobile': 40,
    'TekNow': 50,
    'Election Prediction AI': 55, // Projet avec des icônes plus grandes
    'Connected socket - ADEE': 60,
    'Logiciel ALX Technology': 50,
    'Customer File Management': 40,
    'Espana Cultura': 50,
    'Agile IT Project Management': 50,
  };

// Taille par défaut si un projet n'est pas dans la liste
  double defaultSize = 40;

  Map<String, double> projectLogoSizes = {
    'SCALIA Mobile': 70,
    'TekNow': 110,
    'Election Prediction AI': 80, // Projet avec un logo plus grand
    'Connected socket - ADEE': 90,
    'Logiciel ALX Technology': 160,
    'Customer File Management': 90,
    'Espana Cultura': 80,
    'Agile IT Project Management': 65,
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

    (_controller);
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Titre
        Align(
          alignment: Alignment.topCenter,
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.pink, Colors.blue],
            ).createShader(bounds),
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
        const SizedBox(height: 12),

        // Description
        Text(
          projectList[widget.index].description,
          style:
              const TextStyle(color: Colors.white70, height: 1.5, fontSize: 12),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 16),

        // Logo principal
        Center(
          child: Image.asset(
            projectList[widget.index].image,
            width: getProjectLogoSize(),
            height: getProjectLogoSize(),
          ),
        ),
        const SizedBox(height: 16),

        // Logos technos
        SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: projectList[widget.index]
                .languages
                .map((logo) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Image.asset(
                        logo,
                        height: getLanguageLogoSize(),
                        width: getLanguageLogoSize(),
                      ),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 16),

        // GitHub et Screenshots
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (projectList[widget.index].link != null &&
                projectList[widget.index].link!.isNotEmpty)
              IconButton(
                onPressed: () =>
                    launchUrl(Uri.parse(projectList[widget.index].link!)),
                icon: SvgPicture.asset(
                  'assets/icons/github.svg',
                  height: 24,
                  colorFilter:
                      const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
                ),
              ),
            if (projectList[widget.index].screenshots != null &&
                projectList[widget.index].screenshots!.isNotEmpty)
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenshotPage(
                          screenshots: projectList[widget.index].screenshots!),
                    ),
                  );
                },
                icon: const Icon(Icons.image, color: Colors.amber),
                label: const Text(
                  'Screenshots',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),

        // Type de projet aligné
        Container(
          padding: const EdgeInsets.symmetric(vertical: 1),
          height: 24,
          alignment: Alignment.centerLeft,
          child: Text(
            projectList[widget.index].projectType,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
