import 'package:flutter/material.dart';
import 'package:linkedIn/components/nav.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/models/Posts.dart';
import 'package:linkedIn/widgets/Circle.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostModel>(context, listen: false).fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final list = new List<int>.generate(15, (i) => i + 1);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: kHomePageBackground,
          child: Column(
            children: [
              Nav(),
              ...Provider.of<PostModel>(context, listen: false)
                  .notifications
                  .map((x) => Container(
                        padding: EdgeInsets.all(size.width * 0.03),
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 0.5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Circle(
                              url: x["image"],
                              width: size.width * 0.13,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        x["text1"],
                                        style: TextStyle(
                                            color: Color(0xFF5c5c5c),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(x["text2"],
                                          style: TextStyle(
                                              color: Color(0xFF797979),
                                              fontSize: 12)),
                                      // Text(x["text3"] != null ? x["text3"] : "",
                                      //     style: TextStyle(
                                      //         color: Color(0xFF797979),
                                      //         fontSize: 12))
                                    ],
                                  ),
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
                                    x["published"],
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
