import 'package:flutter/material.dart';
import 'package:linkedIn/components/Circle.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ctx = MediaQuery.of(context);

    return Container(
      margin: EdgeInsets.only(top: ctx.padding.top),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
            left: width * 0.04,
            right: width * 0.04,
            top: width * 0.02,
            bottom: width * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          // background:
          children: [
            Circle(
                width: width,
                url:
                    'https://media-exp1.licdn.com/dms/image/C5103AQHgT7zgMfogQg/profile-displayphoto-shrink_100_100/0/1571595910289?e=1619654400&v=beta&t=omQapUdHmJkLDptbnopvIHZcpPkuHGd2uPpxLMPWilg'),
          ],
        ),
      ),
    );
  }
}
