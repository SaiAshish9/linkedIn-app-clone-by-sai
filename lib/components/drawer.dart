import 'package:flutter/material.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/screens/profile.dart';
import 'package:linkedIn/widgets/Circle.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List recentTasks = ['google', 'india'];

    return Container(
      height: size.height,
      width: size.width * 0.836,
      color: Colors.white,
      child: Drawer(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      Profile.routeName);
                                            },
                                            child: Text(
                                              "View Profile",
                                              style: TextStyle(
                                                  color: kDarkLinkColor,
                                                  fontFamily: "SF-UI",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                            ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Details(
                      text: Text("Recent", style: kLink),
                      recentTasks: recentTasks),
                  Divider(
                    height: 0,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text("Groups", style: kActiveLink)),
                  Divider(
                    height: 0,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Events", style: kActiveLink),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.add,
                                color: Color(0xFF3c3c3c),
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text("Create Event",
                                  style: TextStyle(
                                      color: kDarkLinkColor,
                                      fontFamily: "SF-UI",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ],
                          )
                        ],
                      )),
                  Divider(
                    height: 0,
                  ),
                  Details(
                      text: Text("Followed Hashtags", style: kActiveLink),
                      recentTasks: recentTasks),
                  Divider(
                    height: 0,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text("Discover more", style: kActiveLink))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    Key key,
    @required this.text,
    @required this.recentTasks,
  }) : super(key: key);

  final List recentTasks;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text,
          SizedBox(height: 10),
          ...recentTasks
              .map((x) => Container(
                  margin: EdgeInsets.only(left: 17, top: 15),
                  child: Text("#  $x",
                      style: TextStyle(
                          color: Color(0xFF3c3c3c),
                          fontSize: 14,
                          fontWeight: FontWeight.w600))))
              .toList(),
        ],
      ),
    );
  }
}
