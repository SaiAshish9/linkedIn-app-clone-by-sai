import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkedIn/components/statusList.dart';
import 'package:linkedIn/components/tabs.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/models/Posts.dart';
import 'package:linkedIn/models/StatusBar.dart';
import 'package:linkedIn/widgets/post.dart';
import 'package:provider/provider.dart';

import 'drawer.dart';
import 'nav.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostModel>(context, listen: false).stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:
            Provider.of<StatusBarModel>(context, listen: false).bg));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness:
            Provider.of<StatusBarModel>(context, listen: false).statusTheme
                ? Brightness.dark
                : Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: kHomePageBackground,
        drawer: SideBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Nav(),
              StatusList(),
              Provider.of<PostModel>(context).loading
                  ? Container(
                      margin: EdgeInsets.only(top: 18),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 0.4,
                            color: Color(0xFF999999))
                      ], shape: BoxShape.circle, color: Colors.white),
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF237da7)),
                        ),
                      ))
                  : Column(
                      children: [
                        ...Provider.of<PostModel>(context, listen: false)
                            .posts
                            .map((x) => Post(data: x))
                            .toList(),
                      ],
                    )
            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
