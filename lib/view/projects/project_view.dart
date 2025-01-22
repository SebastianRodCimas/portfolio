import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/projects_controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:get/get.dart';
import 'components/projects_grid.dart';

import 'package:get/get.dart';

class ProjectController extends GetxController {
  final List<Project> professionalProjects = [
    Project(
      title: "Surveillance Camera App",
      description: "Developed for STIM to manage surveillance cameras.",
      category: "Professional",
    ),
    Project(
      title: "Sales App",
      description: "Facilitated customer file management for Syrius Solar.",
      category: "Professional",
    ),
  ];

  final List<Project> personalProjects = [
    Project(
      title: "Electronic Music Website",
      description: "Referencing electronic music genres.",
      category: "Personal",
    ),
    Project(
      title: "Boating Reservation",
      description: "Website to book boat rides at Etangs de l'Or.",
      category: "Personal",
    ),
  ];

  final List<Project> schoolProjects = [
    Project(
      title: "Spanish Course Manager",
      description: "Database manager for a language association.",
      category: "School",
    ),
    Project(
      title: "Plug Consumption Monitor",
      description: "Winner of France 2020 competition.",
      category: "School",
    ),
  ];
}

class ProjectsView extends StatelessWidget {
  ProjectsView({super.key});
  final controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(
              height: defaultPadding,
            ),
          const TitleText(prefix: 'Latest', title: 'Projects'),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(
              child: Responsive(
                  desktop: ProjectGrid(
                    crossAxisCount: 3,
                  ),
                  extraLargeScreen: ProjectGrid(
                    crossAxisCount: 4,
                  ),
                  largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 1.8),
                  mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.5),
                  tablet: ProjectGrid(
                    ratio: 1.4,
                    crossAxisCount: 2,
                  )))
        ],
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String category;

  Project({
    required this.title,
    required this.description,
    required this.category,
  });
}
