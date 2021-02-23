import 'package:flutter/material.dart';
import 'package:linkedIn/constants/colors.dart';

class Story extends StatelessWidget {
  const Story({Key key, this.index}) : super(key: key);

  final index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(
          top: size.width * 0.03,
          left: size.width * 0.06,
          right: index == 9 ? size.width * 0.06 : 0,
        ),
        child: Column(children: [
          Container(
              width: size.width * 0.15,
              height: size.width * 0.15,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF3c9adc),
                        Color(0xFF3a99d9),
                        Color(0xFF5177d7),
                        Color(0xFF5773d4)
                      ]),
                  shape: BoxShape.circle),
              child: Container(
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      color: kHomePageBackground,
                      shape: BoxShape.circle,
                      image: index == 0
                          ? DecorationImage(
                              image: AssetImage("assets/images/stories.png"),
                            )
                          : null))),
          SizedBox(height: 10),
          Text(
            "Stories",
            style: kStoryTag,
          )
        ]));
  }
}
