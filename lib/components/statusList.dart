import 'package:flutter/material.dart';
import 'package:linkedIn/widgets/ownStory.dart';
import 'package:linkedIn/widgets/story.dart';

class StatusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final list = new List<int>.generate(10, (i) => i + 1);

    return Container(
      padding: EdgeInsets.only(bottom: size.width * 0.03),
      color: Colors.white,
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            OwnStory(),
            ...list
                .map((x) => Story(key: ValueKey(x), index: list.indexOf(x)))
                .toList()
          ],
        ),
      ),
    );
  }
}
