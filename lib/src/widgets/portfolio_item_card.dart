import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/src/constant/style_decoration.dart';
import 'package:my_portfolio/src/model/portfolio_model.dart';
import 'package:sura_flutter/sura_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioItemCard extends StatelessWidget {
  final PortfolioModel item;

  const PortfolioItemCard({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.appName,
            style: TextStyle(color: MyPortfolio.accentColor, fontSize: 24),
          ),
          Text(
            item.description,
            style: kMuliTextStyle,
          ),
          SpaceY(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                icon: Icon(FlutterIcons.android_head_mco, color: MyPortfolio.accentColor),
                onPressed: () async {
                  if (await canLaunch(item.playStoreLink)) {
                    launch(item.playStoreLink);
                  }
                },
                style: TextButton.styleFrom(
                  primary: MyPortfolio.accentColor,
                ),
                label: Text("View on PlayStore"),
              ),
              SpaceX(32),
              TextButton.icon(
                icon: Icon(FlutterIcons.app_store_ent, color: MyPortfolio.accentColor),
                onPressed: () async {
                  if (await canLaunch(item.appstoreLink)) {
                    launch(item.appstoreLink);
                  }
                },
                style: TextButton.styleFrom(
                  primary: MyPortfolio.accentColor,
                ),
                label: Text("View on AppStore"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildImage() {
    return Expanded(
      child: ClipRRect(
        borderRadius: SuraDecoration.radiusTop(4),
        child: Image.asset(
          "assets/img/${item.image}",
          errorBuilder: (context, obj, data) {
            return Center(child: Icon(Icons.image));
          },
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
