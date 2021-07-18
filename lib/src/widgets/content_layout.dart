import 'package:flutter/material.dart';
import 'package:my_portfolio/src/pages/about_content.dart';
import 'package:my_portfolio/src/pages/experience_content.dart';
import 'package:my_portfolio/src/pages/footer.dart';
import 'package:my_portfolio/src/pages/other_skill_content.dart';
import 'package:my_portfolio/src/pages/portfolio_content.dart';
import 'package:my_portfolio/src/pages/skill_content.dart';
import 'package:my_portfolio/src/provider/menu_provider.dart';
import 'package:sura_flutter/sura_flutter.dart';

import 'content_divider.dart';

class ContentLayout extends StatelessWidget {
  const ContentLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MenuProvider.getProvider(context).closeMenu();
      },
      child: ListView(
        controller: MenuProvider.getProvider(context).scrollController,
        children: [
          AboutContent(),
          ContentDivider(),
          ExperienceContent(),
          ContentDivider(),
          SkillContent(),
          ContentDivider(),
          OtherSkillContent(),
          ContentDivider(),
          PortfolioContent(),
          Footer(),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title".toUpperCase(),
      style: TextStyle(fontSize: 54).bold,
    );
  }
}
