import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MenuProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  static MenuProvider getProvider(BuildContext context) => Provider.of<MenuProvider>(context, listen: false);

  late double _height;

  void initScrollListener(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    scrollController.addListener(_listener);
  }

  void _listener() {
    double offset = scrollController.offset;
    int positionIndex = (offset ~/ _height).clamp(0, 4);
    if (positionIndex != _selectedIndex) {
      print("Reselect index: $positionIndex");
      _selectedIndex = positionIndex;
      notifyListeners();
    }
  }

  int _selectedIndex = 0;

  int get index => _selectedIndex;

  bool _expandMenu = false;

  bool get expandMenu => _expandMenu;

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    notifyListeners();
  }

  void toggleMenu() {
    _expandMenu = !_expandMenu;
    notifyListeners();
  }

  void closeMenu() {
    _expandMenu = false;
    notifyListeners();
  }

  void scrollToSection(BuildContext context, int index) async {
    ///prevent spam
    if (!scrollController.hasListeners) {
      return;
    }
    _selectedIndex = index;
    _expandMenu = false;
    notifyListeners();

    ///Remove listener to prevent glitch when animate
    scrollController.removeListener(_listener);
    await scrollController.animateTo(
      (_height * index) + 10,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOutExpo,
    );

    ///Add listener back
    scrollController.addListener(_listener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
