import 'package:flutter/material.dart';

class FooterModel extends ChangeNotifier {
  bool _display = true;

  bool get display {
    return _display;
  }

  void toggleDisplay() {
    _display = !_display;
  }
}
