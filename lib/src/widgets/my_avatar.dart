import 'package:flutter/material.dart';
import 'package:my_portfolio/src/provider/menu_provider.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MenuProvider.getProvider(context).toggleTheme();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white12,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(12),
        child: CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage("assets/img/profile.jpg"),
        ),
      ),
    );
  }
}
