import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/src/constant/info.dart';
import 'package:my_portfolio/src/constant/style_decoration.dart';
import 'package:my_portfolio/src/util/responsive_util.dart';
import 'package:my_portfolio/src/widgets/circle_icon_button.dart';
import 'package:my_portfolio/src/widgets/content_wrapper.dart';
import 'package:my_portfolio/src/widgets/my_avatar.dart';
import 'package:sura_flutter/sura_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isMobileOrTablet = ResponsiveUtils.isMobileOrTablet(context);
    return ContentWrapper(
      child: Column(
        crossAxisAlignment: isMobileOrTablet ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isMobileOrTablet) MyAvatar(),
          Text(kFullName.toUpperCase(), style: TextStyle(fontSize: 54).bold),
          GestureDetector(
            onTap: () async {
              await launch("mailto:$kEmail");
            },
            child: Text(
              kEmail,
              style: TextStyle(color: MyPortfolio.accentColor, fontSize: 24),
            ),
          ),
          SpaceY(),
          Text(
            kAbout,
            style: kMuliTextStyle.copyWith(fontSize: 18),
          ),
          Container(
            margin: const EdgeInsets.only(left: 0, top: 40),
            child: Row(
              mainAxisAlignment: isMobileOrTablet ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                CircleIconButton(
                  icon: FlutterIcons.linkedin_square_ant,
                  bgColor: Color(0xFF0A66C2),
                  link: kLinkedInLink,
                ),
                CircleIconButton(
                  icon: FlutterIcons.github_ant,
                  bgColor: Colors.black,
                  link: kGithubLink,
                ),
                CircleIconButton(
                  icon: FlutterIcons.twitter_ant,
                  bgColor: Color(0xFF1DA1F2),
                  link: kTwitterLink,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
