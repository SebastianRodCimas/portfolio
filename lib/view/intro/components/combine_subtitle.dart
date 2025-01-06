import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/subtitle_text.dart';

class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    // Taille de l'écran
    var screenWidth = MediaQuery.of(context).size.width;

    // Ajustement des tailles de texte en fonction de la largeur de l'écran
    double startSize = screenWidth > 1080
        ? 30
        : screenWidth > 700
            ? 25
            : 20; // Plus petit pour les petits écrans
    double endSize = screenWidth > 1080
        ? 40
        : screenWidth > 700
            ? 35
            : 25;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Première ligne de texte
        AnimatedSubtitleText(
          start: startSize, // Taille de police ajustée
          end: endSize, // Taille de police ajustée
          text: 'Computer and information systems expert ',
        ),
        const SizedBox(height: 10),

        // Deuxième ligne de texte avec gradient appliqué
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [Colors.pink, Colors.blue],
            ).createShader(bounds);
          },
          child: AnimatedSubtitleText(
            start: startSize, // Taille de police ajustée
            end: endSize, // Taille de police ajustée
            text: 'Full Stack Developer\n',
            gradient: false,
          ),
        ),
      ],
    );
  }
}
