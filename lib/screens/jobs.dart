import 'package:flutter/material.dart';
import 'package:linkedIn/components/nav.dart';
import 'package:linkedIn/constants/colors.dart';

class Jobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Nav(),
          Flexible(
            child: Container(
              color: kHomePageBackground,
            ),
          )
        ],
      ),
    );
  }
}
