import 'package:flutter/material.dart';

class ContentWrapper extends StatelessWidget {
  final Widget child;

  const ContentWrapper({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      height: MediaQuery.of(context).size.height,
      child: child,
    );
  }
}
