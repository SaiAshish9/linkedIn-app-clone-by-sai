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
            Circle(width: width * 0.09, url: kProfilePicURL),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 21,
                          ),
                          SizedBox(width: 4),
                          Text("Search",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .fontFamily))
                        ],
                      ),
                      Icon(
                        Icons.qr_code,
                        size: 18,
                      )
                    ],
                  ),
                ),
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
