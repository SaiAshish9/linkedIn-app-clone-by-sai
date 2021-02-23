import 'package:flutter/material.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/widgets/Circle.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width * 0.836,
      color: Colors.white,
      child: Drawer(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              Container(
                width: size.width * 0.836,
                color: Color(0xFFf3f2ee),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Circle(
                                    width: size.width * 0.13,
                                    url: kProfilePicURL),
                                Container(
                                  height: size.width * 0.12,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sai Ashish",
                                        style: TextStyle(
                                            fontFamily: "SF-UI",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "View Profile",
                                            style: TextStyle(
                                                color: kDarkLinkColor,
                                                fontFamily: "SF-UI",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Icon(
                                            Icons.circle,
                                            size: 3.6,
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            "Settings",
                                            style: TextStyle(
                                                color: kDarkLinkColor,
                                                fontFamily: "SF-UI",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.close))
                          ],
                        ),
                      ),
                    ),
                    Divider(height: 0),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/bag.svg",
                              height: 20,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text("Try Premium Free for 1 Month",
                                style: TextStyle(fontSize: 15))
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
