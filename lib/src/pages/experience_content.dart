import 'package:flutter/material.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/src/constant/style_decoration.dart';
import 'package:my_portfolio/src/widgets/content_layout.dart';
import 'package:my_portfolio/src/widgets/content_wrapper.dart';
import 'package:sura_flutter/sura_flutter.dart';

class ExperienceContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SectionTitle(title: "experience"),
          ExperienceItem(
            position: "Android Developer",
            company: "Optistech",
            description: ["Develop an Android application using MVP pattern, Retrofit, RxJava and Kotlin."],
            period: "December 2018 - April 2019",
          ),
          ExperienceItem(
            position: "Senior Flutter Developer",
            company: "Optistech",
            description: [
              "Develop an Android and iOS application using Flutter framework.",
              "Teach junior developer.",
              "Create reusable Package and Plugin.",
            ],
            period: "April 2019 - Present",
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String position;
  final String company;
  final List<String> description;
  final String period;
  const ExperienceItem({
    Key? key,
    required this.position,
    required this.company,
    required this.description,
    required this.period,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            position.toUpperCase(),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          Divider(),
          Row(
            children: [
              Text(
                company.toUpperCase(),
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
              SpaceX(24),
              Text(
                period,
                style: kMuliTextStyle.copyWith(
                  fontSize: 16,
                  color: MyPortfolio.accentColor,
                ),
              ),
            ],
          ),
          SpaceY(),
          for (var desc in description)
            Text(
              "- $desc",
              style: kMuliTextStyle.copyWith(fontSize: 16),
            ),
        ],
      ),
    );
  }
}
