import 'package:flutter/material.dart';
import 'package:linkedIn/constants/colors.dart';

import 'Circle.dart';

class OwnStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin:
            EdgeInsets.only(top: size.width * 0.03, left: size.width * 0.06),
        child: Column(children: [
          Stack(children: [
            Circle(
              url: kProfilePicURL,
              width: size.width * 0.15,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 21,
                  width: 21,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 0.6,
                        color: Color(0xFF999999))
                  ], shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: Icon(Icons.add, size: 18, color: Color(0xFF2e7bab)),
                  ),
                ))
          ]),
          SizedBox(height: 10),
          Text(
            "Your story",
            style: kStoryTag,
          )
        ]));
  }
}
