import 'package:flutter/material.dart';

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
        color: Color(0xFFe9e6dd),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
      ),
    );
  }
}
