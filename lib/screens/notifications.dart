import 'package:flutter/material.dart';
import 'package:linkedIn/components/nav.dart';
import 'package:linkedIn/constants/colors.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: kHomePageBackground,
        child: Column(
          children: [Nav()],
        ),
      ),
    );
  }
}
