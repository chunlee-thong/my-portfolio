import 'package:flutter/material.dart';
import 'package:my_portfolio/src/pages/home_page.dart';
import 'package:my_portfolio/src/provider/menu_provider.dart';
import 'package:provider/provider.dart';
import 'package:sura_flutter/sura_flutter.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  static final MaterialColor primaryColor = SuraColor.toMaterial(0xFF1ABC9C);
  static final MaterialColor accentColor = SuraColor.toMaterial(0xFFCC5D38);

  @override
  Widget build(BuildContext badContextXD) {
    return ChangeNotifierProvider(
      create: (_) => MenuProvider(),
      child: Consumer<MenuProvider>(
        builder: (context, menu, child) => MaterialApp(
          title: 'Chunlee Thong',
          theme: menu.darkTheme
              ? ThemeData(
                  fontFamily: "Saira",
                  brightness: Brightness.dark,
                  accentColor: accentColor,
                )
              : ThemeData(
                  primarySwatch: primaryColor,
                  accentColor: accentColor,
                  fontFamily: "Saira",
                ),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
  }
}
