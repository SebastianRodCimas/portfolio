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
            width: 80, // Adjust logo size as needed
            height: 80,
          ),
        ),
        if (isMobile(context) || isDesktop(context))
          const SizedBox(height: defaultPadding),
        // Programming Language Icons with Continuous Animation
        SizedBox(
          height: 30,
          // Adjust height as needed
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return FractionalTranslation(
                translation: _animation.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: projectList[widget.index].languages.map((logo) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset(
                        logo,
                        width: 35,
                        height: 35,
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
