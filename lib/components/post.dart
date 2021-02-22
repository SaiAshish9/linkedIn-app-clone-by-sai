import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.54,
          margin: EdgeInsets.only(top: size.height * 0.01),
          color: Colors.white,
          width: size.width,
          child: null,
        ),
        Container(
          height: size.height * 0.54,
          margin: EdgeInsets.only(top: size.height * 0.01),
          color: Colors.white,
          width: size.width,
          child: null,
        ),
      ],
    );
  }
}
