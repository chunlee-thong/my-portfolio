import 'package:flutter/material.dart';
import 'package:my_portfolio/src/constant/style_decoration.dart';
import 'package:sura_flutter/sura_flutter.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // //color: context.primaryColor,
      // height: 100,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Divider(height: 0),
          SpaceY(24),
          Text(
            "Copyright 2021 @Chunlee Thong",
            style: kMuliTextStyle.copyWith(
              color: context.textTheme.bodyText2?.color,
              fontSize: 16,
            ),
          ),
          Text(
            "Made with Flutter ❤",
            style: kMuliTextStyle.copyWith(
              color: context.textTheme.bodyText2?.color,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
