import 'package:flutter/material.dart';
import 'package:my_portfolio/src/provider/menu_provider.dart';
import 'package:my_portfolio/src/widgets/side_menu.dart';
import 'package:provider/provider.dart';
import 'package:sura_flutter/sura_flutter.dart';

class ToggleMenuLayout extends StatelessWidget {
  const ToggleMenuLayout();
  @override
  Widget build(BuildContext context) {
    final menu = Provider.of<MenuProvider>(context);
    return SuraExpandable(
      topChild: SizedBox(),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      initiallyExpand: menu.expandMenu,
      bottomChild: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: context.primaryColor),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SideMenuItem(text: "About", index: 0),
              SideMenuItem(text: "Experience", index: 1),
              SideMenuItem(text: "Technical Skills", index: 2),
              SideMenuItem(text: "Other Skills", index: 3),
              SideMenuItem(text: "Portfolio", index: 4),
            ],
          ),
        ),
      ),
    );
  }
}
