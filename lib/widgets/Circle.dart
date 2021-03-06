import 'package:flutter/material.dart';
import 'package:linkedIn/constants/colors.dart';

class Circle extends StatelessWidget {
  const Circle({Key key, @required this.width, @required this.url})
      : super(key: key);

  final String url;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kHomePageBackground,
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
      ),
    );
  }
}
