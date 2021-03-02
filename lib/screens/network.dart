import 'package:flutter/material.dart';
import 'package:linkedIn/components/nav.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/models/Posts.dart';
import 'package:linkedIn/widgets/Circle.dart';
import 'package:linkedIn/widgets/Indicator.dart';
import 'package:provider/provider.dart';

class Network extends StatefulWidget {
  @override
  _NetworkState createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  ScrollController _controller;
  var scrolled = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    Provider.of<PostModel>(context, listen: false).fetchConnections();
  }

  void _scrollListener() {
    // if (_controller.offset >= _controller.position.maxScrollExtent / 2 &&
    //     !_controller.position.outOfRange) {
    //   setState(() {
    //     scrolled = true;
    //   });
    // }
    // if (_controller.offset <= _controller.position.minScrollExtent / 2 &&
    //     !_controller.position.outOfRange) {
    //   setState(() {
    //     scrolled = false;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final list = new List<int>.generate(9, (i) => i + 1);

    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Opacity(
          opacity: 1,
          child: FloatingActionButton(
            backgroundColor: Color(0xFF0c65bf),
            onPressed: () {},
            child: Icon(Icons.person_add_alt_1),
          ),
        ),
        body: !Provider.of<PostModel>(context).loading
            ? Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Stack(
                      alignment: Alignment(0.0, 300),
                      children: [
                        Nav(),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    controller: _controller,
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.1),
                      child: Column(
                        children: [
                          Option(text: "Manage my network"),
                          // SizedBox(
                          //   height: 7,
                          // ),
                          Container(
                            height: 7,
                            color: kHomePageBackground,
                          ),
                          Option(text: "Invitations"),
                          Container(
                            height: 7,
                            color: kHomePageBackground,
                          ),
                          Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: size.width * 0.04),
                              width: size.width,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "People you may know",
                                      style: TextStyle(
                                          color: Color(0xFF404040),
                                          fontSize: 16),
                                    ),
                                    GridView(
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      padding: const EdgeInsets.only(
                                          left: 2, bottom: 1),
                                      children: Provider.of<PostModel>(context)
                                          .connections
                                          .map((x) => Connection(data: x))
                                          .toList(),
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 300,
                                              childAspectRatio: 0.65,
                                              // items should be sized with height and width
                                              mainAxisSpacing: 0,
                                              crossAxisSpacing: 0
                                              // spacing between columns and rows of grid
                                              ),
                                    ),
                                  ]))
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Nav(),
                  Container(
                      height: size.height * 0.82,
                      color: kHomePageBackground,
                      child: Center(child: Indicator())),
                ],
              ));
  }
}

class Connection extends StatefulWidget {
  const Connection({Key key, this.data}) : super(key: key);

  final data;

  @override
  _ConnectionState createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 9),
      width: size.width * 0.44,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      child: Stack(
        children: [
          Container(
            width: size.width * 0.44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF999999),
                  blurRadius: 1.0,
                  spreadRadius: 0.0,
                  // shadow direction: bottom right
                )
              ],
            ),
            child: Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.1,
                      width: size.width * 0.44,
                      decoration: BoxDecoration(
                          color: kHomePageBackground,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.data["background"],
                              ),
                              fit: BoxFit.fill)),
                    ),
                    Positioned(
                      right: 3,
                      top: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(27)),
                        child: Icon(
                          Icons.cancel,
                          color: Color(0xFF6d7374),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 27,
                      child: Container(
                        width: size.width * 0.44,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Circle(
                                  url: widget.data["avatar"],
                                  width: size.width * 0.21),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      margin: EdgeInsets.only(top: size.height * 0.15),
                      width: size.width * 0.44,
                      child: Column(
                        children: [
                          Text(
                            widget.data["title"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(
                            widget.data["description"],
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFadadad),
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.all_inclusive,
                                size: 16,
                                color: Color(0xFFadadad),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: size.width * 0.2,
                                child: Text(
                                  "${widget.data['count']} mutual connections",
                                  style: TextStyle(
                                      color: Color(0xFFadadad), fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 18),
                            padding: EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 1, color: Color(0xFF0d66c3))),
                            child: Center(
                              child: Text(
                                "Connect",
                                style: TextStyle(
                                    color: Color(0xFF0d66c3),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option({Key key, this.text}) : super(key: key);

  final text;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: size.width * 0.036),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF387dbd)),
            ),
            Icon(Icons.keyboard_arrow_right, color: Color(0xFF989898))
          ],
        ),
      ),
    );
  }
}
