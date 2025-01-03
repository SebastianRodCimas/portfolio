import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/social_media_list.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'animated_texts_componenets.dart';
import 'combine_subtitle.dart';
import 'description_text.dart';
import 'download_button.dart';
import 'headline_text.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!Responsive.isDesktop(context))
              SizedBox(
                height: size.height * 0.06,
              ),
            if (!Responsive.isDesktop(context))
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.23,
                  ),
                ],
              ),
            if (!Responsive.isDesktop(context))
              SizedBox(
                height: size.height * 0.1,
              ),
            const Responsive(
                desktop: MyPortfolioText(start: 40, end: 50),
                largeMobile: MyPortfolioText(start: 40, end: 35),
                mobile: MyPortfolioText(start: 35, end: 30),
                tablet: MyPortfolioText(start: 50, end: 40)),
            if (kIsWeb && Responsive.isLargeMobile(context))
              Container(
                height: defaultPadding,
                color: Colors.transparent,
              ),
            const CombineSubtitleText(),
            const SizedBox(height: defaultPadding / 2),
            Responsive(
              desktop: AnimatedDescriptionText(start: 14, end: 15),
              largeMobile: AnimatedDescriptionText(start: 14, end: 12),
              mobile: AnimatedDescriptionText(start: 14, end: 12),
              tablet: AnimatedDescriptionText(start: 17, end: 14),
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            const DownloadButton(),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ABOUT ME',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: defaultPadding / 1),
            const Text(
              'I am a passionate developer with experience in various technologies.\nI love creating innovative solutions and working on challenging projects.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: defaultPadding / 1),
            GestureDetector(
              onTap: () {
                // Navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutDialog()),
                );
              },
              child: Row(
                children: [
                  const Text(
                    'LEARN MORE ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              ),
            ),

            const SizedBox(height: defaultPadding / 1.5),

            GestureDetector(
              onTap: () {
                // Navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutDialog()),
                );
              },
              child: Positioned(
                bottom: -2,
                left: 7,
                child: Container(
                  width: 100, // Adjust the width as needed
                  height: 6,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding), // Added spacing here
            const AnimatedImageContainer(),
            const SizedBox(height: defaultPadding),
            const Text(
              'ABOUT ME',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: defaultPadding / 1),
            const Text(
              'I am a passionate developer with experience in various technologies.\nI love creating innovative solutions and working on challenging projects.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: defaultPadding / 1),
            GestureDetector(
              onTap: () {
                // Navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutDialog()),
                );
              },
              child: Row(
                children: [
                  const Text(
                    'LEARN MORE ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding / 1.5),
            GestureDetector(
              onTap: () {
                // Navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutDialog()),
                );
              },
              child: Positioned(
                bottom: -2,
                left: 7,
                child: Container(
                  width: 100, // Adjust the width as needed
                  height: 6,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
          ],
        ),
        const Spacer()
      ],
    );
  }
}
