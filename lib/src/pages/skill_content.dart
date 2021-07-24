import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_portfolio/src/constant/style_decoration.dart';
import 'package:my_portfolio/src/widgets/content_layout.dart';
import 'package:my_portfolio/src/widgets/content_wrapper.dart';
import 'package:sura_flutter/sura_flutter.dart';

class SkillContent extends StatelessWidget {
  final List<IconData> skills = [
    FlutterIcons.language_javascript_mco,
    FlutterIcons.nodejs_mco,
    FlutterIcons.npm_faw5d,
    FlutterIcons.react_faw5d,
    Icons.flutter_dash,
    FlutterIcons.android_faw5d,
    FlutterIcons.github_ant,
    FlutterIcons.database_ant,
    FlutterIcons.server_oct,
    FlutterIcons.docker_faw5d,
    FlutterIcons.unity_mco,
  ];

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SectionTitle(title: "Technical Skills"),
          SpaceY(12),
          Text(
            "Programming Languages & tools".toUpperCase(),
            style: Theme.of(context).textTheme.headline5,
          ),
          SpaceY(12),
          Wrap(
            children: skills
                .map(
                  (icon) => Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Icon(
                      icon,
                      color: Colors.grey,
                      size: 54,
                    ),
                  ),
                )
                .toList(),
          ),
          SpaceY(54),
          Text(
            "Specialist".toUpperCase(),
            style: Theme.of(context).textTheme.headline5,
          ),
          SpaceY(),
          SpecialistItem(text: "Cross Platform Mobile App Development with Flutter"),
          SpecialistItem(text: "REST API with NestJS or ExpressJS with both SQL and noSQL"),
          SpecialistItem(text: "Web application with React JS"),
          SpecialistItem(text: "Server configuration, Nginx, Docker, CI/CD"),
        ],
      ),
    );
  }
}

class SpecialistItem extends StatelessWidget {
  final String text;
  const SpecialistItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check),
          SpaceX(),
          Text(
            text,
            style: kMuliTextStyle,
          ).expanded,
        ],
      ),
    );
  }
}
