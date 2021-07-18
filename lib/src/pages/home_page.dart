import 'package:flutter/material.dart';
import 'package:my_portfolio/src/constant/info.dart';
import 'package:my_portfolio/src/constant/style_decoration.dart';
import 'package:my_portfolio/src/provider/menu_provider.dart';
import 'package:my_portfolio/src/util/responsive_util.dart';
import 'package:my_portfolio/src/widgets/content_layout.dart';
import 'package:my_portfolio/src/widgets/side_menu.dart';
import 'package:my_portfolio/src/widgets/toggle_menu_layout.dart';
import 'package:provider/provider.dart';
import 'package:sura_flutter/sura_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      MenuProvider.getProvider(context).initScrollListener(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobileOrTablet = ResponsiveUtils.isMobileOrTablet(context);
    return Scaffold(
      appBar: isMobileOrTablet ? buildAppBar() : null,
      body: isMobileOrTablet
          ? Stack(
              children: [
                const ContentLayout(),
                const ToggleMenuLayout(),
              ],
            )
          : buildDesktopLayout(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        kFullName,
        style: kMuliTextStyle.copyWith(fontSize: 24, color: Colors.white),
      ),
      centerTitle: false,
      elevation: 0.0,
      actions: [
        Consumer<MenuProvider>(
          builder: (ctx, menu, _) => TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 200),
            tween: Tween<double>(
              begin: 0.0,
              end: menu.expandMenu ? 1.0 : 0.0,
            ),
            onEnd: () {},
            builder: (context, data, child) => SuraIconButton(
              onTap: () {
                MenuProvider.getProvider(context).toggleMenu();
              },
              margin: const EdgeInsets.all(8),
              borderSide: BorderSide(
                color: Colors.white38,
                width: 0.3,
              ),
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Colors.white,
                progress: AlwaysStoppedAnimation<double>(data),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildDesktopLayout() {
    return Row(
      children: [
        const SideMenu(),
        const Expanded(
          child: const ContentLayout(),
        ),
      ],
    );
  }
}
