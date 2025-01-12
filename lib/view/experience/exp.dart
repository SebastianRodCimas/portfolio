import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import 'package:flutter_portfolio/view/main/components/navigation_button_list.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';

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
      date: "Novembre, 2024 - Present",
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
          "Website to reserve a time to go boating on the shores of the Etangs de l'Or.",
      isSchool: false,
      isPersonnal: true,
      icon: Icons.directions_boat,
    ),
    TimelineEvent(
      title: "Developper/Data Manager",
      date: "April 2022 - July 2022",
      description:
          "Desktop application to manage the database of an association that organizes Spanish courses.",
      isSchool: false,
      isPersonnal: true,
      icon: Icons.dataset_linked_rounded,
    ),
    TimelineEvent(
      title: "Developper",
      date: "September, 2020",
      description:
          "Plug connected or we could see these consumptions on a website.\n\nWinner of the workshop France 2020 competition.",
      isSchool: false,
      isPersonnal: true,
      icon: Icons.electrical_services,
    ),
  ];

  TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) {
                            return const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.pinkAccent, Colors.blueAccent],
                              stops: [0.2, 0.8],
                            ).createShader(bounds);
                          },
                          child: Text(
                            "Professional Experience",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 3.0,
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        buildTimeline(context, events1, screenHeight),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20), // Espace entre les deux timelines
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) {
                            return const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.pinkAccent, Colors.blueAccent],
                              stops: [0.2, 0.8],
                            ).createShader(bounds);
                          },
                          child: Text(
                            "Personal Experience",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 3.0,
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        buildTimeline(context, events2, screenHeight),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimeline(
      BuildContext context, List<TimelineEvent> events, double screenHeight) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icône et ligne de connexion
            Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: event.isPersonnal
                      ? Colors.purpleAccent
                      : (event.isSchool
                          ? Colors.pinkAccent
                          : Colors.blueAccent),
                  child: Icon(
                    event.icon,
                    color: Colors.white,
                  ),
                ),
                if (index != events.length - 1)
                  Container(
                    height: Responsive.isMobile(context)
                        ? screenHeight * 0.25 // Hauteur pour mobile
                        : screenHeight * 0.12, // Hauteur pour desktop
                    width: 2,
                    color: Colors.teal.shade700,
                  ),
                if (index == events.length - 1)
                  Container(
                    height:
                        0.5, // Ajustez cette valeur pour que la ligne aille jusqu'au bout
                    width: 2,
                    color: Colors.teal.shade700,
                  ),
              ],
            ),
            const SizedBox(width: 20),
            // Contenu texte
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.pinkAccent, Colors.blueAccent],
                        stops: [0.2, 0.8],
                      ).createShader(bounds);
                    },
                    child: Text(
                      event.date,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3.0,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.pinkAccent, Colors.blueAccent],
                        stops: [0.2, 0.8],
                      ).createShader(bounds);
                    },
                    child: Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3.0,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.pinkAccent, Colors.blueAccent],
                        stops: [0.2, 0.8],
                      ).createShader(bounds);
                    },
                    child: Text(
                      event.description,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3.0,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
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
