import 'package:flutter/material.dart';

class StatusBarModel extends ChangeNotifier {
  Color _bgColor = Colors.white;
  bool _darkTheme = true;

  bool get statusTheme {
    return _darkTheme;
  }

  Color get bg {
    return _bgColor;
  }

  void alterTheme(Color color, bool darkTheme) {
    _bgColor = color;
    _darkTheme = darkTheme;
    notifyListeners();
  }
}
