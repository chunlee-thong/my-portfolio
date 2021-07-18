import 'package:flutter/material.dart';
import 'package:my_portfolio/src/model/portfolio_model.dart';
import 'package:my_portfolio/src/widgets/content_layout.dart';
import 'package:my_portfolio/src/widgets/portfolio_item_card.dart';
import 'package:sura_flutter/sura_flutter.dart';

class PortfolioContent extends StatelessWidget {
  static const List<PortfolioModel> portfolios = [
    const PortfolioModel(
      image: "my-expend.png",
      appName: "My Expend",
      description: "An application to manage your daily expense and report",
      playStoreLink: "https://play.google.com/store/apps/details?id=com.chunlee.my_expends&hl=en&gl=US",
      appstoreLink: "https://apps.apple.com/bh/app/my-expends/id1550946230",
    ),
    const PortfolioModel(
      image: "travona.png",
      appName: "Travona",
      description: "Attraction booking app in Cambodia",
      playStoreLink: "https://play.google.com/store/apps/details?id=net.travona.travona&hl=en&gl=US",
      appstoreLink: "https://apps.apple.com/kh/app/travona/id1492653916",
    ),
    const PortfolioModel(
      image: "gogym.png",
      appName: "Go Gym",
      description: "Membership app for Go Gym Cambodia",
      playStoreLink: "https://play.google.com/store/apps/details?id=com.asurraa.gogym&hl=en&gl=US",
      appstoreLink: "https://apps.apple.com/in/app/gogym-mobile/id1557106614",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SectionTitle(title: "Portfolio"),
          SpaceY(24),
          GridView.extent(
            maxCrossAxisExtent: 768,
            childAspectRatio: 16 / 12,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            primary: false,
            shrinkWrap: true,
            children: portfolios.map((item) => PortfolioItemCard(item: item)).toList(),
          ),
        ],
      ),
    );
  }
}
