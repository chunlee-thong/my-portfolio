import 'package:flutter/material.dart';
import 'package:my_portfolio/src/provider/menu_provider.dart';
import 'package:provider/provider.dart';
import 'package:sura_flutter/sura_flutter.dart';

import 'my_avatar.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: context.primaryColor,
      ),
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyAvatar(),
          SpaceY(24),
          SideMenuItem(text: "About", index: 0),
          SideMenuItem(text: "Experience", index: 1),
          SideMenuItem(text: "Technical Skills", index: 2),
          SideMenuItem(text: "Other Skills", index: 3),
          SideMenuItem(text: "Portfolio", index: 4),
        ],
      ),
    );
  }
}

class SideMenuItem extends StatefulWidget {
  final String text;
  final int index;
  const SideMenuItem({Key? key, required this.text, required this.index}) : super(key: key);

  @override
  _SideMenuItemState createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, menu, child) {
        bool selected = menu.index == widget.index;
        final style = TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
          color: selected
              ? Colors.white
              : hover
                  ? Colors.white70
                  : Colors.white38,
        );
        return InkResponse(
          onHover: (event) {
            setState(() {
              hover = event;
            });
          },
          onTap: () {
            MenuProvider.getProvider(context).scrollToSection(context, widget.index);
          },
          child: Container(
            child: Text(
              widget.text.toUpperCase(),
              style: style,
            ),
            margin: const EdgeInsets.only(bottom: 16),
          ),
        );
      },
    );
  }
}
