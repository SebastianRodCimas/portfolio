import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/project_model.dart';
import '../../../view%20model/responsive.dart';

class ProjectLinks extends StatelessWidget {
  final Project project;
  const ProjectLinks({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _buildDesktopLayout(context),
      tablet: _buildTabletLayout(context),
      mobile: _buildMobileLayout(context),
      largeMobile: _buildLargeMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (project.link != null && project.link!.isNotEmpty)
              IconButton(
                color: Colors.amber,
                onPressed: () {
                  launchUrl(Uri.parse(project.link!));
                },
                icon: SvgPicture.asset(
                  'assets/icons/github.svg',
                  height: 25,
                  colorFilter:
                      const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
                ),
              ),
            TextButton.icon(
              onPressed: () {
                // Navigate to a new page to show screenshots
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ScreenshotPage(screenshots: project.screenshots ?? []),
                  ),
                );
              },
              icon: const Icon(
                Icons.image,
                color: Colors.amber,
              ),
              label: const Text(
                'Screenshots',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding / 5),
        Text(
          maxLines: 2,
          project.projectType,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (project.link != null && project.link!.isNotEmpty)
            IconButton(
              color: Colors.amber,
              onPressed: () {
                launchUrl(Uri.parse(project.link!));
              },
              icon: SvgPicture.asset(
                'assets/icons/github.svg',
                height: 20,
                colorFilter:
                    const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
              ),
            ),
          if (project.screenshots != null && project.screenshots!.isNotEmpty)
            TextButton.icon(
              onPressed: () {
                // Navigate to a new page to show screenshots
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ScreenshotPage(screenshots: project.screenshots ?? []),
                  ),
                );
              },
              icon: const Icon(
                Icons.image,
                color: Colors.amber,
              ),
              label: const Text(
                'Screenshots',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    ]);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (project.link != null && project.link!.isNotEmpty)
            IconButton(
              color: Colors.amber,
              onPressed: () {
                launchUrl(Uri.parse(project.link!));
              },
              icon: SvgPicture.asset(
                'assets/icons/github.svg',
                height: 20,
                colorFilter:
                    const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
              ),
            ),
          TextButton.icon(
            onPressed: () {
              // Navigate to a new page to show screenshots
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ScreenshotPage(screenshots: project.screenshots ?? []),
                ),
              );
            },
            icon: const Icon(
              Icons.image,
              color: Colors.amber,
            ),
            label: const Text(
              'Screenshots',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: defaultPadding / 5),
      Text(
        maxLines: 2,
        project.projectType,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    ]);
  }

  Widget _buildLargeMobileLayout(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (project.link != null && project.link!.isNotEmpty)
            IconButton(
              color: Colors.amber,
              onPressed: () {
                launchUrl(Uri.parse(project.link!));
              },
              icon: SvgPicture.asset(
                'assets/icons/github.svg',
                height: 20,
                colorFilter:
                    const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
              ),
            ),
          TextButton.icon(
            onPressed: () {
              // Navigate to a new page to show screenshots
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ScreenshotPage(screenshots: project.screenshots ?? []),
                ),
              );
            },
            icon: const Icon(
              Icons.image,
              color: Colors.amber,
            ),
            label: const Text(
              'Screenshots',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 5),
          Text(
            maxLines: 2,
            project.projectType,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    ]);
  }
}

class ScreenshotPage extends StatefulWidget {
  final List<String> screenshots;
  const ScreenshotPage({super.key, required this.screenshots});

  @override
  State<ScreenshotPage> createState() => _ScreenshotPageState();
}

class _ScreenshotPageState extends State<ScreenshotPage> {
  int _currentIndex = 0; // Indice de l'image affichée

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          // Carrousel d'images en plein écran
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.8,
                enlargeCenterPage: true,
                autoPlay: false,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: widget.screenshots.map((screenshot) {
                return Center(
                  child: Image.asset(
                    screenshot,
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                );
              }).toList(),
            ),
          ),

          // Bouton retour en haut à gauche (superposé)
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Indicateur de position (petits points sous le carrousel)
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.screenshots.asMap().entries.map((entry) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == entry.key ? Colors.white : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
