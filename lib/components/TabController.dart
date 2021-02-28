import 'package:flutter/material.dart';
import 'package:linkedIn/models/Footer.dart';
import 'package:linkedIn/screens/createPost.dart';
import 'package:linkedIn/screens/home.dart';
import 'package:linkedIn/screens/jobs.dart';
import 'package:linkedIn/screens/network.dart';
import 'package:linkedIn/components/tabs.dart';
import 'package:linkedIn/screens/notifications.dart';
import 'package:provider/provider.dart';

class TabControllers extends StatefulWidget {
  @override
  _TabControllersState createState() => _TabControllersState();
}

class _TabControllersState extends State<TabControllers> {
  List pages = [Home(), Network(), CreatePost(), Notifications(), Jobs()];

  int _index = 0;

  void _selectPage(int i) {
    setState(() {
      _index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: pages[_index],
        bottomNavigationBar: Provider.of<FooterModel>(context).display
            ? Footer(onTap: _selectPage)
            : null,
      ),
    );
  }
}
