import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import 'package:flutter_portfolio/view/main/components/navigation_button_list.dart';

class AnimatedLine extends StatefulWidget {
  final double maxHeight;
  final Duration duration;
  final bool isLastItem;

  const AnimatedLine({
    super.key,
    required this.maxHeight,
    this.duration = const Duration(seconds: 2),
    this.isLastItem = false,
  });

  @override
  State<AnimatedLine> createState() => _AnimatedLineState();
}

class _AnimatedLineState extends State<AnimatedLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 0, end: widget.maxHeight).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          height: widget.isLastItem ? 0.5 : _animation.value,
          width: 2,
          color: Colors.teal.shade700,
        );
      },
    );
  }
}

class TimelinePage extends StatelessWidget {
  final List<TimelineEvent> events1 = [
    TimelineEvent(
      title: "Mobile Developer Intern - Syrius Solar Industry",
      date: "September 13, 2021 - September 16, 2022",
      description:
          "Created mobile applications for sales representatives to facilitate and improve customer file management.",
      isSchool: false,
      isPersonnal: false,
      icon: Icons.work,
    ),
    TimelineEvent(
      title: "EPSI Montpellier - EISI Program",
      date: "RNCP31678 Certification (Level 6 Obtained)",
      description: "Training in application design and development.",
      isSchool: true,
      isPersonnal: false,
      icon: Icons.school,
    ),
    TimelineEvent(
      title: "Web Application Developer Intern - ALX technology",
      date: "September 20, 2022 - January 3, 2023",
      description:
          "Developed desktop applications to improve quality for clients.",
      isSchool: false,
      isPersonnal: false,
      icon: Icons.work,
    ),
    TimelineEvent(
      title: "EPSI Montpellier - EISI Program",
      date: "RNCP36286 Certification (Level 7 Obtained)",
      description: "Training in computer science and information systems.",
      isSchool: true,
      isPersonnal: false,
      icon: Icons.school,
    ),
    TimelineEvent(
      title: "Mobile Developer Intern - STIM",
      date: "June 18, 2023 - October 11, 2024",
      description:
          "Developed a mobile application to manage and view surveillance cameras.",
      isSchool: false,
      isPersonnal: false,
      icon: Icons.work,
    ),
  ];

  final List<TimelineEvent> events2 = [
    TimelineEvent(
      title: "Project co-director/Developper",
      date: "November, 2024 - Present",
      description:
          "Website referencing the different genres of electronic music.",
      isSchool: false,
      isPersonnal: true,
      icon: Icons.music_note,
    ),
    TimelineEvent(
      title: "Project co-director/Developper",
      date: "March 2023 - June, 2023",
      description:
          "Website to book time slots for boating on the shores of Etangs de l'Or.",
      isSchool: false,
      isPersonnal: true,
      icon: Icons.directions_boat,
    ),
    TimelineEvent(
      title: "Developper/Data Manager",
      date: "April 2022 - July 2022",
      description:
          "Desktop application for managing the database of an association that organizes Spanish language courses.",
      isSchool: false,
      isPersonnal: true,
      icon: Icons.dataset_linked_rounded,
    ),
    TimelineEvent(
      title: "Developper",
      date: "September, 2020",
      description:
          "Smart plug used to monitor consumption data via a web platform.\n\nWinner of the France 2020 Workshop Competition.",
      isSchool: false,
      isPersonnal: true,
      icon: Icons.electrical_services,
    ),
  ];

  TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            kIsWeb
                ? const SizedBox(
                    height: defaultPadding * 2,
                  )
                : const SizedBox(
                    height: defaultPadding / 2,
                  ),
            const Row(
              children: [
                Spacer(),
                NavigationButtonList(),
                Spacer(),
              ],
            ),
            const SizedBox(
              height: 80,
              child: TopNavigationBar(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: buildTimeline(context, events1)),
                const SizedBox(width: 20),
                Expanded(child: buildTimeline(context, events2)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimeline(BuildContext context, List<TimelineEvent> events) {
    return Column(
      children: List.generate(events.length, (index) {
        final event = events[index];
        final isLastItem = index == events.length - 1;

        // Utilisation d'un GlobalKey pour mesurer la hauteur réelle du contenu
        final contentKey = GlobalKey();

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icône et ligne de connexion
            Column(
              children: [
                CircleAvatar(
                  radius: 17,
                  backgroundColor: event.isPersonnal
                      ? Colors.purpleAccent
                      : (event.isSchool
                          ? Colors.pinkAccent
                          : Colors.blueAccent),
                  child: Icon(
                    event.icon,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
                if (!isLastItem)
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: 2,
                        color: Colors.teal.shade700,
                        // Utilisation d'un SizedBox avec une hauteur fixe optimisée
                        child: const SizedBox(
                          height:
                              75, // Hauteur fixe optimisée pour iPhone 12 Pro
                        ),
                      );
                    },
                  ),
              ],
            ),
            const SizedBox(width: 15),
            // Contenu texte avec mesure de hauteur
            Expanded(
              child: Column(
                key: contentKey,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.pinkAccent, Colors.blueAccent],
                    ).createShader(bounds),
                    child: Text(
                      event.date,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.pinkAccent, Colors.blueAccent],
                    ).createShader(bounds),
                    child: Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.pinkAccent, Colors.blueAccent],
                    ).createShader(bounds),
                    child: Text(
                      event.description,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                  if (!isLastItem) const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class TimelineEvent {
  final String title;
  final String date;
  final String description;
  final bool isSchool;
  final bool isPersonnal;
  final IconData icon;

  TimelineEvent({
    required this.title,
    required this.date,
    required this.description,
    required this.isSchool,
    required this.isPersonnal,
    required this.icon,
  });
}
