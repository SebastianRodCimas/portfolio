import 'package:flutter/material.dart';

import 'package:flutter_portfolio/view/main/components/connect_button.dart';
import '../../../res/constants.dart';

import 'package:url_launcher/url_launcher.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: InkWell(
              onTap: () {
                launchUrl(Uri.parse('mailto:rodrigue-cimas@outlook.fr'));
              },
              borderRadius: BorderRadius.circular(defaultPadding + 10),
              child: Container(
                height: 60,
                width: 150,
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
                    const Icon(
                      Icons.email,
                      color: Colors.greenAccent,
                      size: 15,
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.white,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          const ConnectButton(),
          const Spacer(),
        ],
      ),
    );
  }
}
