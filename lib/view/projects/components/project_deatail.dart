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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isSmallMobile = screenSize.width < 350;

    // Tailles de base augmentées pour les logos
    Map<String, double> updatedLogoSizes = {
      'SCALIA Mobile': 50, // Augmenté de 40 à 50
      'TekNow': 60, // Augmenté de 50 à 60
      'Election Prediction AI': 65, // Augmenté de 55 à 65
      'Connected socket - ADEE': 70, // Augmenté de 60 à 70
      'Logiciel ALX Technology': 60, // Augmenté de 50 à 60
      'Customer File Management': 50, // Augmenté de 40 à 50
      'Espana Cultura': 60, // Augmenté de 50 à 60
      'Agile IT Project Management': 60, // Augmenté de 50 à 60
    };

    double updatedDefaultSize = 50; // Augmenté de 40 à 50

    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 8.0 : 16.0,
            vertical: isMobile ? 6.0 : 12.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Titre
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.pink, Colors.blue],
                ).createShader(bounds),
                child: Text(
                  projectList[widget.index].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallMobile ? 18 : (isMobile ? 21 : 25),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: isMobile ? 3 : 6),

              // Description
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.pink, Colors.blue],
                ).createShader(bounds),
                child: Text(
                  projectList[widget.index].description,
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.3,
                    fontSize: isSmallMobile ? 10 : (isMobile ? 11 : 12),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: isMobile ? 8 : 12),

              // Logo principal (taille augmentée)
              Center(
                child: SizedBox(
                  height: isMobile ? 100 : 130, // Augmenté de 80/100 à 100/130
                  child: Image.asset(
                    projectList[widget.index].image,
                    width: getProjectLogoSize() *
                        (isMobile ? 0.85 : 1.0), // Facteur augmenté
                    height: getProjectLogoSize() *
                        (isMobile ? 0.85 : 1.0), // Facteur augmenté
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 10 : 14),

              // Section logos technos (améliorée)
              SizedBox(
                height: isMobile ? 50 : 60, // Augmenté de 40/50 à 50/60
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: projectList[widget.index]
                              .languages
                              .map((logo) => SizedBox(
                                    width: (updatedLogoSizes[
                                                projectList[widget.index]
                                                    .name] ??
                                            updatedDefaultSize) *
                                        (isMobile ? 0.8 : 1.0),
                                    height: (updatedLogoSizes[
                                                projectList[widget.index]
                                                    .name] ??
                                            updatedDefaultSize) *
                                        (isMobile ? 0.8 : 1.0),
                                    child: Image.asset(
                                      logo,
                                      fit: BoxFit.contain,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: isMobile ? 8 : 12),

              // GitHub et Screenshots
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (projectList[widget.index].link != null &&
                      projectList[widget.index].link!.isNotEmpty)
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () =>
                          launchUrl(Uri.parse(projectList[widget.index].link!)),
                      icon: SvgPicture.asset(
                        'assets/icons/github.svg',
                        height: isMobile ? 20 : 24, // Légèrement augmenté
                        colorFilter: const ColorFilter.mode(
                            Colors.amber, BlendMode.srcIn),
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
                              screenshots:
                                  projectList[widget.index].screenshots!,
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.image,
                          color: Colors.amber, size: isMobile ? 16 : 18),
                      label: Text(
                        'Screenshots',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 11 : 12,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 6 : 10, vertical: 4),
                      ),
                    ),
                ],
              ),

              // Type de projet
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                alignment: Alignment.center,
                child: Text(
                  projectList[widget.index].projectType,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 10 : 11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Mettez à jour aussi ces méthodes pour utiliser les nouvelles tailles
  double getProjectLogoSize() {
    double baseSize = projectLogoSizes[projectList[widget.index].name] ??
        defaultProjectLogoSize;

    // Augmentez les tailles de base dans votre map projectLogoSizes
    // ou ajoutez un facteur multiplicateur ici
    baseSize *= 1.05; // Augmentation générale de 5%

    if (isMobile(context)) {
      return baseSize * 0.8;
    } else if (isTablet(context)) {
      return baseSize * 0.9;
    }
    return baseSize;
  }

  double getLanguageLogoSize() {
    // Utilisez les nouvelles tailles
    double baseSize = logoSizes[projectList[widget.index].name] ?? defaultSize;

    if (isMobile(context)) {
      return baseSize;
    } else if (isTablet(context)) {
      return baseSize;
    }
    return baseSize;
  }
}
