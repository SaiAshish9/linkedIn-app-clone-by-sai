import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  AnimationController controller;
  Animation animation;

  void _onItemTapped(int index) {
    if (index == 0) {
      controller.reverse();
    } else {
      controller.forward();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.reverse();
    controller.addListener(() {
      setState(() {});
    });
    animation.addStatusListener((status) {});
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 5.4,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedLabelStyle:
          TextStyle(fontFamily: 'SF-UI', fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          TextStyle(fontFamily: 'SF-UI', fontWeight: FontWeight.w500),
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
              Positioned(
                top: 0,
                height: 9,
                width: 9 * animation.value,
                right: 2.5,
                child: Opacity(
                  opacity: animation.value,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        color: Color(0xFFd3342f),
                        shape: BoxShape.circle),
                  ),
                ),
              )
            ],
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Stack(children: [
            Icon(_selectedIndex == 1
                ? Icons.people_alt
                : Icons.people_alt_outlined),
            // Positioned(
            //     top: -3,
            //     right: 0,
            //     child: Text(
            //       "1",
            //       style: TextStyle(
            //           color: Color(0xFFd3342f),
            //           fontWeight: FontWeight.w900,
            //           fontSize: 13),
            //     ))
          ]),
          label: 'My Network',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              _selectedIndex == 2 ? Icons.add_box : Icons.add_box_outlined),
          label: 'Post',
        ),
        BottomNavigationBarItem(
          icon: Icon(_selectedIndex == 3
              ? Icons.notifications
              : Icons.notifications_none_outlined),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(_selectedIndex == 4 ? Icons.work : Icons.work_outlined),
          label: 'Jobs',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Color(0xFF8c8c8c),
      onTap: _onItemTapped,
    );
  }
}
