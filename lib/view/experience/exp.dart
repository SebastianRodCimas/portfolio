import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
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
      date: "September 2021 - September 2022",
      description:
          "Created mobile applications for sales representatives to facilitate and improve customer file management.",
      isSchool: false,
      isPersonnal: false,
      icon: Icons.work,
    ),
    TimelineEvent(
      title: "EPSI Montpellier - EISI Program",
      date: "RNCP31678 Certification Level 6",
      description: "Training in application design and development.",
      isSchool: true,
      isPersonnal: false,
      icon: Icons.school,
    ),
    TimelineEvent(
      title: "Web Application Developer Intern - ALX technology",
      date: "September 2022 - January 2023",
      description:
          "Developed desktop applications to improve quality for clients.",
      isSchool: false,
      isPersonnal: false,
      icon: Icons.work,
    ),
    TimelineEvent(
      title: "Mobile Developer Intern - STIM",
      date: "June 2023 - October 2024",
      description:
          "Developed a mobile application to manage and view surveillance cameras.",
      isSchool: false,
      isPersonnal: false,
      icon: Icons.work,
    ),
    TimelineEvent(
      title: "EPSI Montpellier - EISI Program",
      date: "September 2019 - November 2024 RNCP36286 Certification Level 7",
      description: "Training in computer science and information systems.",
      isSchool: true,
      isPersonnal: false,
      icon: Icons.school,
    ),
  ];

  final List<TimelineEvent> events2 = [
    TimelineEvent(
      title: "Project co-director/Lead Developer",
      date: "December, 2024 - Present",
      description:
          "Website referencing the different genres of electronic music.",
      isSchool: false,
      isPersonnal: true,
      icon: Icons.music_note,
    ),
    TimelineEvent(
      title: "Project co-director/Developer",
      date: "March 2023 - June, 2023",
      description:
          "Website to book time slots for boating on the shores of Etangs de l'Or.",
      isSchool: false,
      isPersonnal: true,
      icon: Icons.directions_boat,
    ),
    TimelineEvent(
      title: "Developer/Data Manager",
      date: "April 2022 - July 2022",
      description:
          "Desktop application for managing the database of an association that organizes Spanish language courses.",
      isSchool: false,
      isPersonnal: true,
      icon: Icons.dataset_linked_rounded,
    ),
    TimelineEvent(
      title: "Developer",
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
                ? const SizedBox(height: defaultPadding * 2)
                : const SizedBox(height: defaultPadding / 2),
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
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 600;
                final avatarSize = isMobile ? 30.0 : 45.0;
                final lineHeight = isMobile ? 60.0 : 80.0;

                return isMobile
                    ? Column(
                        children: [
                          _buildResponsiveTimeline(
                            context: context,
                            events: events1,
                            avatarSize: avatarSize,
                            lineHeight: lineHeight,
                          ),
                          const SizedBox(height: 30),
                          _buildResponsiveTimeline(
                            context: context,
                            events: events2,
                            avatarSize: avatarSize,
                            lineHeight: lineHeight,
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildResponsiveTimeline(
                              context: context,
                              events: events1,
                              avatarSize: avatarSize,
                              lineHeight: lineHeight,
                            ),
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            child: _buildResponsiveTimeline(
                              context: context,
                              events: events2,
                              avatarSize: avatarSize,
                              lineHeight: lineHeight,
                            ),
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveTimeline({
    required BuildContext context,
    required List<TimelineEvent> events,
    required double avatarSize,
    required double lineHeight,
  }) {
    return Column(
      children: List.generate(events.length, (index) {
        final event = events[index];
        final isLastItem = index == events.length - 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Partie timeline (avatar + ligne)
            SizedBox(
              width: avatarSize + 20,
              child: Column(
                children: [
                  _buildAnimatedAvatar(
                    event: event,
                    size: avatarSize,
                  ),
                  if (!isLastItem)
                    AnimatedLine(
                      maxHeight: lineHeight,
                      duration: const Duration(milliseconds: 800),
                    ),
                ],
              ),
            ),
            SizedBox(width: avatarSize * 0.7),
            // Contenu textuel
            Expanded(
              child: _buildEventContent(
                event: event,
                isMobile: MediaQuery.of(context).size.width < 600,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildAnimatedAvatar({
    required TimelineEvent event,
    required double size,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              (event.isPersonnal
                      ? Colors.purpleAccent
                      : (event.isSchool
                          ? Colors.pinkAccent
                          : Colors.blueAccent))
                  .withOpacity(0.3),
              Colors.white.withOpacity(0.2),
            ],
          ),
        ),
        child: CircleAvatar(
          radius: size / 2,
          backgroundColor: event.isPersonnal
              ? Colors.purpleAccent
              : (event.isSchool ? Colors.pinkAccent : Colors.blueAccent),
          child: Icon(
            event.icon,
            color: Colors.white,
            size: size * 0.6,
          ),
        ),
      ),
    );
  }

  Widget _buildEventContent({
    required TimelineEvent event,
    required bool isMobile,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.pinkAccent, Colors.blueAccent],
          ).createShader(bounds),
          child: Text(
            event.date,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 8 : 10),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.pinkAccent, Colors.blueAccent],
          ).createShader(bounds),
          child: Text(
            event.title,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 10 : 12),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.pinkAccent, Colors.blueAccent],
          ).createShader(bounds),
          child: Text(
            event.description,
            style: TextStyle(
              fontSize: isMobile ? 13 : 15,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
        ),
        if (!isMobile) SizedBox(height: isMobile ? 15 : 20),
      ],
    );
  }
}

Widget buildTimeline(BuildContext context, List<TimelineEvent> events) {
  return Column(
    children: List.generate(events.length, (index) {
      final event = events[index];
      final isLastItem = index == events.length - 1;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: event.isPersonnal
                    ? Colors.purpleAccent
                    : (event.isSchool ? Colors.pinkAccent : Colors.blueAccent),
                child: Icon(
                  event.icon,
                  color: Colors.white,
                  size: ResponsiveText.getScaledTextSize(context, 17),
                ),
              ),
              if (!isLastItem)
                Container(
                  width: 2,
                  height: ResponsiveText.getScaledTextSize(context, 75),
                  color: Colors.teal.shade700,
                ),
            ],
          ),
          SizedBox(width: ResponsiveText.getScaledTextSize(context, 15)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.blueAccent],
                  ).createShader(bounds),
                  child: Text(
                    event.date,
                    style: TextStyle(
                      fontSize: ResponsiveText.getScaledTextSize(context, 13),
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                ),
                SizedBox(height: ResponsiveText.getScaledTextSize(context, 3)),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.blueAccent],
                  ).createShader(bounds),
                  child: Text(
                    event.title,
                    style: TextStyle(
                      fontSize: ResponsiveText.getScaledTextSize(context, 12),
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                ),
                SizedBox(height: ResponsiveText.getScaledTextSize(context, 5)),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.blueAccent],
                  ).createShader(bounds),
                  child: Text(
                    event.description,
                    style: TextStyle(
                      fontSize: ResponsiveText.getScaledTextSize(context, 11),
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                ),
                if (!isLastItem)
                  SizedBox(
                      height: ResponsiveText.getScaledTextSize(context, 4)),
              ],
            ),
          ),
        ],
      );
    }),
  );
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
