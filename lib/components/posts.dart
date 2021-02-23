import 'package:flutter/material.dart';
import 'package:linkedIn/widgets/post.dart';

class Posts extends StatelessWidget {
  final list = new List<int>.generate(6, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [...list.map((x) => Post()).toList()],
    );
  }
}
