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
          _buildEmailButton(context, mobile, smallMobile),
          if (!mobile) const Spacer(flex: 2),
          const ConnectButton(),
          if (!mobile) const Spacer(flex: 1),
        ],
      ),
    );
  }

  Widget _buildEmailButton(
      BuildContext context, bool mobile, bool smallMobile) {
    return Padding(
      padding:
          EdgeInsets.all(smallMobile ? 2.0 : (mobile ? 4.0 : defaultPadding)),
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse('mailto:rodrigue-cimas@outlook.fr'));
        },
        borderRadius: BorderRadius.circular(defaultPadding + 10),
        child: Container(
          height: mobile ? 45 : 60,
          width: smallMobile ? 110 : (mobile ? 130 : 150),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding),
            gradient: const LinearGradient(colors: [
              Colors.pink,
              Colors.blue,
            ]),
            boxShadow: const [
              BoxShadow(
                color: Colors.blue,
                offset: Offset(0, -1),
                blurRadius: 2,
              ),
              BoxShadow(
                color: Colors.red,
                offset: Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.email,
                color: Colors.greenAccent,
                size: smallMobile ? 12 : (mobile ? 14 : 15),
              ),
              SizedBox(
                  width: smallMobile ? 4 : (mobile ? 6 : defaultPadding / 2)),
              Text(
                'Email',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: smallMobile ? 0.8 : 1.2,
                  fontWeight: FontWeight.bold,
                  fontSize: smallMobile ? 9 : (mobile ? 10 : 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
