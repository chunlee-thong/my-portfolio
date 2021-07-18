import 'package:flutter/material.dart';
import 'package:my_portfolio/src/widgets/content_layout.dart';
import 'package:my_portfolio/src/widgets/content_wrapper.dart';

class OtherSkillContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SectionTitle(title: "Other Skills"),
        ],
      ),
    );
  }
}
