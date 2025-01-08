import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import 'package:flutter_portfolio/view/main/components/navigation_button_list.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';

class TimelinePage extends StatelessWidget {
  final List<TimelineEvent> events = [
    TimelineEvent(
      title: "Mobile Developer Intern - Syrius Solar Industry",
      date: "September 13, 2021 - September 16, 2022",
      description:
          "Created mobile applications for sales representatives to facilitate and improve customer file management.",
      isSchool: false,
    ),
    TimelineEvent(
      title: "EPSI Montpellier - EISI Program",
      date: "RNCP31678 Certification (Level 6 Obtained)",
      description: "Training in application design and development.",
      isSchool: true,
    ),
    TimelineEvent(
      title: "Web Application Developer Intern - ALX technology",
      date: "September 20, 2022 - January 3, 2023",
      description:
          "Developed desktop applications to improve quality for clients.",
      isSchool: false,
    ),
    TimelineEvent(
      title: "EPSI Montpellier - EISI Program",
      date: "RNCP36286 Certification (Level 7 Obtained)",
      description: "Training in computer science and information systems.",
      isSchool: true,
    ),
    TimelineEvent(
      title: "Mobile Developer Intern - STIM",
      date: "June 18, 2023 - October 11, 2024",
      description:
          "Developed a mobile application to manage and view surveillance cameras.",
      isSchool: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          kIsWeb
              ? const SizedBox(
                  height: defaultPadding * 2,
                )
              : const SizedBox(
                  height: defaultPadding / 2,
                ),
          if (!Responsive.isMobile(context))
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
          Expanded(
            child: ListView.builder(
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
                          backgroundColor: event.isSchool
                              ? Colors.pinkAccent
                              : Colors.blueAccent,
                          child: Icon(
                            event.isSchool ? Icons.school : Icons.work,
                            color: Colors.white,
                          ),
                        ),
                        if (index != events.length - 1)
                          Container(
                            height: Responsive.isMobile(context)
                                ? screenHeight * 0.15 // Hauteur pour mobile
                                : screenHeight * 0.12, // Hauteur pour desktop
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
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineEvent {
  final String title;
  final String date;
  final String description;
  final bool isSchool;

  TimelineEvent({
    required this.title,
    required this.date,
    required this.description,
    required this.isSchool,
  });
}
