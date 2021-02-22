import 'package:flutter/material.dart';
import 'package:linkedIn/constants/colors.dart';

class Circle extends StatelessWidget {
  const Circle({Key key, @required this.width, @required this.url})
      : super(key: key);

  final double width;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.09,
      height: width * 0.09,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kHomePageBackground,
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
      ),
    );
  }
}
