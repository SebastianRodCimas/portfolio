import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../../../view model/responsive.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.prefix, required this.title});

  final String prefix;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [Colors.pink, Colors.blue],
            ).createShader(bounds);
          },
          child: Text(
            '$prefix ',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: !Responsive.isDesktop(context)
                  ? Responsive.isLargeMobile(context)
                      ? 20
                      : 30
                  : 50,
              fontWeight: FontWeight.bold,
              color: Colors.white, // This color will be masked by the shader
              shadows: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.1),
                  offset: Offset(-2, 2),
                  blurRadius: 0,
                ),
                BoxShadow(
                  color: Colors.blue.withOpacity(0.1),
                  offset: Offset(2, -2),
                  blurRadius: 0,
                ),
              ],
            ),
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              end: Alignment.centerRight,
              begin: Alignment.centerLeft,
              colors: [
                Colors.pink,
                Colors.blueAccent,
              ],
            ).createShader(bounds);
          },
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white, // This color will be masked by the shader
              fontSize: !Responsive.isDesktop(context)
                  ? Responsive.isLargeMobile(context)
                      ? 20
                      : 30
                  : 50,
              fontWeight: FontWeight.bold,
              shadows: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.1),
                  offset: Offset(-2, 2),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.1),
                  offset: Offset(2, -2),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
