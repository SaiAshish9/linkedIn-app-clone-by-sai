import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedIn/components/nav.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/constants/styles.dart';
import 'package:linkedIn/models/Posts.dart';
import 'package:linkedIn/widgets/Circle.dart';
import 'package:linkedIn/widgets/Indicator.dart';
import 'package:provider/provider.dart';

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostModel>(context, listen: false).fetchRecommendations();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final list = new List<int>.generate(9, (i) => i + 1);

    final List data = [
      {
        'title': "application developer",
        'company': "Google",
        'applied': "1d",
        'image':
            "https://media-exp1.licdn.com/dms/image/C4D0BAQHiNSL4Or29cg/company-logo_200_200/0/1519856215226?e=1622678400&v=beta&t=Gk-NMXOpe3LjgblWr2Hdng1xtkvriRCNNb0GKvHEPdM"
      },
      {
        'title': "sde intern",
        'company': "Amazon",
        'applied': "3d",
        'image':
            "https://media-exp1.licdn.com/dms/image/C560BAQHTvZwCx4p2Qg/company-logo_200_200/0/1612205615891?e=1622678400&v=beta&t=20SpCbR22pTvVUyGyg-T2WILqzBkRTVldp5Cez59kUk"
      },
      {
        'title': "application developer",
        'company': "Microsoft",
        'applied': "1w",
        'image':
            "https://media-exp1.licdn.com/dms/image/C560BAQH8hBKOFXvqag/company-logo_200_200/0/1609783110976?e=1622678400&v=beta&t=cC0ibHLzJUJsGgj5IvNX7FM0q8eJSmWeKWeoARkaG88"
      },
    ];

    return Scaffold(
        backgroundColor: kHomePageBackground,
        body: !Provider.of<PostModel>(context).loading
            ? Column(
                children: [
                  Nav(),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: size.width,
                            color: kHomePageBackground,
                            padding: EdgeInsets.only(top: 7, bottom: 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 7.0),
                                  child: Text(
                                    "Highlights",
                                    style: kReactionTitle,
                                  ),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 7,
                                      ),
                                      ...data
                                          .map((x) => Container(
                                                padding: EdgeInsets.all(12),
                                                margin:
                                                    EdgeInsets.only(right: 15),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(
                                                          0.0, 1.0), //(x,y)
                                                      blurRadius: 0.2,
                                                    ),
                                                  ],
                                                ),
                                                height: size.height * 0.36,
                                                width: size.width * 0.75,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Resume downloaded",
                                                                  style:
                                                                      kReactionText,
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Icon(
                                                                  Icons.circle,
                                                                  size: 3,
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  x["applied"],
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xFF5f5f5f),
                                                                      fontSize:
                                                                          13),
                                                                )
                                                              ],
                                                            ),
                                                            Icon(Icons.clear)
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "Your resume has been downloaded.Earn a skill badge to stand out even more.",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Color(
                                                                  0xFF757575)),
                                                        ),
                                                        SizedBox(
                                                          height: 12,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Image.network(
                                                              x["image"],
                                                              width:
                                                                  size.width *
                                                                      0.12,
                                                              height:
                                                                  size.width *
                                                                      0.12,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  x["title"],
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                                Text(x["company"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12)),
                                                                Text(
                                                                  "Bangalore Urban,Karnataka, India",
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xFFbcbcbc),
                                                                      fontSize:
                                                                          12),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      width: size.width * 0.72,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 6),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color: Color(
                                                              0xFF0d66c3)),
                                                      child: Center(
                                                        child: Text(
                                                          "Earn Skill Badges",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                      Container(
                                        width: size.width * 0.54,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                width: 1,
                                                color: Color(0xFF0d66c3))),
                                        child: Center(
                                          child: Text(
                                            "See more",
                                            style: TextStyle(
                                              color: Color(0xFF0d66c3),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: size.width,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Recent searches",
                                          style: TextStyle(
                                              color: Color(0xFF1a1a1a),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Clear",
                                          style: TextStyle(
                                              color: Color(0xFF666666),
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                SearchItem(
                                  title: "sde intern",
                                  location: "India",
                                  count: "198 new",
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                SearchItem(
                                  title: "sde",
                                  location: "India",
                                  count: "621 new",
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                SearchItem(
                                  title: "full stack developer",
                                  location: "Bangaluru,Karnataka,India",
                                  count: "63 new",
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  width: size.width * 0.92,
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          width: 1, color: Color(0xFF999999))),
                                  child: Center(
                                    child: Text(
                                      "See more",
                                      style: TextStyle(
                                          color: Color(0xFF999999),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.015),
                            color: Colors.white,
                            // height: size.height * 0.15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Circle(
                                    url: kProfilePicURL,
                                    width: size.width * 0.13),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Put your best foot forward. Hire a resume reviewer.",
                                        style: TextStyle(
                                            color: Color(0xFF686868),
                                            fontSize: 16),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: size.width * 0.27,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                width: 1,
                                                color: Color(0xFF4186ca))),
                                        child: Center(
                                          child: Text(
                                            "Get Started",
                                            style: TextStyle(
                                                color: Color(0xFF4186ca),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.more_vert,
                                  color: Color(0xFF939393),
                                  size: 18,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "Recommended for you",
                                    style: TextStyle(
                                        color: Color(0xFF1a1a1a),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  ...Provider.of<PostModel>(context,
                                          listen: false)
                                      .recommendations
                                      .map((x) => Recommendation(
                                            data: x,
                                          ))
                                      .toList()
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Container(
                child: Column(
                  children: [
                    Nav(),
                    Flexible(
                      child: Center(
                        child: Indicator(),
                      ),
                    )
                  ],
                ),
              ));
  }
}

class Recommendation extends StatelessWidget {
  const Recommendation({Key key, @required this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          data["image"],
          width: size.width * 0.12,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["title"],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4c4c4c),
                    fontSize: 15),
              ),
              Text(
                data["company"],
                style: TextStyle(fontSize: 14),
              ),
              Text(
                data["location"],
                style: TextStyle(fontSize: 14, color: Color(0xFF8f9092)),
              ),
              SizedBox(
                height: 18,
              ),
              data["easyApply"]
                  ? Row(
                      children: [
                        Text(
                          "3 weeks ago",
                          style: TextStyle(
                              fontSize: 12,
                              // fontWeight: FontWeight.w600,
                              color: Color(0xFF8f9092)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.circle,
                          size: 3,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          "assets/icons/logo.svg",
                          width: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Easy Apply",
                          style: TextStyle(
                              fontSize: 12,
                              // fontWeight: FontWeight.w600,
                              color: Color(0xFF8f9092)),
                        ),
                      ],
                    )
                  : Container(),
              Divider(
                height: 18,
              )
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.more_vert,
              color: Color(0xFF939393),
              size: 18,
            ),
          ],
        )
      ],
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({this.title, this.location, this.count});

  final String title;
  final String location;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  count,
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF286b44),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              location,
              style: TextStyle(fontSize: 12, color: Color(0xFF929292)),
            ),
            Divider(
              height: 1,
              color: Color(0xFF999999),
            )
          ],
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}
