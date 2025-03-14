import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/experience/exp.dart';
import 'package:flutter_portfolio/view/skills/skills.dart';

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
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, // Marges adaptatives
          vertical: size.height * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Responsive(
              desktop: _buildDesktopLayout(size, context),
              tablet: _buildTabletLayout(size, context),
              largeMobile: _buildLargeMobileLayout(size, context),
              mobile: _buildMobileLayout(size, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(Size size, BuildContext context) {
    return Row(
      children: [
        const Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Responsive(
                desktop: MyPortfolioText(start: 40, end: 50),
                largeMobile: MyPortfolioText(start: 40, end: 35),
                mobile: MyPortfolioText(start: 35, end: 30),
                tablet: MyPortfolioText(start: 50, end: 40),
              ),
              SizedBox(height: defaultPadding / 2),
              CombineSubtitleText(),
              Responsive(
                desktop: AnimatedDescriptionText(start: 14, end: 15),
                largeMobile: AnimatedDescriptionText(start: 14, end: 12),
                mobile: AnimatedDescriptionText(
                  start: 14,
                  end: 12,
                ),
                tablet: AnimatedDescriptionText(start: 17, end: 14),
              ),
              SizedBox(height: defaultPadding * 2),
              DownloadButton(),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Experience',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              const Text(
                'My years of experience have enabled me to work autonomously while making key decisions\n'
                'to successfully execute each project undertaken during my work-study program',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent),
              ),
              const SizedBox(height: defaultPadding),
              GestureDetector(
                onTap: () {
                  // Navigation logic
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimelinePage()),
                  );
                },
                child: const Row(
                  children: [
                    Text(
                      'LEARN MORE ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 14,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding),
              const AnimatedImageContainer(),
              const SizedBox(height: defaultPadding),
              const Text(
                'Skills',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              const Text(
                'Over the past few years, I have acquired numerous skills in various fields by developing optimal IT solutions\n',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent),
              ),
              const SizedBox(height: defaultPadding),
              GestureDetector(
                onTap: () {
                  // Navigation logic
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SkillsPage()),
                  );
                },
                child: const Row(
                  children: [
                    Text(
                      'LEARN MORE ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(Size size, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Responsive(
          desktop: MyPortfolioText(start: 40, end: 50),
          largeMobile: MyPortfolioText(start: 40, end: 35),
          mobile: MyPortfolioText(start: 35, end: 30),
          tablet: MyPortfolioText(start: 50, end: 40),
        ),
        const SizedBox(height: defaultPadding),
        const CombineSubtitleText(),
        const Responsive(
          desktop: AnimatedDescriptionText(start: 14, end: 15),
          largeMobile: AnimatedDescriptionText(start: 14, end: 12),
          mobile: AnimatedDescriptionText(
            start: 14,
            end: 12,
          ),
          tablet: AnimatedDescriptionText(start: 17, end: 14),
        ),

        // Texte d'introduction
        const SizedBox(height: defaultPadding),
        const Text(
          'Experience',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        const Text(
          'My years of experience have enabled me to work autonomously while making key decisions\n'
          'to successfully execute each project undertaken during my work-study program',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent),
        ),
        const SizedBox(height: defaultPadding),
        GestureDetector(
          onTap: () {
            // Navigation logic
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimelinePage()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LEARN MORE ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        const AnimatedImageContainer(),

        const SizedBox(height: defaultPadding),
        const Text(
          'Skills',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        const Text(
          'Over the past few years, I have acquired numerous skills in various fields by developing optimal IT solutions\n',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent),
        ),
        const SizedBox(height: defaultPadding),
        const SizedBox(height: defaultPadding),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SkillsPage()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LEARN MORE ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),

        const DownloadButton(),
      ],
    );
  }

  Widget _buildLargeMobileLayout(Size size, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Responsive(
          desktop: MyPortfolioText(start: 40, end: 50),
          largeMobile: MyPortfolioText(start: 40, end: 35),
          mobile: MyPortfolioText(start: 35, end: 30),
          tablet: MyPortfolioText(start: 50, end: 40),
        ),
        const SizedBox(height: defaultPadding),
        const CombineSubtitleText(),
        const AnimatedDescriptionText(
            start: 12, end: 14), // Texte d'introduction
        const SizedBox(height: defaultPadding),
        const Text(
          'ABOUT ME', // Section ABOUT ME
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        const Text(
          'Experience',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        const Text(
          'My years of experience have enabled me to work autonomously while making key decisions\n'
          'to successfully execute each project undertaken during my work-study program',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent),
        ),
        const SizedBox(height: defaultPadding),
        GestureDetector(
          onTap: () {
            // Navigation logic
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimelinePage()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LEARN MORE ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        const AnimatedImageContainer(),

        const SizedBox(height: defaultPadding),
        const Text(
          'Skills',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        const Text(
          'Over the past few years, I have acquired numerous skills in various fields by developing optimal IT solutions\n',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent),
        ),
        const SizedBox(height: defaultPadding),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SkillsPage()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LEARN MORE ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        const DownloadButton(),
      ],
    );
  }

  Widget _buildMobileLayout(Size size, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Responsive(
          desktop: MyPortfolioText(start: 40, end: 50),
          largeMobile: MyPortfolioText(start: 40, end: 35),
          mobile: MyPortfolioText(start: 35, end: 30),
          tablet: MyPortfolioText(start: 50, end: 40),
        ),
        const SizedBox(height: defaultPadding),
        const CombineSubtitleText(),

        const AnimatedDescriptionText(
            start: 12, end: 14), // Texte d'introduction
        const SizedBox(height: defaultPadding),
        const Text(
          'Experience',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        const Text(
          'My years of experience have enabled me to work autonomously while making key decisions\n'
          'to successfully execute each project undertaken during my work-study program',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent),
        ),
        const SizedBox(height: defaultPadding),
        GestureDetector(
          onTap: () {
            // Navigation logic
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimelinePage()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LEARN MORE ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        const AnimatedImageContainer(),

        const SizedBox(height: defaultPadding),
        const Text(
          'Skills',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        const Text(
          'Over the past few years, I have acquired numerous skills in various fields by developing optimal IT solutions\n',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent),
        ),
        const SizedBox(height: defaultPadding),
        GestureDetector(
          onTap: () {
            // Navigation logic
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SkillsPage()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LEARN MORE ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 14,
              ),
            ],
          ),
        ),

        const SizedBox(height: defaultPadding),
        const DownloadButton(),
      ],
    );
  }
}
