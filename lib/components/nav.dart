import 'package:flutter/material.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/widgets/Circle.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ctx = MediaQuery.of(context);
    // CircularProgressIndicator

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
            Expanded(
              child: Container(
                height: width * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Color(0xFFeef3f8),
                ),
                margin:
                    EdgeInsets.only(left: width * 0.036, right: 0.0036 * width),
              ),
            ),
            // GestureDetector
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(
                    "assets/images/sms.png",
                    height: width * 0.09,
                    width: width * 0.09,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// IconButton(
//   onPressed: (){},
//   icon: Icon(Icons.sms_outlined, size: 30, color: kIconColor),
// )
