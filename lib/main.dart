import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkedIn/components/drawer.dart';
import 'package:linkedIn/components/post.dart';
import 'package:linkedIn/components/statusList.dart';
import 'package:linkedIn/components/tabs.dart';
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
          drawer: SideBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [Nav(), StatusList(), Posts()],
            ),
          ),
          bottomNavigationBar: Footer(),
        ),
      ),
    );
  }
}
