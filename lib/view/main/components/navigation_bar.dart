import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/main/components/connect_button.dart';
import '../../../res/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 350;

  @override
  Widget build(BuildContext context) {
    final bool mobile = isMobile(context);
    final bool smallMobile = isSmallMobile(context);
    return Container(
      height: mobile ? 60 : 80,
      padding: EdgeInsets.symmetric(
        horizontal: smallMobile ? 4.0 : (mobile ? 8.0 : defaultPadding),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!mobile) const Spacer(flex: 1),
          // Bouton Email (taille originale conservée)
          _buildEmailButton(context, mobile, smallMobile),
          // Espacement ajusté entre les boutons
          SizedBox(width: mobile ? 32.0 : 64.0), // Espacement modifié ici
          // Bouton Connect (taille originale conservée)
          const ConnectButton(),
          if (!mobile) const Spacer(flex: 1),
        ],
      ),
    );
  }

  Widget _buildEmailButton(
      BuildContext context, bool mobile, bool smallMobile) {
    // Tailles adaptées mais gardant les mêmes proportions
    final buttonWidth = smallMobile ? 120.0 : 150.0;
    final buttonHeight = mobile ? 50.0 : 60.0;
    final iconSize = smallMobile ? 12.0 : 15.0;
    final fontSize =
        smallMobile ? 10.0 : Theme.of(context).textTheme.labelSmall!.fontSize;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: smallMobile ? defaultPadding / 2 : defaultPadding,
        horizontal: smallMobile ? 2.0 : (mobile ? 4.0 : 0),
      ),
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse('mailto:rodrigue-cimas@outlook.fr'));
        },
        borderRadius: BorderRadius.circular(defaultPadding + 10),
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding),
            gradient: LinearGradient(colors: [
              Colors.pink,
              Colors.blue.shade900,
            ]),
            boxShadow: const [
              BoxShadow(
                color: Colors.blue,
                offset: Offset(0, -1),
                blurRadius: defaultPadding / 4,
              ),
              BoxShadow(
                color: Colors.red,
                offset: Offset(0, 1),
                blurRadius: defaultPadding / 4,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.email,
                color: Colors.greenAccent,
                size: iconSize,
              ),
              SizedBox(
                  width: smallMobile ? defaultPadding / 4 : defaultPadding / 2),
              Text(
                'Email',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.white,
                      letterSpacing: smallMobile ? 0.8 : 1.2,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
