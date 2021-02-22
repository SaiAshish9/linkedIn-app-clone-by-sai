import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width * 0.836,
      color: Colors.white,
      child: Drawer(),
    );
  }
}
