import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color? bgColor;
  final String link;

  const CircleIconButton({
    Key? key,
    required this.icon,
    required this.link,
    required this.bgColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      child: Material(
        color: bgColor,
        shape: const CircleBorder(),
        child: InkResponse(
          onTap: () async {
            if (await canLaunch(link)) {
              await launch(link);
            }
          },
          customBorder: const CircleBorder(),
          borderRadius: BorderRadius.circular(32),
          hoverColor: MyPortfolio.accentColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),

          // child: IconButton(
          //   onPressed: () {},
          //   color: Colors.black,
          //   hoverColor: context.accentColor,
          //   icon: Icon(
          //     FlutterIcons.github_alt_faw,
          //     color: Colors.white,
          //   ),
          // ),
        ),
      ),
    );
  }
}
