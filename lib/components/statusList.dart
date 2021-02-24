import 'package:flutter/material.dart';
import 'package:linkedIn/models/Posts.dart';
import 'package:linkedIn/widgets/ownStory.dart';
import 'package:linkedIn/widgets/story.dart';
import 'package:provider/provider.dart';

class StatusList extends StatefulWidget {
  @override
  _StatusListState createState() => _StatusListState();
}

class _StatusListState extends State<StatusList> {
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
            !Provider.of<PostModel>(context, listen: false).loading
                ? Row(
                    children: [
                      Story(
                        assetImage: true,
                      ),
                      ...Provider.of<PostModel>(context, listen: false)
                          .statusList
                          .map((x) => Story(
                                data: x,
                              ))
                          .toList(),
                      SizedBox(width: size.width * 0.06)
                    ],
                  )
                : Row(
                    children: [
                      ...list
                          .map((x) => Story(
                              loading: true,
                              key: ValueKey(x),
                              index: list.indexOf(x)))
                          .toList()
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
