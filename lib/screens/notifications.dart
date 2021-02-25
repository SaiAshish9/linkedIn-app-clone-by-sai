import 'package:flutter/material.dart';
import 'package:linkedIn/components/nav.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/widgets/Circle.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final list = new List<int>.generate(10, (i) => i + 1);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: kHomePageBackground,
          child: Column(
            children: [
              Nav(),
              ...list
                  .map((x) => Container(
                        padding: EdgeInsets.all(size.width * 0.03),
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 0.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Circle(
                              url:
                                  "https://media-exp1.licdn.com/dms/image/C560BAQG_TJNOrn69GQ/company-logo_100_100/0/1593613570586?e=1622073600&v=beta&t=O0O0N8Ms1F0Ae1uKvmJcCYYk53NOtLBdmKFfcT-oQBc",
                              width: size.width * 0.13,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Wrap(
                                children: [
                                  Text(
                                    "DigitalOcean was live:",
                                    style: TextStyle(
                                        color: Color(0xFF5c5c5c),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                      "Want to make your frontends more dynamic? Join this 1-hour Tech Talk t learn how to build a ...",
                                      style: TextStyle(
                                          color: Color(0xFF797979),
                                          fontSize: 12)),
                                  Text("",
                                      style: TextStyle(
                                          color: Color(0xFF797979),
                                          fontSize: 12))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "3h",
                                    style: TextStyle(
                                        color: Color(0xFF939393), fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Color(0xFF939393),
                                    size: 12,
                                  )
                                ])
                          ],
                        ),
                      ))
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
