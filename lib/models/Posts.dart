import 'dart:async';

import 'package:flutter/material.dart';

class PostModel with ChangeNotifier {
  bool _loading = true;

  stopLoading() async {
    load() {
      _loading = false;
      notifyListeners();
    }

    return Timer(Duration(seconds: 5), load);
  }

  bool get loading {
    return _loading;
  }
}
