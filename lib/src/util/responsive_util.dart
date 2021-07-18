import 'package:flutter/cupertino.dart';

class ResponsiveUtils {
  static bool isMobileOrTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isMobile = width <= 768;
    return isMobile;
  }
}
