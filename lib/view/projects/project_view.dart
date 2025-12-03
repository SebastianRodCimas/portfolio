import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/projects_controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import 'package:flutter_portfolio/view/main/components/navigation_button_list.dart';
import 'package:flutter_portfolio/view/projects/components/projects_grid.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:get/get.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({super.key});
  final ProjectController projectController = Get.put(ProjectController());
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Espace supérieur pour le Web ou Mobile
          const SizedBox(
            height: kIsWeb ? defaultPadding * 2 : defaultPadding / 2,
          ),
          const Row(
            children: [Spacer(), NavigationButtonList(), Spacer()],
          ),
          // Barre de navigation supérieure
          const SizedBox(
            height: 80,
            child: TopNavigationBar(),
          ),

          // Section du titre
          if (Responsive.isLargeMobile(context))
            const SizedBox(
              height: defaultPadding,
            ),
          const TitleText(prefix: 'Latest', title: 'Projects'),
          const SizedBox(
            height: defaultPadding,
          ),

          // Grille de contenu
          Expanded(
            // Contrôle la taille de la grille dans la mise en page
            child: Responsive(
              desktop: ProjectGrid(
                crossAxisCount: 3,
              ),
              extraLargeScreen: ProjectGrid(
                crossAxisCount: 4,
              ),
              largeMobile: ProjectGrid(
                crossAxisCount: 1,
                ratio: 1.8,
              ),
              mobile: ProjectGrid(
                crossAxisCount: 1,
                ratio: 1.5,
              ),
              tablet: ProjectGrid(
                crossAxisCount: 2,
                ratio: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
