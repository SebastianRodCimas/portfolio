import 'package:flutter/material.dart';

import '../../../view model/responsive.dart';

class AnimatedDescriptionText extends StatelessWidget {
  AnimatedDescriptionText({required this.start, required this.end});
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    String descriptionText =
        ' With three years of professional experience in a work-study program,'
        '${!Responsive.isLargeMobile(context) ? '\n' : ' '} I had the opportunity to develop end-to-end IT projects '
        '${!Responsive.isLargeMobile(context) ? '\n' : ' '} in various sectors such as green energy, security, and industrial machines ';
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          descriptionText,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.blue[400],
            wordSpacing: 2,
            fontSize: value,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
