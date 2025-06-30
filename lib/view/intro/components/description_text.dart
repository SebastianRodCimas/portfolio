import 'package:flutter/material.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText({
    super.key,
    required this.start,
    required this.end,
  });

  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    const String descriptionLine1 =
        'With three years of professional experience in a work-study program,';
    const String descriptionLine2 =
        'I had the opportunity to develop end-to-end IT projects';
    const String descriptionLine3 =
        'in various sectors such as green energy, security, and industrial machines.';

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              descriptionLine1,
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: value,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              descriptionLine2,
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: value,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              descriptionLine3,
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: value,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
          ],
        );
      },
    );
  }
}
