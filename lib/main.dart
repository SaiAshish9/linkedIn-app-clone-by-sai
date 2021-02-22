import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkedIn/constants/colors.dart';

import 'components/nav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: kHomePageBackground,
          body: Column(
            children: [Nav()],
          ),
        ),
      ),
    );
  }
}
