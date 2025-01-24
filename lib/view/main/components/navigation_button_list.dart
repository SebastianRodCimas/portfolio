import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/project_model.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/view/experience/exp.dart';
import 'package:flutter_portfolio/view/home/home.dart';
import 'package:flutter_portfolio/view/projects/project_view.dart';
import 'package:flutter_portfolio/view/skills/skills.dart';

import 'navigation_button.dart';

class NavigationButtonList extends StatelessWidget {
  const NavigationButtonList({super.key});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Row(
            children: [
              NavigationTextButton(
                  onTap: () {
                    // Navigation logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  text: 'Home'),
              NavigationTextButton(
                  onTap: () {
                    // Navigation logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  text: 'About me'),
              NavigationTextButton(
                  onTap: () {
                    // Navigation logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProjectsView()),
                    );
                  },
                  text: 'Projects'),
              NavigationTextButton(
                  onTap: () {
                    // Navigation logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SkillsPage()),
                    );
                  },
                  text: 'Skills'),
              NavigationTextButton(
                  onTap: () {
                    // Navigation logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimelinePage()),
                    );
                  },
                  text: 'Experience'),
            ],
          ),
        );
      },
    );
  }
}
