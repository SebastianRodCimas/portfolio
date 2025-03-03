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
                  height: 30,
                  color: Colors.amber,
                ),
              ),
            TextButton.icon(
              onPressed: () {
                // Navigate to a new page to show screenshots
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ScreenshotPage(screenshots: project.screenshots),
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
        const SizedBox(height: defaultPadding),
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
                color: Colors.amber,
              ),
            ),
          TextButton.icon(
            onPressed: () {
              // Navigate to a new page to show screenshots
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ScreenshotPage(screenshots: project.screenshots),
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
                color: Colors.amber,
              ),
            ),
          TextButton.icon(
            onPressed: () {
              // Navigate to a new page to show screenshots
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ScreenshotPage(screenshots: project.screenshots),
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
      const SizedBox(height: defaultPadding),
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
                color: Colors.amber,
              ),
            ),
          TextButton.icon(
            onPressed: () {
              // Navigate to a new page to show screenshots
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ScreenshotPage(screenshots: project.screenshots),
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
}

class ScreenshotPage extends StatelessWidget {
  final List<String> screenshots;
  const ScreenshotPage({super.key, required this.screenshots});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screenshots'),
      ),
      body: ListView.builder(
        itemCount: screenshots.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(screenshots[index]),
          );
        },
      ),
    );
  }
}
