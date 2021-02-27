import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 3,
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0d66c3)),
    );
  }
}
